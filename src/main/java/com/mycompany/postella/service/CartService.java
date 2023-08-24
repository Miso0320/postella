package com.mycompany.postella.service;

import java.util.List;
import java.util.Map;

import com.mycompany.postella.dto.Cart;
import com.mycompany.postella.dto.Image;

/**
 * 
 * @author 박재홍
 *
 */
public interface CartService {
	
	// 장바구니에 상품 담기
	public void addToCart(Cart cart);
	
	// 장바구니에 담긴 상품 하나 검색
	public Cart getCart(Map<String, Object> map);
	
	// 장바구니 변경
	public void updateCart(Cart cart);
	
	// 장바구니 상품리스트
	public List<Cart> getProductCart(int us_no);
	
	// 장바구니 상품이미지
	public List<Image> getImageCart();
	
	// 장바구니 삭제
	public void deleteToCart(Map<String, Object> map);
	
	// 장바구니 전체개수
	public int getTotalCartCnt(int us_no);
	
	// 장바구니 상품리스트 페이징
	public List<Cart> getCartPaging(Map<String, Object> map);
	
	// 장바구니 담기하는 경우 변경 혹은 추가
	public void addCart(Cart cart);
	
	// 장바구니 상품이름 리스트
	public List<Cart> getPgName(int us_no);
	
	// 장바구니 상품고유번호, 수량 리스트
	public List<Integer> getPrdNoAndQty(int us_no);
	
}
