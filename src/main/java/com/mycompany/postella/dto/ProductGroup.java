package com.mycompany.postella.dto;

import lombok.Data;

@Data
public class ProductGroup {
	// product group의 번호
	private int pg_no;
	// product group의 이름(상품페이지의 상품제목)
	private String pg_name;
	// img 타입
	private String img_type;
	// encoded된 이미지파일
	private String encodedFile;
	// 정상가
	private int prd_org_price;
	// 판매가
	private int prd_price;
}
