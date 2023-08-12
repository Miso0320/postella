package com.mycompany.postella.service;

import java.util.List;
import java.util.Map;

import com.mycompany.postella.dto.Image;
import com.mycompany.postella.dto.Product;

public interface ProductGroupService {
	public String getTitle(int pg_no);
	public List<Product> getList(Map<String, Object> map); 
	public int getTotalProductGroupNum();
	public List<Image> getImagesBypgNo(int pg_no);
}
