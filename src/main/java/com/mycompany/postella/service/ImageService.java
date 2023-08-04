package com.mycompany.postella.service;

import java.util.List;

import com.mycompany.postella.dto.Image;

public interface ImageService {
	public void write(Image image);
	public List<Image> getImagesBypgNo(int pg_no);
}