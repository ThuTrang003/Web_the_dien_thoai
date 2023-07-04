package com.example.asm_trangdttph27721.response;

import org.springframework.beans.factory.annotation.Value;

public interface SoLuongSanPham {
    @Value("#{target.id_the}")
    Integer getIdTDT();

    @Value("#{target.so_luong_sp}")
    Integer getSoLuong();
}
