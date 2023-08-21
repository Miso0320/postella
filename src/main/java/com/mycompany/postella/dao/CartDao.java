package com.mycompany.postella.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.postella.dto.Cart;
import com.mycompany.postella.dto.Image;


@Mapper
public interface CartDao {	
	public int insertPrdToCart(Cart cart);							// 상품 장바구니에 담기
	public Cart selectCart(Map<String, Object> map);				// 장바구니에 담긴 상품 하나 검색
	public int updateCart(Cart cart);								// 장바구니 변경
	public List<Cart> selectCartByUsNo(int us_no);					// 장바구니 상품리스트
	public List<Image> selectCartImg();								// 장바구니 상품이미지
	public int deleteCart(Map<String, Object> map);					// 장바구니 삭제
	public int cartListCnt(int us_no);								// 장바구니 전체개수
	public List<Cart> selectCartPaging(Map<String, Object> map);	// 장바구니 상품리스트 페이징
	public int updateOrInsertCart(Cart cart);						// 장바구니 상품 추가 혹은 변경
	public List<Cart> selectPgName(int us_no);						// 장바구니 상품 대분류 이름
	public List<Integer> selectQtyAndPrdNo(int us_no);
}
