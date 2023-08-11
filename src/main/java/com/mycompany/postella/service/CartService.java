package com.mycompany.postella.service;

import java.util.Map;

import com.mycompany.postella.dto.Cart;

public interface CartService {

	public void addToCart(Cart cart);
	public Cart getCart(Map<String, Object> map);
	public void updateCart(Cart cart);
}
