package com.mycompany.postella.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.postella.dao.ImageDao;
import com.mycompany.postella.dao.ProductDao;
import com.mycompany.postella.dao.ProductGroupDao;
import com.mycompany.postella.dto.Image;
import com.mycompany.postella.dto.Product;
import com.mycompany.postella.dto.ProductGroup;
import com.mycompany.postella.dto.Pager;

@Service
public class ProductGroupServiceImpl implements ProductGroupService{
	@Autowired
	private ProductGroupDao productGroupDao;
	
	@Autowired
	private ImageDao imageDao;
	
	@Autowired
	private ProductDao productDao;
	
	@Override //dao에서 selectTitleByPgNo로 제목가져와서 title에 넣기
	public String getTitle(int pg_no) {
		String title = productGroupDao.selectTitleByPgNo(pg_no);
		return title;
	}

	@Override //dao에서 selectByPage로 productGroup 리스트를 가져와서 list에 넣기
	public List<ProductGroup> getList(Pager pager) {
		List<ProductGroup> list = productGroupDao.selectByPage(pager);
		return list;
	}

	@Override //productGroup갯수 count해서 totalProductGroupNum에 넣기
	public int getTotalProductGroupNum() {
		int totalProductGroupNum = productGroupDao.count();
		return totalProductGroupNum;
	}
}
