package com.mycompany.postella.dto;

import lombok.Data;

@Data
public class DeliverAddress {
	private int da_no;				//주소 식별번호
	private String da_type; 		//구매자인지 판매자인지 확인, 구매자:C, 판매자:S
	private int us_no; 				//유저식별번호
	private int  sel_no; 			//판매자식별번호
	private String da_name;			//받는 사람 이름
	private String da_tel;			//받는 사람 전화번호
	private String da_postcode; 	//우편번호
	private String da_adr; 			//주소
	private String da_detail_adr;	//상세주소
	private String da_main; 		//기본배송지 여부, Y/N
	
}
