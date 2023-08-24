package com.mycompany.postella.dto;

import lombok.Data;

@Data
public class Cart {
	// 장바구니 테이블 컬럼
	private int us_no; 			//사용자 식별번호
	private int prd_no; 		//상품 식별번호
	private int crt_qty; 		//장바구니에 담긴 상품에 수량
	private int prd_price;		//상품 가격
	private int prd_ship_fee;	//배송비
	
	// 장바구니 목록 추가 항목
	private String prd_name;	//상품 이름
	private String img_type;	//img 타입
	private String encodedFile;	//encoded된 이미지파일
	private String pg_name;		//상품 대분류 이름
}
