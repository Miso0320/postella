package com.mycompany.postella.dto;

import lombok.Data;

@Data
public class ProductGroup {
	private int pg_no;//product group의 번호
	private String pg_name;//product group의 이름(상품페이지의 상품제목)
	private String img_type;//img 타입
	private String encodedFile;//encoded된 이미지파일
	private int prd_org_price; //정상가
	private int prd_price;//판매가
}
