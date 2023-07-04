package com.example.asm_trangdttph27721.controller;

import com.example.asm_trangdttph27721.model.KhachHang;
import com.example.asm_trangdttph27721.service.KhachHangService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class LoginController {
    @Autowired
    private KhachHangService khachHangService;

    @GetMapping("/login")
    public String getLoginForm() {
        return "login";
    }

    @PostMapping("/login")
    public String login(HttpSession session
            ,@RequestParam(name = "email") String email
            , @RequestParam(name = "matKhau") String matKhau
            , RedirectAttributes re ) {
        KhachHang khachHang = khachHangService.findByEmailAndMatKhau(email, matKhau);

        if (khachHang != null) {
            session.setAttribute("kh", khachHang);
//            re.addFlashAttribute("message", "Đăng nhập thành công");
//            re.addFlashAttribute("err", "");
            return "redirect:/admin/the-dien-thoai/list";
        } else {
            re.addFlashAttribute("message", "");
            re.addFlashAttribute("err", "Sai tài khoản hoặc mật khẩu");
            return "redirect:/login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        // Xóa session hiện tại
        request.getSession().invalidate();
        return "redirect:/login";
    }
}
