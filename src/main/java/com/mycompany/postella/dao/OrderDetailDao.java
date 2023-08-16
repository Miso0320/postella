package com.mycompany.postella.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.postella.dto.OrderDetail;

@Mapper
public interface OrderDetailDao {
	
	public int insertOrdersDetail(OrderDetail od);

}
