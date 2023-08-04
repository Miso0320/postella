package com.mycompany.postella.service;

import com.mycompany.postella.dto.Product;

public interface productService {
	public String getTitle(int pg_no);
	public Product getInfo(int pg_no);
}
