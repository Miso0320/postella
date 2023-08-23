package com.mycompany.postella.service;

import java.util.List;
import java.util.Map;

import com.mycompany.postella.dto.CodeTb;
import com.mycompany.postella.dto.Image;
import com.mycompany.postella.dto.Product;

/**
 * 
 * @author 이송미
 *
 */
public interface ProductGroupService {
	// dao에서 selectTitleByPgNo로 제목가져와서 title에 넣기
	public String getTitle(int pg_no);
	
	// dao에서 selectByPage로 product 리스트를 가져와서 list에 넣기
	public List<Product> getList(Map<String, Object> map); 
	
	// productGroup갯수 count해서 totalProductGroupNum에 넣기
	public int getTotalProductGroupNum(Map<String, Object> map);
	
	// 이미지 불러오기
	public List<Image> getImagesBypgNo(int pg_no);
	
	// 카테고리 메뉴 가져오기
	public List<CodeTb> getCategoryList();
	
	// 브랜드 메뉴 가져오기
	public List<CodeTb> getBrandList();
	
	// 상품상태 메뉴 가져오기
	public List<CodeTb> getStatusList();
	
	// 엽서 메시지 메뉴 가져오기
	public List<CodeTb> getMessageList();
}
