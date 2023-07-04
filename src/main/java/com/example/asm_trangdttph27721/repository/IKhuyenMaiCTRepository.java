package com.example.asm_trangdttph27721.repository;

import com.example.asm_trangdttph27721.model.KhuyenMai;
import com.example.asm_trangdttph27721.model.KhuyenMaiChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IKhuyenMaiCTRepository extends JpaRepository<KhuyenMaiChiTiet, Integer> {
    List<KhuyenMaiChiTiet> findByKhuyenMai(KhuyenMai khuyenMai);
}
