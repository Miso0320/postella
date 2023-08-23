package com.mycompany.postella.service;

import java.util.List;

import com.mycompany.postella.dto.Product;

/**
 * 
 * @author 이송미
 *
 */
public interface productService {
	//상품 정보 가져오기
	public Product getInfo(int prd_no);
	
	//상품 옵션 목록 가져오기
	public List<Product> getOptions(int pg_no);
	
	//별점 평균 가져오기
	public int getStarAvg(int pg_no);
}
