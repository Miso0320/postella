package com.mycompany.postella.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.postella.dao.ImageDao;
import com.mycompany.postella.dao.ProductGroupDao;
import com.mycompany.postella.dto.Image;
import com.mycompany.postella.dto.ProductGroup;
import com.mycompany.postella.dto.ProductGroupPager;

@Service
public class ProductGroupServiceImpl implements ProductGroupService{
	@Autowired
	private ProductGroupDao productGroupDao;
	
	@Autowired
	private ImageDao imageDao;
	
/*	@Override
	public void write(Product product) {
		productDao.insert(product);
		
	}*/

	@Override
	public List<ProductGroup> getList(ProductGroupPager pager) {
		List<ProductGroup> productGroupList = productGroupDao.selectByPage(pager);;
		return productGroupList;
	}

/*	@Override
	public int getTotalProductNum() {
		int totalProductNum = productDao.count();
		return totalProductNum;
	}

	@Override
	public Product getProduct(int pg_no) {
		Product product = productDao.selectByPg_no(pg_no);
		return product;
	}*/
	@Override
	public int getTotalProductGroupNum() {
		int totalProductGroupNum = productGroupDao.count();
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
	public List<ProductGroup> getPhotoList(ProductGroupPager pager) {
		List<ProductGroup> photoList = productGroupDao.selectPhoto(pager);;
		return photoList;
	}


}
