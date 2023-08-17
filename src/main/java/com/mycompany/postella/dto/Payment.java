package com.mycompany.postella.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Payment {
	private int od_no;	//주문번호
	private int po_no;	//포인트 식별번호
	private String pay_method;	//결제수단, 코드테이블 사용
	private Date pay_date;	//결제날짜
}
