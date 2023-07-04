package com.example.asm_trangdttph27721.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

@Entity
@Table(name = "giohangchitiet")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class GioHangCT {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "ma")
    private String ma;

    @ManyToOne()
    @JoinColumn(name = "idgiohang", referencedColumnName = "id")
    private GioHang gioHang;

    @ManyToOne()
    @JoinColumn(name = "idchitiettdt", referencedColumnName = "id")
    private ChiTietTDT chiTietTDT;

    @Column(name = "soluong")
    private Integer soLuong;

    @Column(name = "dongia")
    private BigDecimal donGia;

    @Column(name = "dongiakhigiam")
    private BigDecimal donGiaKhiGiam;
}
