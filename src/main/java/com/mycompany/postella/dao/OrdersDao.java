package com.mycompany.postella.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.postella.dto.Orders;


@Mapper
public interface OrdersDao {
	public String selectUsName(int od_no);
	// 주문목록 날짜별 그룹핑
	public List<Date> selectOdDate(int us_no);
	// 주문목록 리스트
	public List<Orders> selectOrderList(Map<String, Object> map);
}
