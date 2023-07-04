package com.example.asm_trangdttph27721.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Entity
@Table(name = "giohang")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class GioHang {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @ManyToOne()
    @JoinColumn(name = "idkh", referencedColumnName = "id")
    private KhachHang khachHang;

    @ManyToOne()
    @JoinColumn(name = "idnv", referencedColumnName = "id")
    private NhanVien nhanVien;

    @Column(name = "ma")
    private String ma;

    @Column(name = "ngaytao")
    private Date ngayTao;

    @Column(name = "ngaythanhtoan")
    private Date ngayThanhToan;

    @Column(name = "tennguoinhan")
    private String tenNguoiNhan;

    @Column(name = "sdt")
    private String sdt;

    @Column(name = "tinhtrang")
    private Integer tinhTrang;
}
