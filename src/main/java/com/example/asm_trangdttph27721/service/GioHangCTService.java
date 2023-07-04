package com.example.asm_trangdttph27721.service;

import com.example.asm_trangdttph27721.model.ChiTietTDT;
import com.example.asm_trangdttph27721.model.GioHang;
import com.example.asm_trangdttph27721.model.GioHangCT;
import com.example.asm_trangdttph27721.model.KhachHang;
import com.example.asm_trangdttph27721.repository.IChiTietTDTRepository;
import com.example.asm_trangdttph27721.repository.IGioHangCTReposiotry;
import com.example.asm_trangdttph27721.repository.IGioHangRepository;
import com.example.asm_trangdttph27721.repository.IKhachHangRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Service
public class GioHangCTService {
    @Autowired
    private IGioHangCTReposiotry repository;
    @Autowired
    private IKhachHangRepository khRepository;
    @Autowired
    private IGioHangRepository ghRepository;
    @Autowired
    private IChiTietTDTRepository chiTietTDTRepository;

    public Page<GioHangCT> findAll(Pageable pageable) {
        return repository.findAll(pageable);
    }

    public Page<GioHangCT> findAllByKhachHang(Integer idKH, Pageable pageable) {
        return repository.findAllByKhachHang(idKH, pageable);
    }

    public List<GioHangCT> getAll(Integer idKH) {
        return repository.findAllByKH(idKH);
    }

    public void insert(Integer idTDTChiTiet, KhachHang kh, BigDecimal donGiaKhiGiam) {
//        KhachHang kh = khRepository.findById(1).get();
        GioHang gh = ghRepository.findByKhachHang(kh);
        Date ngayTao = new Date();
        String nguoiNhan = kh.getTen();
        String sdt = kh.getSdt();
        if (gh == null) {
            int ma = (int)Math.floor(Math.random() * 1000);
            gh = new GioHang();
            gh.setMa("GH"+ma);
            gh.setNgayTao(ngayTao);
            gh.setTenNguoiNhan(nguoiNhan);
            gh.setSdt(sdt);
            gh.setTinhTrang(0);
            gh.setKhachHang(kh);
            ghRepository.save(gh);
            gh = ghRepository.findByKhachHang(kh);
        }
        ChiTietTDT chiTietTDT = chiTietTDTRepository.findById(idTDTChiTiet).get();

        GioHangCT gioHangCT = new GioHangCT();
        int maGH = (int) Math.floor(Math.random() * 1000);
        gioHangCT.setMa("GHCT" + maGH);
        gioHangCT.setGioHang(gh);
        gioHangCT.setChiTietTDT(chiTietTDT);
        gioHangCT.setSoLuong(1);
        gioHangCT.setDonGia(chiTietTDT.getGiaBan());
        gioHangCT.setDonGiaKhiGiam(donGiaKhiGiam);
        repository.save(gioHangCT);
//        Cập nhật trạng thái của sản phẩm - đã đặt (2)
        chiTietTDT.setTrangThai(2);
        chiTietTDTRepository.save(chiTietTDT);

    }

    public void delete(Integer id) {
        repository.deleteById(id);
    }

    public GioHangCT findById(Integer id) {
        return repository.findById(id).get();
    }
}
