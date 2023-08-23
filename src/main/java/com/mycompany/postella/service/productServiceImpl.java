package com.mycompany.postella.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.postella.dao.ProductDao;
import com.mycompany.postella.dto.Product;

/**
 * 
 * @author 이송미
 *
 */
@Service
public class productServiceImpl implements productService {
	
	@Autowired
	private ProductDao productDao;
	
	//상품 정보 가져오기
	@Override
	public Product getInfo(int prd_no) {
		Product prd = productDao.selectByPrdNo(prd_no);
		return prd;
	}
	
	//상품 옵션 목록 가져오기
	@Override
	public List<Product> getOptions(int pg_no) {
		List<Product> options = productDao.selectAllByPgNo(pg_no);
		return options;
	}
	
	//별점 평균 가져오기
	@Override
	public int getStarAvg(int pg_no) {
		int starAvg = productDao.selectStarAvg(pg_no);
	    return starAvg;
	}
}
