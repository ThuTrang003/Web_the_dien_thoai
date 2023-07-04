package com.example.asm_trangdttph27721.service;

import com.example.asm_trangdttph27721.model.KhuyenMai;
import com.example.asm_trangdttph27721.repository.IKhuyenMaiRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class KhuyenMaiService {
    @Autowired
    private IKhuyenMaiRepository repository;

    public List<KhuyenMai> findAll(){
        return repository.findAll();
    }

    public KhuyenMai findByMa(String ma){
        return repository.findByMa(ma);
    }

    public KhuyenMai findById(Integer id){
        return repository.findById(id).get();
    }

    public void insert(KhuyenMai khuyenMai) {
        repository.save(khuyenMai);
    }

    public void update(Integer id, KhuyenMai khuyenMai) {
        KhuyenMai km = repository.findById(id).get();
        km.setMa(khuyenMai.getMa());
        km.setNgayBatDau(khuyenMai.getNgayBatDau());
        km.setNgayKetThuc(khuyenMai.getNgayKetThuc());
        km.setTiemGiam(khuyenMai.getTiemGiam());
        repository.save(km);
    }
}
