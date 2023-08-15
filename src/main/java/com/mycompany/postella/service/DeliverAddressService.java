package com.mycompany.postella.service;

import java.util.List;

import com.mycompany.postella.dto.DeliverAddress;

public interface DeliverAddressService {
	public List<DeliverAddress> getAddressList(int us_no);
	public void putAddress(DeliverAddress da);
}
