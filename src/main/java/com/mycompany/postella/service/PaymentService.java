package com.mycompany.postella.service;

import com.mycompany.postella.dto.Payment;

/**
 * 
 * @author 이송미
 *
 */
public interface PaymentService {
	
	//결제 내역 추가하기
	public void addPayment(Payment pay);
}
