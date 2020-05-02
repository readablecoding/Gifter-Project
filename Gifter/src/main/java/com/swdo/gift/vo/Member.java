package com.swdo.gift.vo;

import java.io.Serializable;

import lombok.Data;

@Data
public class Member implements Serializable{
	String member_id;
	String member_pw;
	String member_email;
	String member_key;
}
