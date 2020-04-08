package com.biz.rbooks.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.UpdateProvider;

import com.biz.rbooks.domain.BookDTO;
import com.biz.rbooks.domain.PageDTO;
import com.biz.rbooks.domain.ReadBookDTO;

public interface BookDao {

	@Select("SELECT * FROM tbl_books")
	public List<BookDTO> selectAll();

	@Select("SELECT * FROM tbl_books WHERE B_CODE = #{b_code}")
	@Results(
				value= {
						@Result(property = "b_code" , column = "b_code"),
						@Result(property = "rbList", column="rb_bcode", javaType=List.class, many = @Many(select = "getBooks"))
				}
			)
	public BookDTO findById(String b_code);
	
	@InsertProvider(type = BookSQL.class, method="insert_sql")
	public int insert(BookDTO bDTO);
	
	@UpdateProvider(type = BookSQL.class, method="update_sql")
	public int update(BookDTO bDTO);
	
	@Delete("DELETE FROM tbl_books WHERE B_CODE = #{b_code}")
	public int delete(String b_code);
	
	@Select("SELECT * FROM tbl_books WHERE B_NAME LIKE '%' || #{b_name} || '%' ")
	// 도서명으로 검색 하기 위한 method
	public List<BookDTO> findByName(String keyword);

	@Select(BookSQL.findByName)
	// modalBox search
	public List<BookDTO> findBybNames(@Param("names")List<String> names);

	public long totalCount(List<String> keywordList);

	public List<BookDTO> findByBNameListandPagination(String keyword, PageDTO pageDTO);
	
	
}
