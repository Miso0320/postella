package com.mycompany.postella.service;

import com.mycompany.postella.dto.Payment;

public interface PaymentService {
	
	//결제 내역 추가하기
	public void addPayment(Payment pay);
}
