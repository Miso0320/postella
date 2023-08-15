package com.mycompany.postella.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.postella.dto.DeliverAddress;


@Mapper
public interface DeliverAddressDao {
	public int insertAddress(DeliverAddress da);
	public List<DeliverAddress> selectAddressList(int us_no); 
}
