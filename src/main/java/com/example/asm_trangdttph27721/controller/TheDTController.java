package com.example.asm_trangdttph27721.controller;

import com.example.asm_trangdttph27721.model.ChiTietTDT;
import com.example.asm_trangdttph27721.model.NhaMang;
import com.example.asm_trangdttph27721.model.TheDienThoai;
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

import java.util.List;

@Controller
@RequestMapping("/admin/the-dien-thoai")
public class TheDTController {
    @Autowired
    private TheDienThoaiService theDienThoaiService;

    @Autowired
    private NhaMangService nhaMangService;

    @GetMapping("/list")
    public String viewAll(Model model, @RequestParam(defaultValue = "1") Integer page) {
        Page<TheDienThoai> tdtPage;
        Pageable pageable = PageRequest.of(page - 1, 5);
        tdtPage = theDienThoaiService.findAllPage(pageable);
        model.addAttribute("tdtPage", tdtPage);
        model.addAttribute("view", "TheDienThoai/hien-thi.jsp");
        return "layOut";
    }

    @GetMapping("/view-add")
    public String viewAdd(Model model){
        List<NhaMang> nhaMangs = nhaMangService.findAll();
        model.addAttribute("listNM", nhaMangs);
        model.addAttribute("action", "/admin/the-dien-thoai/add");
        model.addAttribute("message", "Bạn có chắc muốn thêm bản ghi này không");
        model.addAttribute("view", "TheDienThoai/add.jsp");
        return "layOut";
    }

    @PostMapping("/add")
    public String insert(Model model, TheDienThoai theDienThoai, BindingResult result, RedirectAttributes re){
        theDienThoaiService.insert(theDienThoai);
        re.addFlashAttribute("message", "Thêm mới hành công!!!");
        return "redirect:/admin/the-dien-thoai/list";
    }

    @GetMapping("/view-update/{id}")
    public String detail(Model model, @PathVariable("id") Integer id){
        List<NhaMang> nhaMangs = nhaMangService.findAll();
        TheDienThoai theDienThoai = theDienThoaiService.findById(id);
        model.addAttribute("tdt", theDienThoai);
        model.addAttribute("listNM", nhaMangs);
        model.addAttribute("action", "/admin/the-dien-thoai/update/"+theDienThoai.getId());
        model.addAttribute("message", "Bạn có chắc muốn cập nhật bản ghi này không");
        model.addAttribute("view", "TheDienThoai/add.jsp");
        return "layOut";
    }

    @PostMapping("/update/{id}")
    public String update(@PathVariable("id") Integer id
            , @ModelAttribute("tdt") TheDienThoai theDienThoai, RedirectAttributes re){
        theDienThoaiService.update(id, theDienThoai);
        re.addFlashAttribute("message", "Cập nhật hành công!!!");
        return "redirect:/admin/the-dien-thoai/list";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") Integer id, RedirectAttributes re){
        theDienThoaiService.delete(id);
        re.addFlashAttribute("messageDelete", "Xóa thành công product với id " + id);
        return "redirect:/admin/the-dien-thoai/list";
    }
}
