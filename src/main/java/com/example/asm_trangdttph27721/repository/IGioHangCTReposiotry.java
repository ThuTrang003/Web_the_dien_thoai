package com.example.asm_trangdttph27721.repository;

import com.example.asm_trangdttph27721.model.ChiTietTDT;
import com.example.asm_trangdttph27721.model.GioHang;
import com.example.asm_trangdttph27721.model.GioHangCT;
import com.example.asm_trangdttph27721.model.KhachHang;
import com.example.asm_trangdttph27721.response.SoLuongSanPham;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface IGioHangCTReposiotry extends JpaRepository<GioHangCT, Integer> {

    @Query("""
        select a
        from GioHangCT a
        join GioHang b on a.gioHang.id = b.id
        where b.khachHang.id = :id_kh
    """)
    Page<GioHangCT> findAllByKhachHang(@Param("id_kh") Integer idKH, Pageable pageable);

    @Query("""
        select a
        from GioHangCT a
        join GioHang b on a.gioHang.id = b.id
        where b.khachHang.id = :id_kh
    """)
    List<GioHangCT> findAllByKH(@Param("id_kh") Integer idKH);
}
