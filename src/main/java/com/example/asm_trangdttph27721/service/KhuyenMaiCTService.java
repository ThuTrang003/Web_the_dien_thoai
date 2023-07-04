package com.example.asm_trangdttph27721.service;

import com.example.asm_trangdttph27721.model.ChiTietTDT;
import com.example.asm_trangdttph27721.model.KhuyenMai;
import com.example.asm_trangdttph27721.model.KhuyenMaiChiTiet;
import com.example.asm_trangdttph27721.repository.IKhuyenMaiCTRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class KhuyenMaiCTService {
    @Autowired
    private IKhuyenMaiCTRepository repository;

    @Autowired
    private ChiTietTDTService theDienThoaiService;

    public void insert(KhuyenMai khuyenMai, List<Integer> idChiTietTDTList) {
        List<KhuyenMaiChiTiet> listSPKM = new ArrayList<>();
        for (Integer x: idChiTietTDTList) {
            KhuyenMaiChiTiet kmct = new KhuyenMaiChiTiet();
            kmct.setKhuyenMai(khuyenMai);
            ChiTietTDT chiTietTDT = theDienThoaiService.findById(x);
            kmct.setChiTietTDT(chiTietTDT);
            listSPKM.add(kmct);
        }
        repository.saveAll(listSPKM);
    }

    public List<KhuyenMaiChiTiet> findByKhuyenMai(KhuyenMai khuyenMai) {
        return repository.findByKhuyenMai(khuyenMai);
    }
}
