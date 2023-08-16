package com.mycompany.postella.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.postella.dto.Orders;

@Mapper
public interface OrdersDao {
	public String selectUsName(int od_no);

	// 주문목록 가져오기
	public List<Orders> selectOrderList(Map<String, Object> map);

	// 주문내역 삭제
	public int deleteOrder(int od_detail_no);
	
	// 주문목록 수 가져오기
	public int orderListCnt(Map<String, Object> map);
	
	//주문 내역 추가하기
	public int insertOrder(Orders order);

}
