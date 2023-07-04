package com.example.asm_trangdttph27721.controller;

import com.example.asm_trangdttph27721.model.ChiTietTDT;
import com.example.asm_trangdttph27721.model.NhaMang;
import com.example.asm_trangdttph27721.model.TheDienThoai;
import com.example.asm_trangdttph27721.response.ChiTietTDTReponse;
import com.example.asm_trangdttph27721.response.IChiTietTDT;
import com.example.asm_trangdttph27721.service.ChiTietTDTService;
import com.example.asm_trangdttph27721.service.NhaMangService;
import com.example.asm_trangdttph27721.service.TheDienThoaiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/admin/the-dien-thoai-chi-tiet")
public class ChiTetTDTController {

    @Autowired
    private ChiTietTDTService chiTietTDTService;

    @Autowired
    private TheDienThoaiService theDienThoaiService;

    @Autowired
    private NhaMangService nhaMangService;

    @GetMapping("/list/{id_tdt}")
    public String viewAll(Model model
            , @RequestParam(defaultValue = "1") Integer page
            , @PathVariable("id_tdt") Integer id_tdt){
        Page<IChiTietTDT> tietTDTPages;
        if (page < 1) page = 1;
        Pageable pageable = PageRequest.of(page - 1, 5);
        TheDienThoai theDienThoai = theDienThoaiService.findById(id_tdt);
        tietTDTPages = chiTietTDTService.findByTDTAandTrangThaiaAndKm(theDienThoai, pageable);

        model.addAttribute("tietTDTPage", tietTDTPages);
        model.addAttribute("view", "ChiTietTDT/index.jsp");
        return "layOut";
    }

    @GetMapping("/search")
    public String search(Model model
            , @RequestParam(defaultValue = "1") Integer page
            , @RequestParam(required = false) BigDecimal begin
            , @RequestParam(required = false) BigDecimal end
            , RedirectAttributes re){
        List<TheDienThoai> theDienThoais = theDienThoaiService.findAll();
        Page<ChiTietTDT> tietTDTPage;
        Pageable pageable = PageRequest.of(page - 1, 5);
        if (begin == null || end == null || (begin.doubleValue() == 0 && end.doubleValue() == 0)) {
            tietTDTPage = chiTietTDTService.findAll(pageable);
        } else {
            if (begin.doubleValue() > end.doubleValue()){
                re.addFlashAttribute("messageDelete", "Giá trị tìm kiếm bắt đầu không thể lớn hơn giá trị kết thúc!");
                return "redirect:/admin/the-dien-thoai-chi-tiet/list";
            }
            tietTDTPage = chiTietTDTService.findByGiaBanBetween(begin, end, pageable);
        }
        model.addAttribute("tietTDTPage", tietTDTPage);
        model.addAttribute("listTDT", theDienThoais);
        model.addAttribute("view", "ChiTietTDT/index.jsp");
        return "layOut";
    }

    @GetMapping("/view-add")
    public String viewAdd(Model model){
        List<TheDienThoai> theDienThoais = theDienThoaiService.findAll();
        model.addAttribute("listTDT", theDienThoais);
        model.addAttribute("action", "/admin/the-dien-thoai-chi-tiet/add");
        model.addAttribute("message", "Bạn có chắc muốn thêm bản ghi này không");
        model.addAttribute("view", "ChiTietTDT/add.jsp");
        return "layOut";
    }

    @GetMapping("/view-update/{id}")
    public String viewUpdate(Model model, @PathVariable("id") Integer id){
        List<TheDienThoai> theDienThoais = theDienThoaiService.findAll();
        ChiTietTDT chiTietTDT = chiTietTDTService.findById(id);
        model.addAttribute("listTDT", theDienThoais);
        model.addAttribute("chiTietTDT", chiTietTDT);
        model.addAttribute("action", "/admin/the-dien-thoai-chi-tiet/update/"+chiTietTDT.getId());
        model.addAttribute("message", "Bạn có chắc muốn cập nhật bản ghi này không");
        model.addAttribute("view", "ChiTietTDT/add.jsp");
        return "layOut";
    }

    @GetMapping("/detail/{id}")
    public String detail(Model model, @PathVariable("id") Integer id){
        IChiTietTDT result = chiTietTDTService.findProductWithPromotion(id, new Date());
        if (result != null) {
            model.addAttribute("ctTheDT", result);
            DecimalFormat decimalFormat = new DecimalFormat("#,##0.0");
            String giaGiam = decimalFormat.format(result.getGiaSauGiam());
            model.addAttribute("giaSauGiam", giaGiam);
        } else {
            ChiTietTDT chiTietTDT = chiTietTDTService.findById(id);
            model.addAttribute("ctTheDT", chiTietTDT);
            model.addAttribute("giaSauGiam", "");
        }

        model.addAttribute("view", "ChiTietTDT/detail.jsp");
        return "layOut";
    }

    @PostMapping("/add")
    public String insert(Model model, ChiTietTDT chiTietTDT, BindingResult result, RedirectAttributes re){
        chiTietTDTService.insert(chiTietTDT);
        re.addFlashAttribute("message", "Thêm mới hành công!!!");
        return "redirect:/admin/the-dien-thoai/list";
    }

    @PostMapping("/update/{id}")
    public String update(@PathVariable("id") Integer id
            , @ModelAttribute("chiTietTDT") ChiTietTDT chiTietTDT, RedirectAttributes re){
        chiTietTDTService.update(id, chiTietTDT);
        re.addFlashAttribute("message", "Cập nhật hành công!!!");
        return "redirect:/admin/the-dien-thoai/list";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") Integer id, RedirectAttributes re){
        chiTietTDTService.delete(id);
        re.addFlashAttribute("messageDelete", "Xóa thành công product với id " + id);
        return "redirect:/admin/the-dien-thoai/list";
    }
}
