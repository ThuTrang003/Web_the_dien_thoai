package com.example.asm_trangdttph27721.service;

import com.example.asm_trangdttph27721.model.ChiTietTDT;
import com.example.asm_trangdttph27721.model.TheDienThoai;
import com.example.asm_trangdttph27721.repository.ITheDienToaiRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TheDienThoaiService {

    @Autowired
    private ITheDienToaiRepository repository;

    public List<TheDienThoai> findAll(){
        return repository.findAll();
    }

    public Page<TheDienThoai> findAllPage(Pageable pageable){
        return repository.findAll(pageable);
    }

    public TheDienThoai findById(int id) {
        return repository.findById(id).get();
    }

    public void insert(TheDienThoai theDienThoai) {
        theDienThoai.setSoLuongTon(0);
        repository.save(theDienThoai);
    }

    public void update(Integer id, TheDienThoai theDienThoai) {
        Optional<TheDienThoai> optionalProduct = repository.findById(id);
        if (optionalProduct.isEmpty()) {
            return;
        }
        TheDienThoai pro = optionalProduct.get();
        pro.setTen(theDienThoai.getTen());
        pro.setMa(theDienThoai.getMa());
        pro.setNhaMang(theDienThoai.getNhaMang());
        repository.save(pro);
    }

    public void delete(Integer id) {
        repository.deleteById(id);
    }

    public TheDienThoai findById(Integer id) {
        return repository.findById(id).get();
    }
}
