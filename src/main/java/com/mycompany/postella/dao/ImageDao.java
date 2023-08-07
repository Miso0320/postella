package com.mycompany.postella.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.postella.dto.Image;


@Mapper
public interface ImageDao {
	public int insert(Image image);
	public List<Image> selectAllByPgNo(int pg_no);
	public List<Image> selectAllByPrdNo(int prd_no);
	public Image selectByPgNo2(int pg_no);
	public Image selectByPrdNo(int prd_no);
}
