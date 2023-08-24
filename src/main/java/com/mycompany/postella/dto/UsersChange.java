package com.mycompany.postella.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class UsersChange {
	// 회원 테이블 관련
	private int us_no;					// 회원고유번호
	private String us_email;			// 이메일
	private String us_password;			// 비밀번호
	private String us_name;				// 이름
	private String us_tel;				// 전화번호
	private String us_nickname;			// 닉네임
}