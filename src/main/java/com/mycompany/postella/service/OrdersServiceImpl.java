package com.mycompany.postella.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.postella.dao.ImageDao;
import com.mycompany.postella.dao.OrdersDao;

@Service
public class OrdersServiceImpl implements OrdersService{
	
	@Autowired
	private OrdersDao ordersDao;
	
	@Override
	public String getUserName(int od_no) {
		String uname = ordersDao.selectUsName(od_no);
		return uname;
	}
	
}
