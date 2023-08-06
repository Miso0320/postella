package com.mycompany.postella.dto;

import lombok.Data;

@Data
public class Agreement {
	// 약관동의 테이블 관련
	private int us_no;	//회원고유번호
	private String ag_age;	//만 14세 이상 여부
	private String ag_use;	//이용약관 동의여부
	private String ag_elec;	//전자금융거래 이용약관 동의여부
	private String ag_info;	//개인정보 수집 및 이용 동의여부
	private String ag_three;	//개인정보 제3자 제공 동의여부
	private String ag_ma;	//마케팅목적 개인정보 수집 동의여부
	private String ag_adv;	//광고성 정보 수신 동의여부
	private String ag_sms;	//이메일 수신 동의 여부
	private String ag_email;	//SMS, SNS 수신동의 여부
}
