package com.mycompany.postella.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.postella.dto.Image;
import com.mycompany.postella.dto.ProductGroup;
import com.mycompany.postella.dto.ProductGroupPager;

@Mapper
public interface ProductGroupDao {
	public List<ProductGroup> selectByPage(ProductGroupPager pager);
	public int count();
	/*	public int insert(Product product);
	public Product selectBypg_no(int pg_no);*/
	
	public List<Image> selectByPgNo(int pg_no);
}
