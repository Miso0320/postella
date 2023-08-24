package com.mycompany.postella.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.postella.dto.CodeTb;
import com.mycompany.postella.dto.Image;
import com.mycompany.postella.dto.Product;

/**
 * 
 * @author 김미소
 *
 */
@Mapper
public interface AdminProductDao {
	
	// 전체리스트 페이징하기
	public List<Product> selectByPage(Map<String, Object> map);
	
	// 총 상품갯수 카운트
	public int count(Map<String, Object> map);
}
