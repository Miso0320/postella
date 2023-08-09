package com.mycompany.postella.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.postella.dto.Review;

@Mapper
public interface ReviewDao {
	public List<Review> selectAllByPgNo(int pg_no);
	public String selectPrdName(int prd_no);
	public List<Review> selectByKeyword(Map<String, Object> map);
	public List<Review> orderByRate(int pg_no);
	public List<Review> orderByDate(int pg_no);
	public List<Review> groupByRate(int pg_no, int rate);
	public int selectReviewCnt(int pg_no);
}
