package com.mycompany.postella.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.postella.dao.Order_detailDao;

@Service
public class Order_detailServiceImpl implements Order_detailService{
	
	@Autowired
	private Order_detailDao oder_detailDao;
	
	@Override
	public int getStarAvg(int pg_no) {
		int starAvg = oder_detailDao.selectStarAvg(pg_no);
	    return starAvg;
	}
}
