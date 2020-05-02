package com.swdo.gift.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.swdo.gift.vo.Taker;

@Repository
public class TakerDAO {

	@Autowired
	private SqlSession session;
	
	
	public int takerInsert(Taker taker) {
		int cnt = 0;
		try {
			TakerMapper mapper = session.getMapper(TakerMapper.class);
			cnt = mapper.takerInsert(taker);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return cnt;
		
	}
	
	public ArrayList<Taker> takerSelect() {
		ArrayList<Taker> taker = null;
		try {
			TakerMapper mapper = session.getMapper(TakerMapper.class);
			taker = mapper.takerSelect();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return taker;
	}
}
