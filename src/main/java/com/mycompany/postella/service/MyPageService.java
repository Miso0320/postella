package com.mycompany.postella.service;

import java.util.List;
import java.util.Map;

import com.mycompany.postella.dto.Orders;

/**
 * 
 * @author 김미소
 *
 */
public interface MyPageService {
	
	// 마이페이지 주문목록 가져오기
	public List<Orders> getOrderList(Map<String, Object> map);
	
	// 마이페이지 주문목록 삭제하기
	public void removeOrder(int od_detail_no);
	
	// 마이페이지 주문목록 개수 가져오기
	public int getTotalOrderNum(Map<String, Object> map);
	
	// 마이페이지 주문목록 삭제 시 주문그룹 수량 변경
	public void updateOrderDelete(int us_no, int od_no, int od_item_cnt);
}
