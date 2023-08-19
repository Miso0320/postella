package com.mycompany.postella.service;

import java.util.List;

import com.mycompany.postella.dto.Price;

public interface PriceService {
	//상품번호에 해당하는 가격 가져오기
	public Price getPrice(int pg_no); 
}
