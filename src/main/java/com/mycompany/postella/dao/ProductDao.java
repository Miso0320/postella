package com.mycompany.postella.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.postella.dto.Product;


@Mapper
public interface ProductDao {
	public Product selectByPrdNo(int prd_no);
}
