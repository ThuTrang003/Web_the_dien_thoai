package com.example.asm_trangdttph27721.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.Date;
import java.util.UUID;

@Entity
@Table(name = "chitiettdt")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ChiTietTDT {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "ma")
    private String ma;

    @ManyToOne()
    @JoinColumn(name = "idthedienthoai", referencedColumnName = "id")
    private TheDienThoai theDienThoai;

    @Column(name = "mathe")
    private String maThe;

    @Column(name = "soseri")
    private String soSeri;

    @Column(name = "gianhap")
    private BigDecimal giaNhap;

    @Column(name = "giaban")
    private BigDecimal giaBan;

    @Column(name = "trangthai")
    private Integer trangThai;

    @Column(name = "mota")
    private String moTa;

    @Column(name = "createdate")
    private Date ngayTao;
}
