package com.mycompany.postella.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.postella.dao.PriceDao;
import com.mycompany.postella.dto.Price;

/**
 * 
 * @author 박재홍
 *
 */
@Service
public class PriceServiceImpl implements PriceService {
	
	@Autowired
	private PriceDao priceDao;
	
	// selectPriceByPgNo로 상품 번호(pg_no)받아 사용하여 상품가격 return
	@Override
	public Price getPrice(int pg_no) {
		Price price = priceDao.selectPriceByPgNo(pg_no);
		return price;
	}
}
