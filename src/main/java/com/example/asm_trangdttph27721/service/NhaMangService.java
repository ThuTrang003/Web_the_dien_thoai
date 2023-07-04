package com.example.asm_trangdttph27721.service;

import com.example.asm_trangdttph27721.model.NhaMang;
import com.example.asm_trangdttph27721.repository.INhaMangRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NhaMangService {
    @Autowired
    private INhaMangRepository repository;

    public List<NhaMang> findAll() {
        return repository.findAll();
    }
}
