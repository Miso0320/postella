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
	
	@Override
	public void addToCart(Cart cart) {
		cartDao.insertPrdToCart(cart);
	}
	
	@Override
	public Cart getCart(Map<String, Object> map) {
		Cart cart = cartDao.selectCart(map);
		return cart;
	}
	
	@Override
	public void updateCart(Cart cart) {
		int check = cartDao.updateCart(cart);
	}

	@Override
	public List<Cart> getProductCart(int us_no) {
		List<Cart> list = cartDao.selectCartByUsNo(us_no);
		return list;
	}

	@Override
	public List<Image> getImageCart() {
		List<Image> image = cartDao.selectCartImg();
		return image;
	}

	
}
