package com.mycompany.postella.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.postella.dto.Image;


@Mapper
public interface ImageDao {
	public int insert(Image image);
	public List<Image> selectByPgNo(int pg_no);
	public int count();
}
