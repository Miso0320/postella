package com.mycompany.postella.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.postella.dao.Order_detailDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class Order_detailServiceImpl implements Order_detailService{
	
	@Autowired
	private Order_detailDao oder_detailDao;
	
	@Override
	public int getStarAvg(int pg_no) {
		int starAvg = oder_detailDao.selectStarAvg(pg_no);
	    return starAvg;
	}
	
	@Override
	public int countReview(int pg_no) {
		int cnt = oder_detailDao.selectReviewCnt(pg_no);
		return cnt;
	}
}
