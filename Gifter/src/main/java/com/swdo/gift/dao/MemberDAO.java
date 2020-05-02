package com.swdo.gift.dao;



import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.swdo.gift.vo.Member;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession session;
	
	
	public int memberInsert(Member member) {
		int cnt = 0;
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			cnt = mapper.memberInsert(member);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	
	public int memberLogin(Member member) {
		int cnt = 0;
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			cnt = mapper.memberLogin(member);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	
	
	public int GetKey(String member_id, String key) {
		int cnt = 0;
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			cnt = mapper.GetKey(member_id, key);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return cnt;
	}
	
	public int alter_userKey(String member_id, String key) {
		int cnt = 0;
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			cnt = mapper.alter_userKey(member_id, key);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return cnt;
	}
	
	public int alter_userKey_service(String member_id, String key) {
		int cnt = 0;
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			cnt = mapper.alter_userKey_service(member_id, key);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return cnt;
	}
	
	
	
	public int socialMemberInsert(Member member) {
		int cnt = 0;
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			cnt = mapper.socialMemberInsert(member);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return cnt;		
	}
	
	
	public int socialMemberFind(String member_email) {
		int cnt = 0;
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			cnt = mapper.socialMemberFind(member_email);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return cnt;	
		
	}
	
	public int nonMemberCheck(String member_id) {	
		int cnt = 0;
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			cnt = mapper.nonMemberCheck(member_id);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return cnt;	
	}
	
	public ArrayList<Member> memberIdFind(String member_email) {
		ArrayList<Member> list = null;
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			list = mapper.memberIdFind(member_email);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
	
	public int emailAuthCheck(Member member) {
		int cnt = 0;
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			cnt = mapper.emailAuthCheck(member);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public Member memberInfoById(String member_id){
		Member vo = null;
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			vo = mapper.memberInfoById(member_id);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	public int tempPassword(String member_id, String member_email, String key) {
		int cnt = 0;
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			cnt = mapper.tempPassword(member_id, member_email, key);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	
	public int pwUpdate(Member member) {
		int cnt = 0;
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			cnt = mapper.pwUpdate(member);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public int memberDeletion(Member member) {
		int cnt = 0;
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			cnt = mapper.memberDeletion(member);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return cnt;
		
	}
	
}
