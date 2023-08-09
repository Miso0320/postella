package com.mycompany.postella.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.postella.dto.Image;
import com.mycompany.postella.dto.Product;
import com.mycompany.postella.dto.ProductGroup;
import com.mycompany.postella.dto.Pager;

@Mapper
public interface ProductGroupDao {	
	public String selectTitleByPgNo(int pg_no); //제목  하나 가져오기
	public List<ProductGroup> selectByPage(Pager pager); //전체리스트 페이징하기
	public int count(); //총 상품갯수 카운트
	public List<Image> selectByPgNo(int pg_no);

}
