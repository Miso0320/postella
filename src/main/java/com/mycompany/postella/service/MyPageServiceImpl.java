package com.mycompany.postella.service;

import java.util.Date;
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
	
	@Override
	public List<Date> getOdDate(int us_no) {
		List<Date> dates = ordersDao.selectOdDate(us_no);
		return dates;
	}

	@Override
	public List<Orders> getOrderList(Map<String, Object> map) {
		List<Orders> order = ordersDao.selectOrderList(map);
		return order;
	}
}
