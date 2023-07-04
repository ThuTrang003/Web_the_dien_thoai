package com.example.asm_trangdttph27721.repository;

import com.example.asm_trangdttph27721.model.TheDienThoai;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface ITheDienToaiRepository extends JpaRepository<TheDienThoai, Integer> {

    List<TheDienThoai> findByTenContains(String text);
}
