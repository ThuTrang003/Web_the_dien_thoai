package com.example.asm_trangdttph27721.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "thedienthoai")
public class TheDienThoai {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "ma")
    private String ma;

    @Column(name = "ten")
    private String ten;

    @Column(name = "soluongton")
    private Integer soLuongTon;

    @ManyToOne()
    @JoinColumn(name = "idnhamang", referencedColumnName = "id")
    private NhaMang nhaMang;
}
