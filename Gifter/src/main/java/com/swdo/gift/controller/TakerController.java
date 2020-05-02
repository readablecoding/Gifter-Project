package com.swdo.gift.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.EntityAnnotation;
import com.google.cloud.vision.v1.Feature.Type;

import com.swdo.gift.dao.MemberDAO;
import com.swdo.gift.dao.TakerDAO;
import com.swdo.gift.util.SeleniumCrawling;
import com.swdo.gift.util.URLAnotationGoogle;
import com.swdo.gift.vo.Member;
import com.swdo.gift.vo.Taker;

@Controller
@RequestMapping(value="/taker")
public class TakerController {

	private static final Logger logger = LoggerFactory.getLogger(TakerController.class);
	
	@Autowired
	private TakerDAO dao;
	
	@Autowired
	private MemberDAO dao2;
	
	
	@RequestMapping(value="search", method= {RequestMethod.GET, RequestMethod.POST})
	public String search(String taker_insta, Model model, HttpSession session) {
		
//		logger.info("회원 아이디와 인스타그램 id 저장");
//		
//		String member_id = "";
//		
//		//taker 테이블에 회원 아이디와 검색한 인스타그램 아이디 보여주기
//		//회원으로 로그인했다면 세션에 저장된 member_id를 넣음
//		//비회원이라면 비회원이라는 증거를 member_id에 넣는다.
//		
//		String savedId = (String) session.getAttribute("member_id");
//		
//		//세션에 저장된 id가 있는지 확인
//		if(savedId == null) { 
//			System.out.println("비회원 검색");
//					
//			//아이디가 뒤에 1씩 증가한 값이 들어가서 아이디 생성
//			String basicId = "nonMember";
//			String tempId = "";
//			for(int i = 0; ; i++) {
//				tempId = basicId + i;
//				if(dao2.nonMemberCheck(tempId) == 0) {
//					break;
//				}
//			}
//			System.out.println("비회원이 쓸 아이디는 : " + tempId);
//		
//						
//			String nonMemberId = tempId;
//			String nonMemberPw = "nonMemberPwrd";
//			String nonMemberEmail = "nonMember@nm.nm";
//			String nonMemberKey = "Y";
//			
//			Member member = new Member();
//			member.setMember_id(nonMemberId);
//			member.setMember_pw(nonMemberPw);
//			member.setMember_email(nonMemberEmail);
//			
//			
//			int cnt = dao2.memberInsert(member);
//			if(cnt != 0) {
//				logger.info("비회원 DB에 저장");
//			}
//			else {
//				logger.info("비회원 DB에 저장 실패");
//			}		
//			member_id = nonMemberId;
//			
//		}
//		else {
//			System.out.println("회원 검색");
//			member_id = savedId;
//		}
//		
//			
//		//검색한 인스타그램 아이디를 통해 인스타그램에 실제로 아이디가 있는지 확인
//		//1)아이디가 있었다.		-> GI_Taker 테이블에 2개 데이터를 넣고 카테고리 데이터 보여줌
//		//2)아이디가 없었다.		-> 다시 home.jsp로 옮겨가서 아이디가 없다고 보여줌
//		
//		
//		 logger.info("회원의 ID : {}", member_id); 
//		 logger.info("검색한 인스타그램 ID : {}",taker_insta); 
//		 Taker taker = new Taker(); 
//		 taker.setMember_id(member_id);
//		 taker.setTaker_insta(taker_insta);
//		 
//		 
//		 int cnt = dao.takerInsert(taker); 
//		 if(cnt == 0) {
//			 logger.info("회원과 검색한 인스타ID 저장 실패"); 
//		 } 
//		 else {
//			 logger.info("회원과 검색한 인스타ID 저장 성공"); 
//		 }
//	
//		 
//		 //해당하는 인스타그램의 회원이 있는지를 확인하고 있으면 
//		 //해당 인스타그램 회원의 카테고리별 10개를 찾을 수 있게 된다. 
//		 //해당하는 회원이 없다면 없다는 것을 보여줘야 한다.
//		 
//		 
//
//		 //카테고리별 10개를 보여주도록 정보 가져오기
//		 
//		 
//		 model.addAttribute("member_id", member_id); 
//		 model.addAttribute("taker_insta", taker_insta);
//		 
		
//		SeleniumCrawling craw = new SeleniumCrawling();
//		ArrayList<String> imgList = craw.InstaCrawl(taker_insta);
//		URLAnotationGoogle Ano = new URLAnotationGoogle();
//		try {
//			Ano.AsyncBatchAnnotateImages(imgList);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		
		String savedId = (String) session.getAttribute("member_id");
		
		ArrayList<Taker> taker = dao.takerSelect();
		Taker userTaker = new Taker();
		userTaker.setMember_id(savedId);
		userTaker.setTaker_insta(taker_insta);
		if(savedId != null) {
			dao.takerInsert(userTaker);
		}
		
		
		model.addAttribute("taker", taker);
		model.addAttribute("userTaker",userTaker);
				
		
		
		 return "taker/search";
		 
		
	}
	
	
	
}
