package com.mycompany.postella.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Qna {
	private int qna_no; //문의게시글 번호
	private int us_no; //고객식별번호
	private int prd_no; //상품식별번호
	private String qna_kind; //상품페이지 문의내역, 고객센터 문의내역 코드테이블 사용
	private String qna_type; //고객의 소리 선택유형, 코드테이블 사용
	private String q_content; //상품문의내용
	private Date q_date; //문의 작성 시간
	private String a_content; //답변 작성 내용
	private Date a_date; //답변 작성 시간
	private int pg_no; //상품 대분류 구분번호
}
