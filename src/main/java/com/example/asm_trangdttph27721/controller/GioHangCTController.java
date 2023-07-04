package com.example.asm_trangdttph27721.controller;

import com.example.asm_trangdttph27721.model.ChiTietTDT;
import com.example.asm_trangdttph27721.model.GioHangCT;
import com.example.asm_trangdttph27721.model.KhachHang;
import com.example.asm_trangdttph27721.model.TheDienThoai;
import com.example.asm_trangdttph27721.service.ChiTietTDTService;
import com.example.asm_trangdttph27721.service.GioHangCTService;
import com.example.asm_trangdttph27721.service.KhachHangService;
import com.example.asm_trangdttph27721.service.TheDienThoaiService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.math.BigDecimal;
import java.util.List;

@Controller
@RequestMapping("/admin/gio-hang")
public class GioHangCTController {
    @Autowired
    private GioHangCTService gioHangCTService;

    @Autowired
    private KhachHangService khachHangService;

    @Autowired
    private TheDienThoaiService tdtService;

    @Autowired
    private ChiTietTDTService tdtCTService;

    @GetMapping("/list")
    public String viewAll(Model model
            , @RequestParam(defaultValue = "1") Integer page
            , HttpServletRequest request) {
        Page<GioHangCT> ghPage;
        Pageable pageable = PageRequest.of(page - 1, 5);
        HttpSession session = request.getSession();
        KhachHang khachHang = (KhachHang) session.getAttribute("kh");
        ghPage = gioHangCTService.findAllByKhachHang(khachHang.getId(), pageable);

        List<GioHangCT> list = this.gioHangCTService.getAll(khachHang.getId());
        double tong = 0;
        for (int i = 0; i < list.size(); i++) {
            tong += list.get(i).getDonGia().doubleValue();
        }
        model.addAttribute("gioHangCTPage", ghPage);
        model.addAttribute("kh", khachHang);
        model.addAttribute("tong", tong);
        model.addAttribute("view", "GioHangChiTiet/hien-thi.jsp");
        return "layOut";
    }

    @PostMapping("/add/{id_ct_the}")
    public String addGioHang(@PathVariable("id_ct_the") Integer id
            , @RequestParam() BigDecimal donGiaKhiGiam
            , HttpServletRequest request
            , RedirectAttributes re) {
        HttpSession session = request.getSession();
        KhachHang khachHang = (KhachHang) session.getAttribute("kh");
        gioHangCTService.insert(id, khachHang, donGiaKhiGiam);
        ChiTietTDT chiTietTDT = tdtCTService.findById(id);
        TheDienThoai tdt = tdtService.findById(chiTietTDT.getTheDienThoai().getId());
        tdt.setSoLuongTon(tdt.getSoLuongTon() - 1);
        tdtService.update(tdt.getId(), tdt);
        re.addFlashAttribute("message", "Thêm sản phẩm vào giỏ hàng hành công!!!");
        return "redirect:/admin/gio-hang/list";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") Integer id, RedirectAttributes re) {
        GioHangCT gioHangCT = gioHangCTService.findById(id);
        TheDienThoai tdt = tdtService.findById(gioHangCT.getChiTietTDT().getTheDienThoai().getId());
        tdt.setSoLuongTon(tdt.getSoLuongTon() + 1);
        tdtService.update(tdt.getId(), tdt);
        gioHangCTService.delete(id);
        re.addFlashAttribute("messageDelete", "Xóa thành công");
        return "redirect:/admin/gio-hang/list";
    }

}
