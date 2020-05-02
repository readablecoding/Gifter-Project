package com.swdo.gift.dao;

import java.util.ArrayList;

import com.swdo.gift.vo.Member;

public interface MemberMapper {

	public int memberInsert(Member member); //회원 가입
	
	public int memberLogin(Member member); //회원 로그인
	
	public int GetKey(String member_id, String key); //유저 인증키 생성 메서드
	
	public int alter_userKey(String member_id, String key); //유저 인증키 Y로 바꿔주는 메서드

	public int alter_userKey_service(String member_id, String key); // 인증 확인 메서드 (Y 값으로 바꿔주는 메서드)

	public int socialMemberInsert(Member member); //소셜 로그인 멤버 추가
	
	public int socialMemberFind(String member_email); //소셜 로그인 멤버 찾기
	
	public int nonMemberCheck(String member_id); //비회원 아이디 중복 체크용
	
	public ArrayList<Member> memberIdFind(String member_email); //회원 아이디 찾기
	
	public int emailAuthCheck(Member member); //이메일 인증 여부 확인
	
	public Member memberInfoById(String member_id); //아이디로 회원 정보 찾기
	
	public int tempPassword(String member_id, String member_email, String key); //임시 비밀번호 생성
	
	public int pwUpdate(Member member); //비밀번호 수정
	
	public int memberDeletion(Member member); //회원 탈퇴
	
}

