package com.mycompany.postella.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.postella.dao.OrdersDao;
import com.mycompany.postella.dto.Orders;

import lombok.extern.slf4j.Slf4j;

@Slf4j
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
		ordersDao.deleteOrderDetail(od_detail_no);
	}
	
	// 마이페이지 주문목록 개수 가져오기
	@Override
	public int getTotalOrderNum(Map<String, Object> map) {
		int totalOrderNum = ordersDao.orderListCnt(map);
		return totalOrderNum;
	}

	@Override
	public void updateOrderDelete(int us_no, int od_no, int od_item_cnt) {
		Map<String, Object> map = new HashMap<>();
		map.put("us_no", us_no);
		map.put("od_no", od_no);
		
		// 전체 개수가 1인 경우 아예 삭제
		if(od_item_cnt <= 1) {
			int result = ordersDao.deleteOrder(od_no);
		// 전체 개수가 2 이상인 경우 개수만 update
		} else {
			od_item_cnt--;
			map.put("od_item_cnt", od_item_cnt);
			
			int result = ordersDao.updateOrder(map);
		}
	}
	
}
