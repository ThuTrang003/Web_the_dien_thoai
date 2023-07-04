package com.example.asm_trangdttph27721.service;

import com.example.asm_trangdttph27721.model.HoaDon;
import com.example.asm_trangdttph27721.model.HoaDonCT;
import com.example.asm_trangdttph27721.repository.IHoaDonCTRepository;
import com.example.asm_trangdttph27721.response.SoLuongSanPham;
import com.example.asm_trangdttph27721.response.TopBanChay;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class HoaDonCTService {
    @Autowired
    private IHoaDonCTRepository repository;

    public List<HoaDonCT> findAll() {
        return repository.findAll();
    }

    public void insert(HoaDonCT hoaDonCT) {
        repository.save(hoaDonCT);
    }

    public HoaDonCT findByMa(String ma) {
        return repository.findByMa(ma);
    }

    public void saveAll(List<HoaDonCT> list) {
        repository.saveAll(list);
    }

    public List<HoaDonCT> findByHoaDon(HoaDon hoaDon) {
        return repository.findByHoaDon(hoaDon);
    }

    public List<SoLuongSanPham> countSanPhamByTheDienThoai(Integer id) {
        return repository.countSanPhamByTheDienThoai(id);
    }

    public List<TopBanChay> topSanPhamBanCHay(Date startDate, Date endDate) {
        return repository.topSanPhamBanCHay(startDate, endDate);
    }

    public List<TopBanChay> topSanPhamBanCHayByThang(Integer month) {
        return repository.topSanPhamBanCHayByThang(month);
    }

    public List<TopBanChay> topSanPhamBanCHayByNam(@Param("year") Integer year) {
        return repository.topSanPhamBanCHayByNam(year);
    }
}
