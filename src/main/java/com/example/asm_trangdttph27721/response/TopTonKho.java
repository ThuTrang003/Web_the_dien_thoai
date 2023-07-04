package com.example.asm_trangdttph27721.response;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.rest.core.config.Projection;

@Projection(types = {TopTonKhoImpl.class})
public interface TopTonKho {
    @Value("#{target.id}")
    Integer getId();

    @Value("#{target.ten}")
    String getTen();

    @Value("#{target.soSeri}")
    String getSoSeri();

    @Value("#{target.ngayTao}")
    String getNgay();
}
