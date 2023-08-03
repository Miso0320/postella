package com.mycompany.postella.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Review {
	private int rev_no; //리뷰 번호
	private int od_detail_no; //주문상세 식별자
	private String content; //리뷰 내용 
	private int rev_star_rate; //별점, 범위 1~5
	private Date rev_date; //리뷰 등록일
}
