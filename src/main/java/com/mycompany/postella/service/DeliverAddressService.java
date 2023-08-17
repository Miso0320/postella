package com.mycompany.postella.service;

import java.util.List;
import java.util.Map;

import com.mycompany.postella.dto.DeliverAddress;

public interface DeliverAddressService {
	public List<DeliverAddress> getAddressList(int us_no);
	public void putAddress(DeliverAddress da);
	public DeliverAddress getBasicAddress(int us_no);
	public void changeMainAdr(int da_no);
}
