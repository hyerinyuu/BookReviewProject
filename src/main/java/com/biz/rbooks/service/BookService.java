package com.biz.rbooks.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.biz.rbooks.domain.BookDTO;
import com.biz.rbooks.domain.PageDTO;
import com.biz.rbooks.repository.BookDao;

@Service
public class BookService {

	/* extend해서 재사용 할수도 있으니까 protected로 선언함 */
	protected final BookDao bDao;
	
	@Autowired
	public BookService(BookDao bDao) {
		super();
		this.bDao = bDao;
	}

	public List<BookDTO> selectAll() {

		return bDao.selectAll();
	}
	
	public BookDTO findById(String b_code) {
		return bDao.findById(b_code);
	}

	public int insert(BookDTO bDTO) {
		return bDao.insert(bDTO);
	}

	public int update(BookDTO bDTO) {
		return bDao.update(bDTO);
	}

	public int delete(String b_code) {
		return bDao.delete(b_code);
	}

	public List<BookDTO> search(String keyword) {
		
		return bDao.findByName(keyword);
		
	}

	public List<BookDTO> findByName(String strText) {

			/*
			 * strText를 빈칸으로 분해해서 문자열 배열을 만들고
			 * 그 배열을 List<String> 형으로 변환한 다음 names List에 담아라
			 */
			List<String> names = Arrays.asList(strText.split(""));
			List<BookDTO> bookList = bDao.findBybNames(names);
			return bookList;

	}

	public long totalcount(String b_name) {
		
		String[] keywords = b_name.split(" ");
		List<String> keywordList = Arrays.asList(keywords);
		
		return bDao.totalCount(keywordList);
	}
	

	public List<BookDTO> findByBNameListAndPagiNation(String keyword, PageDTO pageDTO) {

		List<String> keywords = Arrays.asList(keyword.split(" "));
		
		return bDao.findByBNameListandPagination(keyword, pageDTO);
		
	}
	

}
