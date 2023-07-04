package com.example.asm_trangdttph27721.controller;

import com.example.asm_trangdttph27721.model.ChiTietTDT;
import com.example.asm_trangdttph27721.model.KhuyenMai;
import com.example.asm_trangdttph27721.service.KhachHangService;
import com.example.asm_trangdttph27721.service.KhuyenMaiCTService;
import com.example.asm_trangdttph27721.service.KhuyenMaiService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin/khuyen-mai-ct")
public class KhuyenMaiCTController {
    @Autowired
    private KhuyenMaiCTService kmCTService;

    @Autowired
    private KhuyenMaiService kmService;

    @PostMapping("/add-sp-km/{id_km}")
    public String addSPKM(Model model, @PathVariable("id_km") Integer idKM, @RequestParam("selectedProducts") String selectedProductsJson) {
        List<Integer> selectedTDT = new ArrayList<>();
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            selectedTDT = objectMapper.readValue(selectedProductsJson, new TypeReference<List<Integer>>() {});
        } catch (IOException e) {
            e.printStackTrace();
        }
        KhuyenMai khuyenMai = kmService.findById(idKM);
        kmCTService.insert(khuyenMai, selectedTDT);
        return "redirect:/admin/khuyen-mai/list";
    }

}
