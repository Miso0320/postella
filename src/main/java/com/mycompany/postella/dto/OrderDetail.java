package com.mycompany.postella.dto;

import lombok.Data;

@Data
public class OrderDetail {
	private int od_detail_no;	//주문상세 식별자
	private int prd_no;			//상품 식별자
	private int od_detail_qty;	//상품 개수
	private int od_no;			//주문번호
	private int od_detail_price;//상품별 주문금액
}
