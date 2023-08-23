package com.mycompany.postella.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.postella.dto.DeliverAddress;

/**
 * 
 * @author 이송미
 *
 */
@Mapper
public interface DeliverAddressDao {
	
	//배송지 추가하기
	public int insertAddress(DeliverAddress da);
	
	//배송지 목록 가져오기
	public List<DeliverAddress> selectAddressList(int us_no);
	
	//기본 배송지 가져오기
	public DeliverAddress selectBasicAddress(int us_no); 
	
	//배송 요청사항 한글로 가져오기
	public String getKorRequest(String da_req_type);
	
	//기본 배송지 삭제하기
	public int setMainAddressToN(int da_no); 
	
	//배송지 변경하기
	public int updateAddress(DeliverAddress da); 
	
	//배송지 가져오기
	public DeliverAddress selectAddress(int da_no);
	
	//배송지 삭제하기
	public int deleteAddress(int da_no);
}
