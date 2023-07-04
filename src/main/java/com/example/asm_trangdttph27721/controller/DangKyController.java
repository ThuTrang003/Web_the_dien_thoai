package com.example.asm_trangdttph27721.controller;

import com.example.asm_trangdttph27721.model.KhachHang;
import com.example.asm_trangdttph27721.service.KhachHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DangKyController {
    @Autowired
    private KhachHangService service;

    @GetMapping("/dang-ky")
    public String viewDangKy() {
        return "dangKy";
    }

    @PostMapping("/dang-ky")
    public String dangKy(Model model, KhachHang khachHang){
        service.insert(khachHang);
        model.addAttribute("message", "Đăng ký thành công !!! Mời bạn đăng nhập");
        return "login";
    }

}
