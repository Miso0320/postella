package com.mycompany.postella.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.postella.dto.Cart;


@Mapper
public interface CartDao {	
	public int insertPrdToCart(Cart cart); //상품 장바구니에 담기
	public Cart selectCart(Map<String, Object> map); //장바구니에 담김 상품 하나 검색
	public int updateCart(Cart cart); //장바구니 변경
}
