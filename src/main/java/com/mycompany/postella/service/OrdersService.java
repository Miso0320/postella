package com.mycompany.postella.service;

import java.util.List;
import java.util.Map;

import com.mycompany.postella.dto.OrderDetail;
import com.mycompany.postella.dto.Orders;
import com.mycompany.postella.dto.Payment;

public interface OrdersService {
	
	//사용자 이름 가져오기
	public String getUserName(int od_no);
	
	//사용한 포인트 업데이트하기
	public void changePoint(Map<String, Object> map);
	
	//주문 추가하기
	public int putOrder(Orders order);
	
	//주문 상세 추가하기
	public void putOrderDetail(List<OrderDetail> odList);
	
	//결제 추가하기
	public void putPayment(Payment payment);
}
