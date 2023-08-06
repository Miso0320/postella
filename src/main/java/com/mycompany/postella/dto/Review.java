package com.mycompany.postella.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Review {
	private int rev_no; //리뷰 번호
	private int od_detail_no; //주문상세 식별자
	private String rev_content; //리뷰 내용 
	private int rev_star_rate; //별점, 범위 1~5
	private Date rev_date; //리뷰 등록일
	private int prd_no; //옵션 식별번호
	private String us_name; //주문자 이름
	private String prd_name; //상품 옵션 이름
	private String str_date; //리뷰 등록일 변환
}
