package com.swdo.gift.dao;

import java.util.ArrayList;

import com.swdo.gift.vo.Taker;

public interface TakerMapper {
	
	public int takerInsert(Taker taker);
	public ArrayList<Taker> takerSelect();
	
}
