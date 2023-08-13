package com.mycompany.postella.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.postella.dto.CodeTb;
import com.mycompany.postella.dto.Image;
import com.mycompany.postella.dto.Product;

@Mapper
public interface ProductGroupDao {	
	public String selectTitleByPgNo(int pg_no); //제목  하나 가져오기
	public List<Product> selectByPage(Map<String, Object> map); //전체리스트 페이징하기
	public int count(Map<String, Object> map); //총 상품갯수 카운트
	public List<Image> selectByPgNo(int pg_no);//상품그룹번호로 이미지리스트 가져오기
	public List<CodeTb> selectCategoryList();
	public List<CodeTb> selectBrandList();
	public List<CodeTb> selectStatusList();
	public List<CodeTb> selectMessageList();
}
