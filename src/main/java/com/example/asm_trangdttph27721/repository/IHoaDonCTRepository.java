package com.example.asm_trangdttph27721.repository;

import com.example.asm_trangdttph27721.model.HoaDon;
import com.example.asm_trangdttph27721.model.HoaDonCT;
import com.example.asm_trangdttph27721.response.SoLuongSanPham;
import com.example.asm_trangdttph27721.response.TopBanChay;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface IHoaDonCTRepository extends JpaRepository<HoaDonCT, Integer> {
    HoaDonCT findByMa(String ma);

    List<HoaDonCT> findByHoaDon(HoaDon hoaDon);

    @Query(value = "SELECT TD.id as id_the, COUNT(HDCT.chiTietTDT.id) AS so_luong_sp " +
            "FROM HoaDonCT HDCT " +
            "JOIN ChiTietTDT CT ON HDCT.chiTietTDT.id = CT.id " +
            "JOIN TheDienThoai TD ON CT.theDienThoai.id = TD.id " +
            "JOIN HoaDon HD ON HD.id = HDCT.hoaDon.id " +
            "WHERE HD.id = :id " +
            "GROUP BY TD.id")
    List<SoLuongSanPham> countSanPhamByTheDienThoai(@Param("id") Integer id);

    @Query(value = """
        SELECT TOP(10) TD.id as id_the, TD.Ten as ten_the, NM.Ten as nha_mang, Sum(HDCT.SoLuong) AS so_luong
        FROM HoaDonChiTiet HDCT
        JOIN ChiTietTDT CT ON HDCT.IdChiTietSP = CT.Id
        JOIN TheDienThoai TD ON CT.IdTheDienThoai = TD.Id
        JOIN HoaDon HD ON HD.Id = HDCT.IdHoaDon
        JOIN NhaMang NM ON NM.ID = TD.IdNhaMang
        WHERE HD.NgayDat BETWEEN :startDate AND :endDate
        GROUP BY TD.id, TD.Ten, NM.Ten
        ORDER BY so_luong DESC
    """, nativeQuery = true)
    List<TopBanChay> topSanPhamBanCHay(@Param("startDate")Date startDate, @Param("endDate")Date endDate);

    @Query(value = """
        SELECT TOP(10) TD.id as id_the, TD.Ten as ten_the, NM.Ten as nha_mang, Sum(HDCT.SoLuong) AS so_luong
        FROM HoaDonChiTiet HDCT
        JOIN ChiTietTDT CT ON HDCT.IdChiTietSP = CT.Id
        JOIN TheDienThoai TD ON CT.IdTheDienThoai = TD.Id
        JOIN HoaDon HD ON HD.Id = HDCT.IdHoaDon
        JOIN NhaMang NM ON NM.ID = TD.IdNhaMang
        WHERE MONTH(HD.NgayDat) = :month
        GROUP BY TD.id, TD.Ten, NM.Ten
        ORDER BY so_luong DESC
    """, nativeQuery = true)
    List<TopBanChay> topSanPhamBanCHayByThang(@Param("month") Integer month);

    @Query("""
        SELECT TD.id as id_the, TD.ten as ten_the, TD.nhaMang.ten as nha_mang, Sum(HDCT.soLuong) AS so_luong
        FROM HoaDonCT HDCT
        JOIN ChiTietTDT CT ON HDCT.chiTietTDT.id = CT.id
        JOIN TheDienThoai TD ON CT.theDienThoai.id = TD.id
        JOIN HoaDon HD ON HD.id = HDCT.hoaDon.id
        WHERE YEAR(HD.ngayDat) = :year
        GROUP BY TD.id, TD.ten, TD.nhaMang.ten
        ORDER BY so_luong DESC
    """)
    List<TopBanChay> topSanPhamBanCHayByNam(@Param("year") Integer year);

}
