package com.mycompany.postella.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.postella.dao.ProductDao;
import com.mycompany.postella.dto.Product;
import com.mycompany.postella.dto.ProductPager;

@Service
public class ProductServiceImpl implements ProductService{
	@Autowired
	private ProductDao productDao;
	
/*	@Override
	public void write(Product product) {
		productDao.insert(product);
		
	}*/

	@Override
	public List<Product> getList(ProductPager pager) {
		List<Product> boardList = productDao.selectByPage(pager);;
		return boardList;
	}

/*	@Override
	public int getTotalProductNum() {
		int totalProductNum = productDao.count();
		return totalProductNum;
	}

	@Override
	public Product getProduct(int pg_no) {
		Product product = productDao.selectByPg_no(pg_no);
		return product;
	}*/
	@Override
	public int getTotalProductNum() {
		int totalProductNum = productDao.count();
		return totalProductNum;
	}

}
