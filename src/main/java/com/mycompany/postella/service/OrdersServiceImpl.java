package com.mycompany.postella.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.postella.dao.ImageDao;
import com.mycompany.postella.dao.OrdersDao;
import com.mycompany.postella.dao.OrderDetailDao;
import com.mycompany.postella.dto.OrderDetail;
import com.mycompany.postella.dto.Orders;

@Service
public class OrdersServiceImpl implements OrdersService{
	
	@Autowired
	private OrdersDao ordersDao;
	
	@Autowired
	private OrderDetailDao odDao;
	
	@Override
	public String getUserName(int od_no) {
		String uname = ordersDao.selectUsName(od_no);
		return uname;
	}
	
	@Override
	public void putOrderAndOrderDetail(Orders order, List<OrderDetail> orderDetails) {
		ordersDao.insertOrder(order);
		
		for (OrderDetail orderDetail : orderDetails) {
            orderDetail.setOd_no(order.getOd_no());
            odDao.insertOrdersDetail(orderDetail);
        }
	}
	
}
