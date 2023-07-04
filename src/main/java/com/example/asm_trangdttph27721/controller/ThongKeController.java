package com.example.asm_trangdttph27721.controller;

import com.example.asm_trangdttph27721.response.TopBanChay;
import com.example.asm_trangdttph27721.response.TopTonKho;
import com.example.asm_trangdttph27721.service.ChiTietTDTService;
import com.example.asm_trangdttph27721.service.HoaDonCTService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class ThongKeController {
    @Autowired
    private HoaDonCTService hoaDonCTService;

    @Autowired
    private ChiTietTDTService chiTietTDTService;

    @GetMapping("/thong-ke/ban-chay/ngay")
    public String thongKeNgay(@RequestParam(required = false) String start
            , @RequestParam(required = false) String end
            , Model model){
            List<TopBanChay> listThongKe = new ArrayList<>();
        if (start == null || start == "" || end == null || end == "") {
            listThongKe = new ArrayList<>();
        } else {
            try {
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                Date startDate = dateFormat.parse(start);
                Date endDate = dateFormat.parse(end);
                listThongKe = hoaDonCTService.topSanPhamBanCHay(startDate,endDate);
            } catch (ParseException e) {
                throw new RuntimeException(e);
            }
        }
        model.addAttribute("listThongKe" ,listThongKe);
        model.addAttribute("view", "ThongKe/index.jsp");
        return "layOut";
    }

    @GetMapping("/thong-ke/ban-chay/thang")
    public String thongKeThang(@RequestParam(required = false) String month
            , Model model){
        List<TopBanChay> listThongKe = new ArrayList<>();
        if (month == null) {
            listThongKe = new ArrayList<>();
        } else {
            listThongKe = hoaDonCTService.topSanPhamBanCHayByThang(Integer.parseInt(month));
        }
        model.addAttribute("listThongKe" ,listThongKe);
        model.addAttribute("view", "ThongKe/index.jsp");
        return "layOut";
    }

    @GetMapping("/thong-ke/ban-chay/nam")
    public String thongKeNam(@RequestParam(required = false) String year
            , Model model){
        List<TopBanChay> listThongKe = new ArrayList<>();
        if (year == null) {
            listThongKe = new ArrayList<>();
        } else {
            listThongKe = hoaDonCTService.topSanPhamBanCHayByNam(Integer.parseInt(year));
        }
        model.addAttribute("listThongKe" ,listThongKe);
        model.addAttribute("view", "ThongKe/index.jsp");
        return "layOut";
    }

    @GetMapping("/thong-ke/ton-kho/ngay")
    public String thongKeNgayTonKho(@RequestParam(required = false) String start
            , @RequestParam(required = false) String end
            , Model model){
        List<TopTonKho> listThongKe = new ArrayList<>();
        if (start == null || end == null) {
            listThongKe = new ArrayList<>();
        } else {
            try {
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                Date startDate = dateFormat.parse(start);
                Date endDate = dateFormat.parse(end);
                listThongKe = chiTietTDTService.topSanPhamTonKho(startDate, endDate);
            } catch (ParseException e) {
                throw new RuntimeException(e);
            }
        }
        model.addAttribute("listThongKe" ,listThongKe);
        model.addAttribute("view", "ThongKe/tonKho.jsp");
        return "layOut";
    }

    @GetMapping("/thong-ke/ton-kho/thang")
    public String thongKeThangTonKho(@RequestParam(required = false) String month
            , Model model){
        List<TopTonKho> listThongKe = new ArrayList<>();
        if (month == null) {
            listThongKe = new ArrayList<>();
        } else {
            listThongKe = chiTietTDTService.topSanPhamTonKhoByThang(Integer.parseInt(month));
        }
        model.addAttribute("listThongKe" ,listThongKe);
        model.addAttribute("view", "ThongKe/tonKho.jsp");
        return "layOut";
    }

    @GetMapping("/thong-ke/ton-kho/nam")
    public String thongKeNamTonKho(@RequestParam(required = false) String year
            , Model model){
        List<TopTonKho> listThongKe = new ArrayList<>();
        if (year == null) {
            listThongKe = new ArrayList<>();
        } else {
            listThongKe = chiTietTDTService.topSanPhamTonKhoByNam(Integer.parseInt(year));
        }
        model.addAttribute("listThongKe" ,listThongKe);
        model.addAttribute("view", "ThongKe/tonKho.jsp");
        return "layOut";
    }
}
