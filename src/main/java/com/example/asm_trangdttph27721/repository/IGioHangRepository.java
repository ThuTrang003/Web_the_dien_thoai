package com.example.asm_trangdttph27721.repository;

import com.example.asm_trangdttph27721.model.GioHang;
import com.example.asm_trangdttph27721.model.KhachHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IGioHangRepository extends JpaRepository<GioHang, Integer> {

    GioHang findByKhachHang(KhachHang khachHang);
}
