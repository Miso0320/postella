package com.mycompany.postella.service;

import java.util.List;
import java.util.Map;

import com.mycompany.postella.dto.Image;
import com.mycompany.postella.dto.Product;
import com.mycompany.postella.dto.ProductGroup;
import com.mycompany.postella.dto.Pager;

public interface ProductGroupService {
	public String getTitle(int pg_no); //제목가져오기
	public List<ProductGroup> getList(Pager pager); //리스트 가져오기 pg_name을 가지고있다 
	public int getTotalProductGroupNum();
	public List<Image> getImagesBypgNo(int pg_no);
}
