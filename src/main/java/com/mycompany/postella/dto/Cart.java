package com.mycompany.postella.dto;

import lombok.Data;

@Data
public class Cart {
	private int us_no; //사용자 식별번호
	private int prd_no; //상품 식별번호
	private int crt_qty; //장바구니에 담긴 상품에 수량
	private int prd_price;
	private String prd_name;
	private String img_type;//img 타입
	private String encodedFile;//encoded된 이미지파일
}
