package com.mycompany.postella.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.postella.dao.ImageDao;
import com.mycompany.postella.dao.ProductDao;
import com.mycompany.postella.dao.ProductGroupDao;
import com.mycompany.postella.dto.CodeTb;
import com.mycompany.postella.dto.Image;
import com.mycompany.postella.dto.Product;

/**
 * 
 * @author 이송미
 *
 */
@Service
public class ProductGroupServiceImpl implements ProductGroupService{
	@Autowired
	private ProductGroupDao productGroupDao;
	
	// dao에서 selectTitleByPgNo로 제목가져와서 title에 넣기
	@Override 
	public String getTitle(int pg_no) {
		String title = productGroupDao.selectTitleByPgNo(pg_no);
		return title;
	}
	
	// dao에서 selectByPage로 product 리스트를 가져와서 list에 넣기
	@Override 
	public List<Product> getList(Map<String, Object> map) {
		List<Product> list = productGroupDao.selectByPage(map);
		return list;
	}
	
	// productGroup갯수 count해서 totalProductGroupNum에 넣기
	@Override 
	public int getTotalProductGroupNum(Map<String, Object> map) {
		int totalProductGroupNum = productGroupDao.count(map);
		return totalProductGroupNum;
	}
	
	// 이미지 불러오기
	@Override
	public List<Image> getImagesBypgNo(int pg_no) {
		List<Image> img = productGroupDao.selectByPgNo(pg_no);
		return img;
	}
	
	// 카테고리 메뉴 가져오기
	@Override
	public List<CodeTb> getCategoryList() {
		List<CodeTb> categoryList = productGroupDao.selectCategoryList();
		return categoryList;
	}
	
	// 브랜드 메뉴 가져오기
	@Override
	public List<CodeTb> getBrandList() {
		List<CodeTb> brandList = productGroupDao.selectBrandList();
		return brandList;
	}

	// 상품상태 메뉴 가져오기
	@Override
	public List<CodeTb> getStatusList() {
		List<CodeTb> statusList = productGroupDao.selectStatusList();
		return statusList;
	}
	
	// 엽서 메시지 메뉴 가져오기
	@Override
	public List<CodeTb> getMessageList() {
		List<CodeTb> messageList = productGroupDao.selectMessageList();
		return messageList;
	}
}
