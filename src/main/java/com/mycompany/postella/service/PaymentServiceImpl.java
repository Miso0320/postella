package com.mycompany.postella.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.postella.dao.PaymentDao;
import com.mycompany.postella.dto.Payment;

@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	private PaymentDao payDao;
	
	//결제 내역 추가하기
	@Override
	public void addPayment(Payment pay) {
		payDao.inserPayment(pay);
	}
}
