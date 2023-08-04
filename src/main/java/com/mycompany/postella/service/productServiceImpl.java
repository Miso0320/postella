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
	public String getTitle(int pg_no) {
		String title = productDao.selectByPgNo(pg_no);
	    return title;
	}
	
	@Override
	public Product getInfo(int pg_no) {
		// TODO Auto-generated method stub
		return null;
	}
}
