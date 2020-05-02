package com.swdo.gift.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.swdo.gift.util.PageNavigator;
import com.swdo.gift.util.SeleniumCrawling;

@Controller
@RequestMapping(value="/category")
public class CrawlingController {
	
	private static final Logger logger = LoggerFactory.getLogger(CrawlingController.class);
	
	private final int countPerPage = 5;
	private final int pagePerGroup = 5;
    
    @RequestMapping(value = "/viewCategory", method = RequestMethod.GET)
	public String selenium2(Model model, HttpSession session
			, String age_range, String gender, String categoryName
			, @RequestParam(value="currentPage", defaultValue="1") int currentPage) throws Exception {
		
    	SeleniumCrawling selCrawl = new SeleniumCrawling();
		HashMap<String, Object> map = selCrawl.crawl(age_range,gender,categoryName);
		
		// 크롤링한 값 가져옴
		ArrayList<String> srcs = (ArrayList<String>) map.get("srcs");
		Elements title = (Elements) map.get("title");
		String[] prices = (String[]) map.get("prices");
		
		// jsp에서 사용하기 위해 모델에 저장
		model.addAttribute("srcs", srcs);
		model.addAttribute("prices", prices);
		model.addAttribute("title", title);

		// 타 컨트롤러에서 사용하기 위해 섹션에 저장 
		session.setAttribute("srcs", srcs);
		session.setAttribute("prices", prices);
		session.setAttribute("title", title);
		
		// 페이징처리
		int totalCount = srcs.size();
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, currentPage, totalCount);
		
		model.addAttribute("navi", navi);
		
		/* 배너용 추천상품 */
    	
    	// 추천상품으로 랜덤으로 2개 가져옴
    	Random random = new Random();
    	int[] num = new int[2];
    	for (int i = 0; i < 2; i++) {
    		num[i] = random.nextInt(srcs.size());
    		for (int j = 0; j < i; j++) {
    			if(num[i] == num[j]) {
    				i--;
    			}
			}
    	}
    	
    	// 타 컨트롤러에서 이용하기 위해 세션에 담음
    	session.setAttribute("p1", num[0]);
    	session.setAttribute("p2", num[1]);
    	
    	// 상품 이미지 2개
    	String recomSrc1 = srcs.get(num[0]);
    	String recomSrc2 = srcs.get(num[1]);

    	// 타이틀 및 하이퍼링크 2개		
    	Element recomTit1 = title.get(num[0]);
    	Element recomTit2 = title.get(num[1]);

    	// 해당 가격 2개
    	String recompri1 = prices[num[0]].toString();
    	String recompri2 = prices[num[1]].toString();

    	// 세션에 담아서 jsp에 보냄 (추천페이지에서 또 사용해야해서)
    	
    	model.addAttribute("recomSrc1", recomSrc1);
    	model.addAttribute("recomTit1", recomTit1);
    	model.addAttribute("recompri1", recompri1);
    	model.addAttribute("recomSrc2", recomSrc2);
    	model.addAttribute("recomTit2", recomTit2);
    	model.addAttribute("recompri2", recompri2);

		return "/category/viewCategory";
	}
    
    @RequestMapping(value = "selePageMove", method = RequestMethod.GET)
    public String selenium3(HttpSession session, @RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {
    	
    	logger.info("페이징 : "+currentPage);
    	
    	// 세션에서 전체 크롤링한 값 꺼냄
    	ArrayList<String> srcs = (ArrayList<String>) session.getAttribute("srcs");
    	Elements title = (Elements) session.getAttribute("title");
    	String[] prices = (String[]) session.getAttribute("prices");
    	
    	// 전체 크롤링값 = 페이징에 필요
    	int totalCount = srcs.size();
    	
    	// 페이징
    	PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, currentPage, totalCount);
    	
    	// jsp에서 사용하기 위해 모델에 저장
    	model.addAttribute("navi", navi);
    	model.addAttribute("srcs", srcs);
		model.addAttribute("title", title);
		model.addAttribute("prices", prices);
    	
    	return "/category/viewCategory";
    }
    
    @RequestMapping(value = "/recommendList", method = RequestMethod.GET)
   	public String recommendList(Model model, HttpSession session) throws Exception {
   		
    	logger.info("추천페이지 컨트롤러");
    	
    	// 세션에서 전체 크롤링한 값 꺼냄
    	ArrayList<String> srcs = (ArrayList<String>) session.getAttribute("srcs");
    	Elements title = (Elements) session.getAttribute("title");
    	String[] prices = (String[]) session.getAttribute("prices");
    	
    	// 기존 배너 상품의 번호를 가져옴
    	int p1 = (int) session.getAttribute("p1");
    	int p2 = (int) session.getAttribute("p2");
    	
    	// 추천상품으로 랜덤으로 3개 가져옴
    	Random random = new Random();
    	int[] num = new int[3];
    	for (int i = 0; i < 3; i++) {
    		num[i] = random.nextInt(srcs.size());
    		for (int j = 0; j < i; j++) {
    			if(num[i] == num[j]) {
    				i--;
    			}
    			if(num[i] == p1 || num[i] == p2) {
    				i--;
    			}
			}
    	}
    	
    	// 상품 이미지 5개
    	String recomSrc1 = srcs.get(p1);
    	String recomSrc2 = srcs.get(p2);
    	String recomSrc3 = srcs.get(num[0]);
 		String recomSrc4 = srcs.get(num[1]);
    	String recomSrc5 = srcs.get(num[2]);
    	// 타이틀 및 하이퍼링크 5개
    	Element recomTit1 = title.get(p1);
    	Element recomTit2 = title.get(p2);
    	Element recomTit3 = title.get(num[0]);
    	Element recomTit4 = title.get(num[1]);
    	Element recomTit5 = title.get(num[2]);
    	// 해당 가격 5개
    	String recompri1 = prices[p1].toString();
    	String recompri2 = prices[p2].toString();
    	String recompri3 = prices[num[0]].toString();
    	String recompri4 = prices[num[1]].toString();
    	String recompri5 = prices[num[2]].toString();
    			
    	// 세션에 담아서 jsp에 보냄 (추천페이지에서 또 사용해야해서)
    	
    	model.addAttribute("recomSrc1", recomSrc1);
    	model.addAttribute("recomSrc2", recomSrc2);
    	model.addAttribute("recomSrc3", recomSrc3);
    	model.addAttribute("recomSrc4", recomSrc4);
    	model.addAttribute("recomSrc5", recomSrc5);
		
    	model.addAttribute("recomTit1", recomTit1);
    	model.addAttribute("recomTit2", recomTit2);
    	model.addAttribute("recomTit3", recomTit3);
    	model.addAttribute("recomTit4", recomTit4);
    	model.addAttribute("recomTit5", recomTit5);
		
    	model.addAttribute("recompri1", recompri1);
    	model.addAttribute("recompri2", recompri2);
    	model.addAttribute("recompri3", recompri3);
    	model.addAttribute("recompri4", recompri4);
    	model.addAttribute("recompri5", recompri5);
    	
   		return "/category/recommendList";
   	}
    
    
    
    
}