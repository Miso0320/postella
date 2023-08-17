package com.mycompany.postella.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.postella.dto.Payment;


@Mapper
public interface PaymentDao {
	public int inserPayment(Payment pay);
}
