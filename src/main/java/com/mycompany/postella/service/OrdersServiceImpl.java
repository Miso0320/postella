package com.mycompany.postella.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mycompany.postella.dao.OrderDetailDao;
import com.mycompany.postella.dao.OrdersDao;
import com.mycompany.postella.dao.PaymentDao;
import com.mycompany.postella.dao.UsersDao;
import com.mycompany.postella.dto.OrderDetail;
import com.mycompany.postella.dto.Orders;
import com.mycompany.postella.dto.Payment;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author 이송미
 *
 */
@Slf4j
@Service
public class OrdersServiceImpl implements OrdersService {

	@Autowired
	private OrdersDao ordersDao;

	@Autowired
	private OrderDetailDao odDao;

	@Autowired
	private UsersDao usersDao;

	@Autowired
	private PaymentDao paymentDao;

	// 사용자 이름 가져오기
	@Override
	public String getUserName(int od_no) {
		String uname = ordersDao.selectUsName(od_no);
		return uname;
	}
	
	// 주문 추가하기
	@Override
	public int putOrder(Orders order) {
		ordersDao.insertOrder(order);
		int od_no = order.getOd_no();
		
		return od_no;
	}
	
	// 주문 상세 추가하기
	@Override
	public void putOrderDetail(List<OrderDetail> odList) {
		for (OrderDetail orderDetail : odList) {
			odDao.insertOrdersDetail(orderDetail);
		}
	}
	
	// 결제 추가하기
	@Override
	public void putPayment(Payment payment) {
		paymentDao.inserPayment(payment);
	}

	// 사용한 포인트 업데이트하기
	@Override
	public void changePoint(Map<String, Object> map) {
		usersDao.updatePoint(map);
	}

}
