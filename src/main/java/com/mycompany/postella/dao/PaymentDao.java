package com.mycompany.postella.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.postella.dto.Payment;

/**
 * 
 * @author 이송미
 *
 */
@Mapper
public interface PaymentDao {
	
	//결제 내역 추가하기
	public int inserPayment(Payment pay);
}
