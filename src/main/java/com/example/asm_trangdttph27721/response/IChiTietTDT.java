package com.example.asm_trangdttph27721.response;

import com.example.asm_trangdttph27721.model.TheDienThoai;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.rest.core.config.Projection;

import java.math.BigDecimal;

@Projection(types = {ChiTietTDTReponse.class})
public interface IChiTietTDT {
    @Value("#{target.id}")
    Integer getId();

    @Value("#{target.ma}")
    String getMa();

    @Value("#{target.theDienThoai}")
    TheDienThoai getTheDienThoai();

    @Value("#{target.maThe}")
    String getMaThe();

    @Value("#{target.soSeri}")
    String getSoSeri();

    @Value("#{target.giaBan}")
    BigDecimal getGiaBan();

    @Value("#{target.moTa}")
    String getMoTa();

    @Value("#{target.giaSauGiam}")
    BigDecimal getGiaSauGiam();
}
