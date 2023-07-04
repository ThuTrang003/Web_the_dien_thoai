package com.example.asm_trangdttph27721.response;

import com.example.asm_trangdttph27721.model.TheDienThoai;
import lombok.*;


import java.math.BigDecimal;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ChiTietTDTReponse {
    private Integer id;

    private String ma;

    private TheDienThoai theDienThoai;

    private String maThe;

    private String soSeri;

    private BigDecimal giaBan;

    private String moTa;

    private BigDecimal giaSauGiam;
}
