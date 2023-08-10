package com.mycompany.postella.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Orders {
	private int od_no;	//주문번호
	private int us_no;	//회원고유번호
	private int cp_no;	//쿠폰고유번호
	@DateTimeFormat(pattern="yyyy.MM.dd")
	private Date od_date;	//주문날짜
	private String od_status;	//주문상태
	private String od_req_type;	//배송 요청사항 타입
	private String od_req;	//배송 요청 사항 입력란 있는 경우
	private String od_door_pwd;	//공동현관 출입번호
	private int od_item_cnt;	//주문상품 종류의 개수
	@DateTimeFormat(pattern="yyyy.MM.dd")
	private Date od_arrived_date;	//구매자가 배송받은 날짜
	
	// 목록 표출 시 추가로 가져올 내용
	private String prd_name;	//상품명
	private int prd_no;	//상품고유번호
	private int od_detail_qty;	//개별 상품 개수
	private int od_detail_price;	//개별 상품 금액
	private int od_detail_no;	//개별 상품 식별번호
	private String img_type;	//이미지 MIME 타입
	private String encodedFile;	//인코딩된 이미지
	
	// 날짜별 분류 시 기준 날짜
	private String startDate;	//시작하는 일자
	private String endDate;	//끝나는 일자
	
	// 주문목록 내 검색
	private String keyword;	//검색어

}
