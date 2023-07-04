package com.example.asm_trangdttph27721.response;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.rest.core.config.Projection;

@Projection(types = {TopBanChayImpl.class})
public interface TopBanChay {
    @Value("#{target.id_the}")
    Integer getId();

    @Value("#{target.ten_the}")
    String getTen();

    @Value("#{target.nha_mang}")
    String getNhaMang();

    @Value("#{target.so_luong}")
    Integer getTongSL();
}
