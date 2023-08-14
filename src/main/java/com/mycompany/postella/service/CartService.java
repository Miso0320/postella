package com.mycompany.postella.service;

import java.util.List;
import java.util.Map;

import com.mycompany.postella.dto.Cart;
import com.mycompany.postella.dto.Image;

public interface CartService {

	public void addToCart(Cart cart);
	public Cart getCart(Map<String, Object> map);
	public void updateCart(Cart cart);
	public List<Cart> getProductCart(int us_no);
	public List<Image> getImageCart();
	public void deleteToCart(Map<String, Object> map);
}
