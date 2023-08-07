package com.mycompany.postella.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.postella.dto.Product;


@Mapper
public interface ProductDao {
	public Product selectByPrdNo(int prd_no);
	public List<Product> selectAllByPgNo(int pg_no);
	public int selectStarAvg(int pg_no);
}
