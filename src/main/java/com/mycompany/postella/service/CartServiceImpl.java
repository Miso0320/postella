package com.mycompany.postella.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.postella.dao.CartDao;
import com.mycompany.postella.dto.Cart;



@Service
public class CartServiceImpl implements CartService{
	
	@Autowired
	private CartDao cartDao;
	
	@Override
	public void addToCart(Cart cart) {
		cartDao.insertPrdToCart(cart);
	}

	
}
