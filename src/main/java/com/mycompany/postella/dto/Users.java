package com.mycompany.postella.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Users {
	// 회원 테이블 관련
	private int us_no;					// 회원고유번호
	private String us_email;			// 이메일
	private String us_password;			// 비밀번호
	private String us_name;				// 이름
	private String us_tel;				// 전화번호
	private String us_nickname;			// 닉네임
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date us_insertdate;			// 가입날짜
	private String us_sleep;			// 휴면회원여부
	private String us_withdrawal;		// 탈퇴여부
	private int us_point;				// 유저 포인트 잔액
}
