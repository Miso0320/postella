package com.mycompany.postella.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.postella.dao.ProductDao;
import com.mycompany.postella.dto.Product;

@Service
public class productServiceImpl implements productService {
	
	@Autowired
	private ProductDao productDao;
	
	@Override
	public Product getInfo(int prd_no) {
		Product prd = productDao.selectByPrdNo(prd_no);
		return prd;
	}
}
