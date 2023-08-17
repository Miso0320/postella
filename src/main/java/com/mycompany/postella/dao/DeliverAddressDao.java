package com.mycompany.postella.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.postella.dto.DeliverAddress;


@Mapper
public interface DeliverAddressDao {
	public int insertAddress(DeliverAddress da);
	public List<DeliverAddress> selectAddressList(int us_no); 
	public DeliverAddress selectBasicAddress(int us_no); 
	public String getKorRequest(String da_req_type);
	public int setMainAddressToN(int da_no); 
	public int updateMainAddress(int da_no); 
}
