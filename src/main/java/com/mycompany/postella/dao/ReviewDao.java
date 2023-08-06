package com.mycompany.postella.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.postella.dto.Review;

@Mapper
public interface ReviewDao {
	public List<Review> selectAllByPgNo(int pg_no);
	public String selectPrdName(int prd_no);
	public List<Review> selectByKeyword(String keyword);
	public List<Review> orderByRate(int pg_no, int rate);
	public List<Review> groupByRate(int pg_no, int rate);
}
