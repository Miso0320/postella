package com.mycompany.postella.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.postella.dto.Orders;

/**
 * 
 * @author 김미소, 이송미
 *
 */
@Mapper
public interface OrdersDao {
	// 주문자 이름 가져오기
	public String selectUsName(int od_no);

	// 주문목록 가져오기
	public List<Orders> selectOrderList(Map<String, Object> map);

	// 주문목록 수 가져오기
	public int orderListCnt(Map<String, Object> map);
	
	// 개별주문내역 삭제
	public int deleteOrderDetail(int od_detail_no);
	
	// 주문 내역 추가하기
	public int insertOrder(Orders order);
	
	// 주문 그룹 내역 수량 변경
	public int updateOrder(Map<String, Object> map);	
	
	// 주문 그룹 내역 삭제
	public int deleteOrder(int od_no);
}
