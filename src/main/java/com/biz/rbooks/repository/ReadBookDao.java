package com.biz.rbooks.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.UpdateProvider;

import com.biz.rbooks.domain.BookDTO;
import com.biz.rbooks.domain.ReadBookDTO;

public interface ReadBookDao {

	@Select("SELECT * FROM tbl_read_book ORDER BY RB_BCODE DESC")
	public List<ReadBookDTO> selectAll();
	
	@Select("SELECT * FROM tbl_read_book R, tbl_books B WHERE RB_BCODE = #{b_code, jdbcType=VARCHAR} AND R.rb_bcode = B.b_code " )
	public List<ReadBookDTO> findByBCode(String rb_bcode);
	
	@InsertProvider(type=ReadBookSQL.class, method="insert_sql" )
	public int insert(ReadBookDTO rbDTO);
	
	@UpdateProvider(type=ReadBookSQL.class, method="update_sql" )
	public int update(ReadBookDTO rbDTO);
	
	@Delete("DELETE tbl_read_book WHERE RB_SEQ = #{rb_seq}" )
	public int delete(long rb_seq);

	@Select("SELECT * FROM tbl_read_book WHERE RB_SEQ = #{rb_seq}")
	public ReadBookDTO findBySeq(String rb_seq);
	
}
