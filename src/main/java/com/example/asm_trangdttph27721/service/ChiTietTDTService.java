package com.example.asm_trangdttph27721.service;

import com.example.asm_trangdttph27721.model.ChiTietTDT;
import com.example.asm_trangdttph27721.model.TheDienThoai;
import com.example.asm_trangdttph27721.repository.IChiTietTDTRepository;
import com.example.asm_trangdttph27721.repository.ITheDienToaiRepository;
import com.example.asm_trangdttph27721.response.ChiTietTDTReponse;
import com.example.asm_trangdttph27721.response.IChiTietTDT;
import com.example.asm_trangdttph27721.response.TopTonKho;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class ChiTietTDTService {
    @Autowired
    private IChiTietTDTRepository repository;

    @Autowired
    private ITheDienToaiRepository tdtRepository;

    public Page<ChiTietTDT> findAll(Pageable pageable) {
        return repository.findAll(pageable);
    }

    public void insert(ChiTietTDT chiTietTDT) {
        chiTietTDT.setTrangThai(1);
        chiTietTDT.setNgayTao(new Date());

        TheDienThoai tdt = tdtRepository.findById(chiTietTDT.getTheDienThoai().getId()).get();
        tdt.setSoLuongTon(tdt.getSoLuongTon() + 1);

        repository.save(chiTietTDT);
        tdtRepository.save(tdt);// Update số lượng tdt
    }

    public void update(Integer id, ChiTietTDT chiTietTDT) {
        Optional<ChiTietTDT> optionalProduct = repository.findById(id);
        if (optionalProduct.isEmpty()) {
            return;
        }
        ChiTietTDT pro = optionalProduct.get();
        pro.setTheDienThoai(chiTietTDT.getTheDienThoai());
        pro.setMa(chiTietTDT.getMa());
        pro.setMaThe(chiTietTDT.getMaThe());
        pro.setSoSeri(chiTietTDT.getSoSeri());
        pro.setTrangThai(1);
        pro.setGiaBan(chiTietTDT.getGiaBan());
        pro.setGiaNhap(chiTietTDT.getGiaNhap());
        repository.save(pro);
    }

    public void delete(Integer id) {
        repository.deleteById(id);
    }

    public ChiTietTDT findById(Integer id) {
        return repository.findById(id).get();
    }

    public Page<ChiTietTDT> findByTheDienThoai(TheDienThoai tdt, Pageable pageable) {
        return repository.findByTheDienThoaiAndTrangThai(tdt, 1, pageable);
    }

    public Page<ChiTietTDT> findByGiaBanBetween(BigDecimal begin, BigDecimal end, Pageable pageable) {
        return repository.findByGiaBanBetween(begin, end, pageable);
    }

    public List<TopTonKho> topSanPhamTonKho(Date startDate, Date endDate) {
        return repository.topSanPhamTonKhoByNgay(startDate, endDate);
    }

    public  List<TopTonKho> topSanPhamTonKhoByThang(Integer month) {
        return repository.topSanPhamTonKhoByThang(month);
    }

    public List<TopTonKho> topSanPhamTonKhoByNam(Integer year){
        return repository.topSanPhamTonKhoByNam(year);
    }

    public List<ChiTietTDT> findAllByTrangThaiNotInKhuyenMai() {
        return repository.findAllByTrangThaiNotInKhuyenMai(new Date());
    }

    public Page<IChiTietTDT> findByTDTAandTrangThaiaAndKm(TheDienThoai tdt, Pageable pageable) {
        return repository.findByTheDienThoaiAndTrangThaiAndKm(tdt.getId(), pageable);
    }

    public IChiTietTDT findProductWithPromotion(int productId, Date currentDate) {
        return  repository.findProductWithPromotion(productId,currentDate);
    }
}
