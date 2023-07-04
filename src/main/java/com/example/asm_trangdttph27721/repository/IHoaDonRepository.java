package com.example.asm_trangdttph27721.repository;

import com.example.asm_trangdttph27721.model.HoaDon;
import com.example.asm_trangdttph27721.model.KhachHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IHoaDonRepository extends JpaRepository<HoaDon, Integer> {
    HoaDon findByMa(String ma);

    List<HoaDon> findByKhachHang(KhachHang khachHang);
}
