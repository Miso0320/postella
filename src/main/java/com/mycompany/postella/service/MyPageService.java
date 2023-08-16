package com.mycompany.postella.service;

import java.util.List;
import java.util.Map;

import com.mycompany.postella.dto.Orders;

public interface MyPageService {
	public List<Orders> getOrderList(Map<String, Object> map);
	public void removeOrder(int od_detail_no);
	public int getTotalOrderNum(Map<String, Object> map);
}
