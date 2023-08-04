package com.mycompany.postella.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Product {
	private int prd_no; //상품구분번호
	private int sel_no; //판매자 식별번호
	private String  prd_category; //카테고리 타입, 코드테이블 사용
	private String prd_name; //상품이름
	private int prd_org_price; //정상가
	private int prd_price; //판매가
	private Date prd_expected_date; //도착 예정일
	private String prd_content; //상품 상세 페이지 내용(텍스트)
	private int prd_stock; //재고
	private int prd_ship_fee; //배송비
	private Date prd_date; //상품등록일
	private int prd_hitcount; //조회수
	private int prd_sale_amount; //판매량
	private String prd_yn; //판매여부
	private int prd_star_avg; //상품 당 평균 별점, 범위  0~5
	private int pg_no; //상품 대분류 식별번호
}
