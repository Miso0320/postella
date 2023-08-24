package com.mycompany.postella.service;

import com.mycompany.postella.dto.Price;

/**
 * 
 * @author 박재홍
 *
 */
public interface PriceService {
	// 상품번호에 해당하는 가격 가져오기
	public Price getPrice(int pg_no); 
}
