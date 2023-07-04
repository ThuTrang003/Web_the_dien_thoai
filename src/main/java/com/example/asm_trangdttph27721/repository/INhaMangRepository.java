package com.example.asm_trangdttph27721.repository;

import com.example.asm_trangdttph27721.model.NhaMang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface INhaMangRepository extends JpaRepository<NhaMang, Integer> {
}
