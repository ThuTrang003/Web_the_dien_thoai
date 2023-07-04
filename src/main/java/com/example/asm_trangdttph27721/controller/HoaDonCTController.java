package com.example.asm_trangdttph27721.controller;

import com.example.asm_trangdttph27721.model.*;
import com.example.asm_trangdttph27721.response.SoLuongSanPham;
import com.example.asm_trangdttph27721.service.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/admin/hoa-don-chi-tiet")
public class HoaDonCTController {
    @Autowired
    private HoaDonCTService hoaDonCTService;

    @Autowired
    private TheDienThoaiService theDienThoaiService;

    @Autowired
    private GioHangCTService gioHangCTService;

    @Autowired
    private HoaDonService hoaDonService;
    @Autowired
    private KhachHangService khachHangService;

    @PostMapping("/add")
    public String insert(Model model, HoaDon hoaDon, RedirectAttributes re, HttpServletRequest request) {
        int maHD = (int) Math.floor(Math.random() * 1000);
        Date date = new Date();
        HttpSession session = request.getSession();
        KhachHang khachHang = (KhachHang) session.getAttribute("kh");
//        KhachHang khachHang = khachHangService.findById(1);
        hoaDon.setMa("HD"+maHD);
        hoaDon.setNgayDat(date);
        hoaDon.setKhachHang(khachHang);
        hoaDon.setTinhTrang(0);
        hoaDonService.insert(hoaDon);

        hoaDon = hoaDonService.findByMa("HD"+maHD);
        List<GioHangCT> listGioHang = this.gioHangCTService.getAll(khachHang.getId());
        List<HoaDonCT> listHDCT = new ArrayList<>();
        for (GioHangCT x: listGioHang) {
            HoaDonCT hdct = new HoaDonCT();
            hdct.setHoaDon(hoaDon);
            hdct.setSoLuong(x.getSoLuong());
            hdct.setDonGia(x.getDonGiaKhiGiam());
            hdct.setChiTietTDT(x.getChiTietTDT());
            int maHDct = (int) Math.floor(Math.random() * 1000);
            hdct.setMa("HDCT" + maHDct);
            listHDCT.add(hdct);// Thêm sản phẩm có trong giỏ hàng vào hóa đơn chi tiết
            gioHangCTService.delete(x.getId());//Xóa thông tin sản phẩm trong giỏ hàng khi thanh toán thành công
        }
        hoaDonCTService.saveAll(listHDCT);
        // Update trạng thái hóa đơn thành đã thanh toán
        hoaDon.setTinhTrang(1);
        this.hoaDonService.update(hoaDon);
        // Cập nhật số lượng tồn sản phẩm
        List<SoLuongSanPham> list = hoaDonCTService.countSanPhamByTheDienThoai(hoaDon.getId());
        for (SoLuongSanPham x: list) {
            TheDienThoai theDienThoai = theDienThoaiService.findById(x.getIdTDT());
            theDienThoai.setSoLuongTon(theDienThoai.getSoLuongTon()-x.getSoLuong());
            theDienThoaiService.update(x.getIdTDT(), theDienThoai);
        }
        re.addFlashAttribute("message", "Thanh toán thành công");
        return "redirect:/admin/hoa-don-chi-tiet/view-hoa-hon/"+ hoaDon.getId();
    }

    @GetMapping("/view-hoa-hon/{id_hd}")
    public String viewHoaDonThanhToan(@PathVariable("id_hd") Integer id, Model model) {
        HoaDon hoaDon = hoaDonService.findByID(id);
        List<HoaDonCT> list = this.hoaDonCTService.findByHoaDon(hoaDon);

        if (list.size() != 0) {
            double tong = 0;
            for (int i = 0; i < list.size(); i++) {
                tong += list.get(i).getDonGia().doubleValue();
            }
            BigDecimal tongStr = new BigDecimal(tong);
            model.addAttribute("tong", tongStr.toPlainString());
            model.addAttribute("hd_ct", list.get(0));
            model.addAttribute("listHDCT", list);
        } else {
            model.addAttribute("message", "Hóa đơn chưa được thanh toán");
        }
        model.addAttribute("view", "HoaDonChiTiet/hien-thi.jsp");
        return "layOut";
    }
}
