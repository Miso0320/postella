package com.mycompany.postella.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.postella.dto.Cart;


@Mapper
public interface CartDao {	
	public int insertPrdToCart(Cart cart); //상품 장바구니에 담기
}
