package com.example.asm_trangdttph27721.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "khuyenmai")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class KhuyenMai {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "ma")
    private String ma;

    @Column(name = "ten")
    private String ten;

    @Column(name = "ngaybatdau")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date ngayBatDau;

    @Column(name = "ngayketthuc")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date ngayKetThuc;

    @Column(name = "tiengiam")
    private Integer tiemGiam;
}
