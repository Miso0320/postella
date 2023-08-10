package com.mycompany.postella.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.postella.dto.Wish;


@Mapper
public interface WishDao {
	public int insertWish(Wish wish);
	public int deleteWish(Wish wish); 
}
