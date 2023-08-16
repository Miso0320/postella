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
	
	@Override
	public List<DeliverAddress> getAddressList(int us_no) {
		List<DeliverAddress> list = daDao.selectAddressList(us_no);
		return list;
	}
	
	@Override
	public void putAddress(DeliverAddress da) {
		daDao.insertAddress(da);
	}
	
	@Override
	public DeliverAddress getBasicAddress(int us_no) {
		DeliverAddress da = daDao.selectBasicAddress(us_no);
		return da;
	}
	
}
