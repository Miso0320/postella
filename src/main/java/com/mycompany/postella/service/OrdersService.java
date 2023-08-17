package com.mycompany.postella.service;

import java.util.List;

import com.mycompany.postella.dto.OrderDetail;
import com.mycompany.postella.dto.Orders;

public interface OrdersService {
	public String getUserName(int od_no);
	public void putOrderAndOrderDetail(Orders order, List<OrderDetail> orderDetails);
}
