package com.example.asm_trangdttph27721.service;

import com.example.asm_trangdttph27721.model.HoaDon;
import com.example.asm_trangdttph27721.model.KhachHang;
import com.example.asm_trangdttph27721.repository.IHoaDonCTRepository;
import com.example.asm_trangdttph27721.repository.IHoaDonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HoaDonService {
    @Autowired
    private IHoaDonRepository hoaDonRepository;

    public List<HoaDon> findAll() {
        return hoaDonRepository.findAll();
    }

    public List<HoaDon> findByKhachHang(KhachHang khachHang) {
        return hoaDonRepository.findByKhachHang(khachHang);
    }

    public void insert(HoaDon hoaDon) {
        hoaDonRepository.save(hoaDon);
    }

    public void update(HoaDon hoaDon) {
        hoaDonRepository.save(hoaDon);
    }

    public HoaDon findByMa(String ma) {
        return hoaDonRepository.findByMa(ma);
    }

    public HoaDon findByID(Integer id) {
        return hoaDonRepository.findById(id).get();
    }
}
