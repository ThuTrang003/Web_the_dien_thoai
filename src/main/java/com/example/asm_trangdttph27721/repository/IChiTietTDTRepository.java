package com.example.asm_trangdttph27721.repository;

import com.example.asm_trangdttph27721.model.ChiTietTDT;
import com.example.asm_trangdttph27721.model.TheDienThoai;
import com.example.asm_trangdttph27721.response.ChiTietTDTReponse;
import com.example.asm_trangdttph27721.response.IChiTietTDT;
import com.example.asm_trangdttph27721.response.TopBanChay;
import com.example.asm_trangdttph27721.response.TopTonKho;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Repository
public interface IChiTietTDTRepository extends JpaRepository<ChiTietTDT, Integer>{
    Long countByid(Integer id);
    Page<ChiTietTDT> findByTheDienThoaiAndTrangThai(TheDienThoai tdt, int trangThai, Pageable pageable);

    Page<ChiTietTDT> findByGiaBanBetween(BigDecimal begin, BigDecimal end, Pageable pageable);

    @Query(value = """
        SELECT TOP 10 CT.Id as id, DT.Ten as ten, CT.SoSeri as soSeri, CT.createDate as ngayTao
        FROM  ChiTietTDT CT
        JOIN TheDienThoai DT ON DT.Id = CT.IdTheDienThoai
        WHERE CT.TrangThai = 1 and CT.CreateDate BETWEEN :startDate AND :endDate
        ORDER BY CT.CreateDate ASC
    """, nativeQuery = true)
    List<TopTonKho> topSanPhamTonKhoByNgay(@Param("startDate") Date startDate, @Param("endDate")Date endDate);

    @Query(value = """
        SELECT TOP 10 CT.Id as id, DT.Ten as ten, CT.SoSeri as soSeri, CT.createDate as ngayTao
        FROM  ChiTietTDT CT
        JOIN TheDienThoai DT ON DT.Id = CT.IdTheDienThoai
        WHERE CT.TrangThai = 1 and MONTH(CT.CreateDate) = :month 
        ORDER BY CT.CreateDate ASC
    """, nativeQuery = true)
    List<TopTonKho> topSanPhamTonKhoByThang(@Param("month") Integer month);

    @Query("""
        SELECT CT.id as id, DT.ten as ten, CT.soSeri as soSeri, CT.ngayTao as ngayTao
        FROM  ChiTietTDT CT
        JOIN TheDienThoai DT ON DT.id = CT.theDienThoai.id
        WHERE CT.trangThai = 1 and YEAR(CT.ngayTao) = :year 
        ORDER BY CT.ngayTao ASC
    """)
    List<TopTonKho> topSanPhamTonKhoByNam(@Param("year") Integer year);

    @Query("""
        SELECT ct
        FROM ChiTietTDT ct
        LEFT JOIN KhuyenMaiChiTiet kmct ON ct.id = kmct.chiTietTDT.id
        LEFT JOIN KhuyenMai km ON km.id = kmct.khuyenMai.id
        WHERE (kmct.chiTietTDT.id IS NULL OR km.ngayKetThuc < :nowDate)
        and  ct.trangThai = 1
    """)
    List<ChiTietTDT> findAllByTrangThaiNotInKhuyenMai(@Param("nowDate") Date nowDate);

    @Query("""
        SELECT ct.id as id, ct.ma as ma, ct.theDienThoai as theDienThoai
        , ct.maThe as maThe, ct.soSeri as soSeri, ct.giaBan as giaBan, ct.moTa as moTa
        , (ctkm.giaBan * km.tiemGiam)/100 AS giaSauGiam
        FROM ChiTietTDT ct
        LEFT JOIN KhuyenMaiChiTiet kmct ON ct.id = kmct.chiTietTDT.id
        LEFT JOIN ChiTietTDT ctkm ON kmct.chiTietTDT.id = ctkm.id
        left join KhuyenMai km on km.id = kmct.khuyenMai.id
        WHERE ct.theDienThoai.id = :tdt and ct.trangThai = 1 
    """)
    Page<IChiTietTDT> findByTheDienThoaiAndTrangThaiAndKm(@Param("tdt")Integer tdt, Pageable pageable);

    //Kiểm tra sp hiện tại có khuyến mại
    @Query("""
        SELECT ct.id as id, ct.ma as ma, ct.theDienThoai as theDienThoai
            , ct.maThe as maThe, ct.soSeri as soSeri, ct.giaBan as giaBan, ct.moTa as moTa
            , (ct.giaBan * km.tiemGiam)/100 AS giaSauGiam
        FROM ChiTietTDT ct
        JOIN KhuyenMaiChiTiet kmct ON ct.id = kmct.chiTietTDT.id
        JOIN KhuyenMai km ON km.id = kmct.khuyenMai.id
        WHERE ct.id = :productId
            AND km.ngayKetThuc >= :currentDate
    """)
    IChiTietTDT findProductWithPromotion(@Param("productId") int productId, @Param("currentDate") Date currentDate);


}
