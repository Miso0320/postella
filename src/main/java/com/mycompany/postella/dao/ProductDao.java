package com.mycompany.postella.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.postella.dto.Product;
import com.mycompany.postella.dto.ProductPager;

@Mapper
public interface ProductDao {
	public List<Product> selectByPage(ProductPager pager);
	public int count();
/*	public int insert(Product product);
	public Product selectBypg_no(int pg_no);*/
	
}
