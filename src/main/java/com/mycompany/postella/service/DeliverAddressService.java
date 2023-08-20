package com.mycompany.postella.service;

import java.util.List;
import java.util.Map;

import com.mycompany.postella.dto.DeliverAddress;

public interface DeliverAddressService {
	
	// 배송지 목록 가져오기
	public List<DeliverAddress> getAddressList(int us_no);
	
	//배송지 추가하기
	public void putAddress(DeliverAddress da);
	
	//기본 배송지 가져오기
	public DeliverAddress getBasicAddress(int us_no);
	
	//기본 배송지 제거하기
	public void cleanMainAdr(int us_no);
	
	//배송지 가져오기
	public DeliverAddress getAddress(int da_no);
	
	//배송지 수정하기
	public void editAddress(DeliverAddress da);
}
