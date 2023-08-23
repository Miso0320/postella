package com.mycompany.postella.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.postella.dto.CodeTb;
import com.mycompany.postella.dto.Image;
import com.mycompany.postella.dto.Product;

/**
 * 
 * @author 이송미
 *
 */
@Mapper
public interface ProductGroupDao {
	// 제목 하나 가져오기
	public String selectTitleByPgNo(int pg_no);

	// 전체리스트 페이징하기
	public List<Product> selectByPage(Map<String, Object> map);

	// 총 상품갯수 카운트
	public int count(Map<String, Object> map);

	// 상품그룹번호로 이미지리스트 가져오기
	public List<Image> selectByPgNo(int pg_no);

	// 카테고리 메뉴 가져오기
	public List<CodeTb> selectCategoryList();

	// 브랜드 메뉴 가져오기
	public List<CodeTb> selectBrandList();

	// 상품상태 메뉴 가져오기
	public List<CodeTb> selectStatusList();

	// 엽서 메시지 메뉴 가져오기
	public List<CodeTb> selectMessageList();
}
