package com.example.asm_trangdttph27721.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "nhanvien")
public class NhanVien {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "ma")
    private String ma;

    @Column(name = "ten")
    private String ten;

    @Column(name = "gioitinh")
    private String gioiTinh;

    @Column(name = "ngaysinh")
    private Date ngaySinh;

    @Column(name = "diachi")
    private String diaChi;

    @Column(name = "sdt")
    private String sdt;

    @Column(name = "matkhau")
    private String matKhau;

    @ManyToOne()
    @JoinColumn(name = "idcv", referencedColumnName = "id")
    private ChucVu chucVu;

    @Column(name = "trangthai")
    private Integer trangThai;
}
