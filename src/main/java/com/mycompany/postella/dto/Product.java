package com.mycompany.postella.dto;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class Product {
	// 개별 상품 테이블 컬럼
	private int prd_no; 				// 상품구분번호
	private int sel_no; 				// 판매자 식별번호
	private String  prd_category; 		// 카테고리 타입, 코드테이블 사용
	private String prd_name; 			// 상품이름
	private int prd_org_price; 			// 정상가
	private int prd_price; 				// 판매가
	private String prd_content; 		// 상품 상세 페이지 내용(텍스트)
	private int prd_stock; 				// 재고
	private int prd_ship_fee; 			// 배송비
	private Date prd_date; 				// 상품등록일
	private int prd_hitcount; 			// 조회수
	private int prd_sale_amount; 		// 판매량
	private String prd_yn; 				// 판매여부
	private int prd_star_avg; 			// 상품 당 평균 별점, 범위  0~5
	
	// 상품 대분류
	private int pg_no; 					// 상품 대분류 식별번호
	private String pg_name;				// 상품 대분류 이름
	
	// 상품 이미지
	private String img_type;			// img 타입
	private String encodedFile;			// encoded된 이미지파일
	
	// 상품 정렬 및 필터
	private String kind;				// 정렬기준 1:낮은가격순, 2:높은가격순, 3:최신순
	private List<String> brand;			// 브랜드별 필터
	private List<String> status;		// 상품상태별 필터
	private List<String> message;		// 메세지별 필터
	
	// 상품 리스트 검색(헤더)
	private String keyword;				// 검색어
	
	// 상품 수량
	private int quantity;				// 상품 수량
}
