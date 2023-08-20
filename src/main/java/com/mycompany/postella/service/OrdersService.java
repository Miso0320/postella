package com.mycompany.postella.service;

import java.util.List;

import com.mycompany.postella.dto.OrderDetail;
import com.mycompany.postella.dto.Orders;

public interface OrdersService {
	
	//사용자 이름 가져오기
	public String getUserName(int od_no);
	
	//주문과 주문 상세 내역 추가하기
	public void putOrderAndOrderDetail(Orders order, List<OrderDetail> orderDetails);
}
