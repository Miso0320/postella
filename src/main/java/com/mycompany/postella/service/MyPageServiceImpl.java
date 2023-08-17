package com.mycompany.postella.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.postella.dao.OrdersDao;
import com.mycompany.postella.dto.Orders;

@Service
public class MyPageServiceImpl implements MyPageService{
	
	@Autowired
	private OrdersDao ordersDao;
	
	// 마이페이지 주문목록 가져오기
	@Override
	public List<Orders> getOrderList(Map<String, Object> map) {
		List<Orders> order = ordersDao.selectOrderList(map);
		return order;
	}
	
	// 마이페이지 주문목록 삭제하기
	@Override
	public void removeOrder(int od_detail_no) {
		ordersDao.deleteOrder(od_detail_no);
	}
	
	// 마이페이지 주문목록 개수 가져오기
	@Override
	public int getTotalOrderNum(Map<String, Object> map) {
		int totalOrderNum = ordersDao.orderListCnt(map);
		return totalOrderNum;
	}
	
	
	
}
