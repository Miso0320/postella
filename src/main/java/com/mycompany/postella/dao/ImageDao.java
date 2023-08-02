package com.mycompany.postella.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.postella.dto.Image;


@Mapper
public interface ImageDao {
	public int insert(Image image);
}
