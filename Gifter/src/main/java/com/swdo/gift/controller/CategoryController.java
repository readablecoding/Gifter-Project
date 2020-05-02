package com.swdo.gift.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.swdo.gift.dao.CategoryDAO;
import com.swdo.gift.util.PageNavigator;
import com.swdo.gift.vo.Category;

@Controller
@RequestMapping(value="/category")
public class CategoryController {

	private static final Logger logger = LoggerFactory.getLogger(CategoryController.class);
	
	//보여주는 글 개수는 3개
	private final int countPerPage = 3;
		
	//글 그룹은 4개
	private final int pagerPerGroup = 4;
		
	/*
	 * //현재 페이지는 1페이지 private final int currentPage = 1;
	 */
	
		
	@Autowired
	private CategoryDAO dao;
	
	@RequestMapping(value="bestForm", method=RequestMethod.GET)
	public String bestForm() {
		logger.info("베스트를 고르는 창 이동");
		return "category/bestForm";
	}
	
	
		
	
	@RequestMapping(value="categoryList", method= {RequestMethod.POST, RequestMethod.GET})
	public String categoryList(int age, int age_range, int gender, Model model
			, @RequestParam(value="currentPage", defaultValue="1") int currentPage, HttpSession session) {
		logger.info("카테고리 리스트 보여주기");
		logger.info("나이 : {}", age);		//나이는 10, 20, 30, 40을 나눔
		logger.info("나이대 : {}", age_range); //초반은 10이고 후반은 5이다
		logger.info("성별 : {}", gender);	//남자는 0이고 여자는 1이다.
		
		//1)나이와 나이대를 가지고 조합하기
		//받아온 나이(age)에 나이대(age_range) 10이면 초반, 5면 후반 => 이걸 빼서 나온 값을 info_age에 넣음
		//받아온 성별까지 2개를 가지고 리스트를 가져온다.
		
		int totalRecordsCount = dao.listCount(); //글 개수 가져오기
		System.out.println("저장된 글 개수는 " + totalRecordsCount + "개");
		
		PageNavigator navi = new PageNavigator(countPerPage, pagerPerGroup, currentPage, totalRecordsCount);
		
		int info_age = age - age_range; // 받아온 나이 - 받아온 나이대
		int info_gender = gender;
		session.setAttribute("info_age", info_age);
		session.setAttribute("info_gender", info_gender);
		
		Category category = new Category();
		category.setInfo_age(info_age);
		category.setInfo_gender(info_gender);
		
		ArrayList<HashMap<String, Object>> list = dao.categoryList(category, navi.getStartRecord(), countPerPage);
//		if(list.isEmpty()) {
//			logger.info("리스트가 없습니다.");
//			
//			//bestForm.jsp에 리스트가 없다는 것을 alert()로 띄우기
//		
//			
//			return "redirect:bestForm";
//		}
		logger.info("리스트가 있습니다.");
		System.out.println(list);
		model.addAttribute("list", list);
		model.addAttribute("navi", navi);
				
		return "category/categoryList";
	}

	
	@RequestMapping(value="pagingMove", method = RequestMethod.GET)
	public String pagingMove(@RequestParam(value="currentPage", defaultValue="1") int currentPage
			,HttpSession session, Model model) {
	
		int totalRecordsCount = dao.listCount(); //글 개수 가져오기
		System.out.println("저장된 글 개수는 " + totalRecordsCount + "개");
		
		if(currentPage > 4) {
			
			currentPage = 4;
		}
		
		if(currentPage < 0) {
			
			currentPage = 1;
		}
		
		
		PageNavigator navi = new PageNavigator(countPerPage, pagerPerGroup, currentPage, totalRecordsCount);	
		
		int info_age = (int)session.getAttribute("info_age");
		int info_gender = (int)session.getAttribute("info_gender");
	 
		Category category = new Category();
		category.setInfo_age(info_age);
		category.setInfo_gender(info_gender);
	 
		ArrayList<HashMap<String, Object>> list = dao.categoryList(category, navi.getStartRecord(), countPerPage);
	 
//		if(list.isEmpty()) {
//			logger.info("리스트가 없습니다.");
//			
//			//bestForm.jsp에 리스트가 없다는 것을 alert()로 띄우기
//		
//			
//			return "redirect:bestForm";
//		}
		logger.info("리스트가 있습니다.");
		System.out.println(list);
		model.addAttribute("list", list);
		model.addAttribute("navi", navi);
				
		return "category/categoryList";
		
	
	}
	
	
	
}
