package com.mycompany.postella.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.postella.dto.Wish;


@Mapper
public interface WishDao {
	
	//찜 목록에 추가하기
	public int insertWish(Wish wish);
	
	//찜 목록에서 삭제하기
	public int deleteWish(Wish wish); 
	
	//찜 목록에서 삭제하기
	public int selectWish(Map<String, Object> map); 
}
