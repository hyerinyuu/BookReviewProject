package com.biz.rbooks.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.biz.rbooks.domain.BookDTO;
import com.biz.rbooks.domain.PageDTO;
import com.biz.rbooks.domain.ReadBookDTO;
import com.biz.rbooks.service.BookService;
import com.biz.rbooks.service.PageService;
import com.biz.rbooks.service.ReadBookService;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/books")
@Slf4j
@SessionAttributes("bDTO")
@Controller
public class BookController {

	BookService bService;
	ReadBookService rbService;
	PageService pService;
	
	@Autowired
	public BookController(BookService bService, ReadBookService rbService) {
		this.bService = bService;
		this.rbService = rbService;
	}
	
	@ModelAttribute("bDTO")
	public BookDTO newBookDTO() {
		
		return new BookDTO();
	}
	
//	@RequestMapping(value="/list", method=RequestMethod.GET)
//	public String list(Model model, @RequestParam(value="currentPageNo",required=false, defaultValue="1") int currentPageNo) {
//		
//		PageDTO pageDTO = pService.getPagination(bService.getBookCount, currentPageNo);
//		
//		if(pageDTO == null) {
//			return "home";
//		}
//		
//		List<BookDTO> bList = bService.selectPagination(pageDTO.getOffset(), pageDTO.getLimit());
//		
//		model.addAttribute("bList", bList);
//		model.addAttribute(attributeName, attributeValue)
//		
//	}
//	
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list(Model model, @RequestParam(value="b_name", required = false) String b_name, 
			@RequestParam(value="currentPageNo", required = false, defaultValue = "1") int currentPageNo) {
		
		PageDTO pageDTO = null;
		List<BookDTO> bList = null;
		
		if(b_name == null || b_name.isEmpty()) {
			bList = bService.selectAll();
		}else{
			long totalCount = bService.totalcount(b_name);
			pageDTO = pService.getPagination(totalCount, currentPageNo);
			bList = bService.findByBNameListAndPagiNation(b_name, pageDTO);
		}
		
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("keyword", b_name);
		model.addAttribute("BLIST", bList);
		
		return "home";
		
	}

//	@RequestMapping(value="/list", method=RequestMethod.GET)
//	public String list(Model model, @RequestParam(name="keyword", required=false) String keyword) {
//
//		List<BookDTO> bList = null;
//		
//		if(keyword == null || keyword.isEmpty()) {
//			bList = bService.selectAll();
//		}else {
//			bList = bService.search(keyword);
//		}
//		
//		log.debug("#### 책리스트" + bList.toString());
//		
//		model.addAttribute("BLIST", bList);
//		return "home";
//	}

	// input modal box search
	@RequestMapping(value="/search", method=RequestMethod.POST)
	public String search(@RequestParam(value="strText", required = false, defaultValue = "") String strText, Model model) {
		
		List<BookDTO> bookList = bService.findByName(strText);
		model.addAttribute("BLIST", bookList);
		return "books/list-body";
	}
	
	
	@RequestMapping(value="/viewdetail", method=RequestMethod.GET)
	public String viewdetail(@RequestParam("bcode") String b_code, @ModelAttribute("bDTO") BookDTO bDTO, ReadBookDTO rbDTO, Model model) {
		
		bDTO = bService.findById(b_code);
		
		log.debug("rbDTO" + rbDTO);
		model.addAttribute("bDTO", bDTO);
		return null;
	}

	@RequestMapping(value="/insert", method=RequestMethod.GET)
	public String insert(@ModelAttribute("bDTO") BookDTO bDTO, Model model, SessionStatus status){

		// ISBN 자동생성해서 넣는 코드 추가하기
		// 도서코드가 일치하는 도서에 insert를 수행하면 insert막아주는 코드 (ajax로 Stirng Yes No 식으로 보내기)
		// code check 따로 만들어야함

		model.addAttribute("bDTO", bDTO);
		status.setComplete();
		return "books/insert";
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String insert(@ModelAttribute("bDTO") BookDTO bDTO, SessionStatus status) {
		
		bService.insert(bDTO);
		
		log.debug("###insert 값" + bDTO.toString());
		
		status.setComplete();
		return "redirect:/books/list";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String update(@ModelAttribute("bDTO") BookDTO bDTO, Model model, @RequestParam("id") String b_code) {
		
		bDTO = bService.findById(b_code);
		model.addAttribute("bDTO", bDTO);
		
		return "books/insert";
	}

	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String update(@ModelAttribute("bDTO")BookDTO bDTO, SessionStatus status) {
		
		bService.update(bDTO);
		status.setComplete();
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String delete(@ModelAttribute("bDTO") BookDTO bDTO) {

		bService.delete(bDTO.getB_code());
		
		return "redirect:/books/list";
	}
	
	
}
