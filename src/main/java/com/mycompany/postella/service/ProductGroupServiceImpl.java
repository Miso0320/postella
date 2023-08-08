package com.mycompany.postella.service;

import java.util.List;

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

	@Override
	public List<ProductGroup> getList(Pager pager) {
		List<ProductGroup> productGroupList = productGroupDao.selectByPage(pager);;
		return productGroupList;
	}

	@Override
	public int getTotalProductGroupNum(String categoryList) {
		int totalProductGroupNum = productGroupDao.count(categoryList);
		return totalProductGroupNum;
	}
	
	@Override
	public String getTitle(int pg_no) {
		String title = productGroupDao.selectTitleByPgNo(pg_no);
	    return title;
	}

	@Override
	public List<Image> getImagesBypgNo(int pg_no) {
		List<Image> imgs = imageDao.selectAllByPgNo(pg_no);
	    return imgs;
	}

	@Override
	public List<ProductGroup> getPhotoList(Pager pager) {
		List<ProductGroup> photoList = productGroupDao.selectPhoto(pager);;
		return photoList;
	}
	
	@Override
	public Product getInfo(int pg_no) {
		Product prd = productDao.selectByPrdNo(pg_no);
		return prd;
	}

}
