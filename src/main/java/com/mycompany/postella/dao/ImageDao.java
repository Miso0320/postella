package com.mycompany.postella.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.postella.dto.Image;


@Mapper
public interface ImageDao {
	
	//이미지 추가하기
	public int insert(Image image);
	
	//같은 상품 그룹 식별 번호를 가진 이미지들 가져오기
	public List<Image> selectAllByPgNo(int pg_no);
	
	//같은 상품 번호를 가진 이미지들 가져오기
	public List<Image> selectAllByPrdNo(int prd_no);
	
	//같은 상품 그룹 식별 번호를 가진 이미지 중 대표 이미지 가져오기
	public Image selectByPgNo2(int pg_no);
	
	//같은 상품 번호를 가진 이미지 중 대표 이미지 가져오기
	public Image selectByPrdNo(int prd_no);
	
	//상품 상세 이미지 가져오기
	public Image selectdetailImg(int pg_no);
}
