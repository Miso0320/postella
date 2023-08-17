package com.mycompany.postella.dto;

import lombok.Data;

@Data
public class ProductGroup {
	// 상품그룹 테이블 컬럼
	private int pg_no;			// product group의 번호
	private String pg_name;		// product group의 이름(상품페이지의 상품제목)
	
	// 상품 이미지 관련
	private String img_type;	// img 타입
	private String encodedFile;	// encoded된 이미지파일
	
	// 상품 가격 관련
	private int prd_org_price;	// 정상가
	private int prd_price;		// 판매가
}
