package com.example.asm_trangdttph27721.controller;

import com.example.asm_trangdttph27721.model.ChiTietTDT;
import com.example.asm_trangdttph27721.model.KhuyenMai;
import com.example.asm_trangdttph27721.model.KhuyenMaiChiTiet;
import com.example.asm_trangdttph27721.service.ChiTietTDTService;
import com.example.asm_trangdttph27721.service.KhuyenMaiCTService;
import com.example.asm_trangdttph27721.service.KhuyenMaiService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import java.util.List;

@Controller
@RequestMapping("/admin/khuyen-mai")
public class KhuyenMaiController {

    @Autowired
    private ChiTietTDTService chiTietTDTService;

    @Autowired
    private KhuyenMaiService khuyenMaiService;

    @Autowired
    private KhuyenMaiCTService kmCTService;

    @GetMapping("/view-add")
    public String viewAdd(Model model) {
        model.addAttribute("view", "KhuyenMai/hien-thi.jsp");
        return "layOut";
    }

    @PostMapping("/add")
    public String addKH(Model model, KhuyenMai khuyenMai) {
        int ma = (int)Math.floor(Math.random() * 10000);
        khuyenMai.setMa("KM"+ma);
        khuyenMaiService.insert(khuyenMai);
        List<ChiTietTDT> listCT = chiTietTDTService.findAllByTrangThaiNotInKhuyenMai();
        model.addAttribute("listCT", listCT);
        KhuyenMai km = khuyenMaiService.findByMa("KM"+ma);
        model.addAttribute("view", "KhuyenMai/add-SP-km.jsp");
        model.addAttribute("id_km", km.getId());
        return "layOut";
    }

    @GetMapping("/list")
    public String viewAll(Model model) {
        List<KhuyenMai> listKM = khuyenMaiService.findAll();
        model.addAttribute("listKM", listKM);
        model.addAttribute("view", "KhuyenMai/index.jsp");
        return "layOut";
    }

    @GetMapping("/detail/{id_km}")
    public String detail(Model model, @PathVariable(name = "id_km") Integer idKM) {
        KhuyenMai khuyenMai = khuyenMaiService.findById(idKM);
        List<KhuyenMaiChiTiet> list = kmCTService.findByKhuyenMai(khuyenMai);
        model.addAttribute("listKMCT", list);
        model.addAttribute("view", "KhuyenMai/detail.jsp");
        return "layOut";
    }



}
