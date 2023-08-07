package com.mycompany.postella.dto;

import lombok.Data;

@Data
public class Orders {
	private int od_no;	//주문번호
	private int us_no;	//회원고유번호
	private int cp_no;	//쿠폰고유번호
	private int od_date;	//주문날짜
	private int od_status;	//주문상태
	private int od_req_type;	//배송 요청사항 타입
	private int od_req;	//배송 요청 사항 입력란 있는 경우
	private int od_door_pwd;	//공동현관 출입번호
	private int od_item_cnt;	//주문상품 종류의 개수
	private int od_arrived_date;	//구매자가 배송받은 날짜
	private int od_total_price;	//총 주문금액

}
