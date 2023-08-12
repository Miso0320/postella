package com.mycompany.postella.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.postella.dao.PriceDao;
import com.mycompany.postella.dto.Price;

@Service
public class PriceServiceImpl implements PriceService {
	
	@Autowired
	private PriceDao priceDao;

	@Override
	public Price getPrice(int pg_no) {
		Price price = priceDao.selectPriceByPgNo(pg_no);
		return price;
	}
}
