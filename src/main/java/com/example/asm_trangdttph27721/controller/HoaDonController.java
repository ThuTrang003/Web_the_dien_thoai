package com.example.asm_trangdttph27721.controller;

import com.example.asm_trangdttph27721.model.HoaDon;
import com.example.asm_trangdttph27721.model.KhachHang;
import com.example.asm_trangdttph27721.service.HoaDonService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/admin/hoa-don")
public class HoaDonController {
    @Autowired
    private HoaDonService hoaDonService;

    @GetMapping("/list")
    public String viewAll(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        KhachHang khachHang = (KhachHang) session.getAttribute("kh");
        List<HoaDon> listHD = hoaDonService.findByKhachHang(khachHang);
        model.addAttribute("listHD", listHD);
        model.addAttribute("view", "HoaDon/hien-thi.jsp");
        return "layOut";
    }

}
