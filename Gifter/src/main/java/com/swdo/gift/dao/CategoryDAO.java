package com.swdo.gift.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.swdo.gift.vo.Category;

@Repository
public class CategoryDAO {

	@Autowired
	private SqlSession session;
	
	//리스트
	public ArrayList<HashMap<String, Object>> categoryList(Category category, int startRecord, int countPerPage){
		ArrayList<HashMap<String, Object>> list = null;
		try {
			CategoryMapper mapper = session.getMapper(CategoryMapper.class);
			RowBounds rb = new RowBounds(startRecord, countPerPage);
			list = mapper.categoryList(category, rb);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;	
	}
	
	//개수
	public int listCount() {
		int cnt = 0;
		try {
			CategoryMapper mapper = session.getMapper(CategoryMapper.class);
			cnt = mapper.listCount();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
}
