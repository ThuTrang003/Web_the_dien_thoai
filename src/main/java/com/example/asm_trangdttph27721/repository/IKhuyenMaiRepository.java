package com.example.asm_trangdttph27721.repository;

import com.example.asm_trangdttph27721.model.KhuyenMai;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IKhuyenMaiRepository extends JpaRepository<KhuyenMai, Integer> {
    KhuyenMai findByMa(String ma);
}
