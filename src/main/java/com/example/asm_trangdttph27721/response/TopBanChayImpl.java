package com.example.asm_trangdttph27721.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class TopBanChayImpl implements Serializable {
    private Integer id;
    private String ma;
    private String ten;
    private String nhaMang;
    private Integer tongSL;
}
