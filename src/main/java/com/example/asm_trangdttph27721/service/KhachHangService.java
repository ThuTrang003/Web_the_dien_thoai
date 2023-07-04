package com.example.asm_trangdttph27721.service;

import com.example.asm_trangdttph27721.model.KhachHang;
import com.example.asm_trangdttph27721.repository.IKhachHangRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class KhachHangService {
    @Autowired
    private IKhachHangRepository repository;

    public KhachHang findById(Integer id) {
        return repository.findById(id).get();
    }

    public KhachHang findByEmailAndMatKhau(String email, String matKhau) {
        return repository.findByEmailAndMatKhau(email, matKhau);
    }

    public void insert(KhachHang khachHang) {
        int maKH = (int) Math.floor(Math.random() * 10000);
        khachHang.setMa("KH"+maKH);
        repository.save(khachHang);
    }
}
