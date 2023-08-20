package com.mycompany.postella.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.postella.dao.DeliverAddressDao;
import com.mycompany.postella.dto.DeliverAddress;

@Service
public class DeliverAddressServiceImpl implements DeliverAddressService {
	
	@Autowired
	private DeliverAddressDao daDao;
	
	// 배송지 목록 가져오기
	@Override
	public List<DeliverAddress> getAddressList(int us_no) {
		List<DeliverAddress> list = daDao.selectAddressList(us_no);
		return list;
	}
	
	//배송지 추가하기
	@Override
	public void putAddress(DeliverAddress da) {
		daDao.insertAddress(da);
	}
	
	//기본 배송지 가져오기
	@Override
	public DeliverAddress getBasicAddress(int us_no) {
		DeliverAddress da = daDao.selectBasicAddress(us_no);
		return da;
	}
	
	//기본 배송지 제거하기
	@Override
	public void cleanMainAdr(int us_no) {
		daDao.setMainAddressToN(us_no);
	}
	
	//배송지 가져오기
	@Override
	public DeliverAddress getAddress(int da_no) {
		DeliverAddress da = daDao.selectAddress(da_no);
		return da;
	}
	
	//배송지 수정하기
	@Override
	public void editAddress(DeliverAddress da) {
		daDao.updateAddress(da);
	}
	
	//배송지 삭제하기
	@Override
	public void removeAddress(int da_no) {
		daDao.deleteAddress(da_no);
	}
	
}
