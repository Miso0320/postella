package com.mycompany.postella.service;

import java.util.List;

import com.mycompany.postella.dto.Product;
import com.mycompany.postella.dto.ProductPager;

public interface ProductService {
	public List<Product> getList(ProductPager pager);
	public int getTotalProductNum();
/*	public void write(Product product);*/
	//public Product getProduct(int pg_no);
}
