package com.mycompany.postella.service;

import java.util.List;

import com.mycompany.postella.dto.Product;

public interface productService {
	public Product getInfo(int prd_no);
	public List<Product> getOptions(int pg_no);
}
