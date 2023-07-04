package com.example.asm_trangdttph27721.repository;

import com.example.asm_trangdttph27721.model.KhachHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IKhachHangRepository extends JpaRepository<KhachHang, Integer> {
    KhachHang findByEmailAndMatKhau(String email, String matKhau);
}
