package com.mycompany.postella.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.postella.dao.CartDao;
import com.mycompany.postella.dto.Cart;
import com.mycompany.postella.dto.Image;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
public class CartServiceImpl implements CartService{
	
	@Autowired
	private CartDao cartDao;
	
	// 장바구니에 상품 담기
	@Override
	public void addToCart(Cart cart) {
		cartDao.insertPrdToCart(cart);
	}
	
	// 장바구니에 담긴 상품 하나 검색
	@Override
	public Cart getCart(Map<String, Object> map) {
		Cart cart = cartDao.selectCart(map);
		return cart;
	}
	
	// 장바구니 변경
	@Override
	public void updateCart(Cart cart) {
		int check = cartDao.updateCart(cart);
	}
	
	// 장바구니 상품리스트
	@Override
	public List<Cart> getProductCart(int us_no) {
		List<Cart> list = cartDao.selectCartByUsNo(us_no);
		return list;
	}

	// 장바구니 상품이미지
	@Override
	public List<Image> getImageCart() {
		List<Image> image = cartDao.selectCartImg();
		return image;
	}
	
	// 장바구니 삭제
	@Override
	public void deleteToCart(Map<String, Object> map) {
		cartDao.deleteCart(map);
	}

	// 장바구니 전체개수
	@Override
	public int getTotalCartCnt(int us_no) {
		int getCnt = cartDao.cartListCnt(us_no);
		return getCnt;
	}
	
	// 장바구니 상품리스트 페이징
	@Override
	public List<Cart> getCartPaging(Map<String, Object> map) {
		List<Cart> list = cartDao.selectCartPaging(map);
		return list;
	}
	
	// 장바구니 담기하는 경우 변경 혹은 추가
	@Override
	public void addCart(Cart cart) {
		int check = cartDao.updateOrInsertCart(cart);
	}
	
	//장바구니에 담긴 상품 이름 대분류
	@Override
	public List<Cart> getPgName(int us_no) {
		List<Cart> pgNameList = cartDao.selectPgName(us_no);
		return pgNameList;
	}
}
