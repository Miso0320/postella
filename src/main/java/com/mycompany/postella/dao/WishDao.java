package com.mycompany.postella.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.postella.dto.Wish;


@Mapper
public interface WishDao {
	public void insert(Wish wish);
	public void delete(int pg_no); 
}
