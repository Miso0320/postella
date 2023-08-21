package com.mycompany.postella.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.postella.dto.OrderDetail;

@Mapper
public interface OrderDetailDao {
	
	//주문 상세 내역 추가하기
	public int insertOrdersDetail(OrderDetail od);

}
