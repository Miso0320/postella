package com.mycompany.postella.service;

import java.util.List;

import com.mycompany.postella.dto.Image;
import com.mycompany.postella.dto.Product;
import com.mycompany.postella.dto.ProductGroup;
import com.mycompany.postella.dto.ProductGroupPager;

public interface ProductGroupService {
	public List<ProductGroup> getList(ProductGroupPager pager);
	public int getTotalProductGroupNum(String categoryList);
	public List<Image> getImagesBypgNo(int pg_no);
/*	public void write(Product product);*/
	//public Product getProduct(int pg_no);
	
	public String getTitle(int pg_no);
	public List<ProductGroup> getPhotoList(ProductGroupPager pager);
	public Product getInfo(int pg_no);
}
