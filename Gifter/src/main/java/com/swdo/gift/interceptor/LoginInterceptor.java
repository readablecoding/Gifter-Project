package com.swdo.gift.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//세션에 저장된 아이디 가져오기
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		
		//로그인되지 않았다면 로그인 페이지로 이동시키기
		if(member_id == null) {
			response.sendRedirect("/member/loginForm");
			return false;			
		}
		
		//로그인되었다면 그대로 진행
		return true;	
	}
}
