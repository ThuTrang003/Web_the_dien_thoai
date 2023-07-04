package com.example.asm_trangdttph27721.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

@Entity
@Table(name = "khuyenmaichitiet")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class KhuyenMaiChiTiet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @ManyToOne()
    @JoinColumn(name = "idkhuyenmai", referencedColumnName = "id")
    private KhuyenMai khuyenMai;

    @ManyToOne()
    @JoinColumn(name = "idthedienthoai", referencedColumnName = "id")
    private ChiTietTDT chiTietTDT;


}
