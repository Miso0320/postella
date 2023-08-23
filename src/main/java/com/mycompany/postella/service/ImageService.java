package com.mycompany.postella.service;

import java.util.List;

import com.mycompany.postella.dto.Image;

/**
 * 
 * @author 이송미
 *
 */
public interface ImageService {
	
	//이미지 추가하기
	public void write(Image image);
	
	//같은 상품 그룹인 이미지들 가져오기
	public List<Image> getImagesBypgNo(int pg_no);
	
	//상품 옵션 이미지들 가져오기
	public List<Image> getImagesByprdNo(int prd_no);
	
	//상품 그룹의 대표 이미지 가져오기
	public Image getImageByPgNo(int pg_no);
	
	//상품 상세이미지 가져오기
	public Image getDetailImageByPgNo(int pg_no);
	
	//상품 옵션 대표 이미지 가져오기
	public Image getImageByPrdNo(int prd_no);
}
