package com.mycompany.postella.service;

import java.util.List;

import com.mycompany.postella.dto.Image;

public interface ImageService {
	public void write(Image image);
	public List<Image> getImagesBypgNo(int pg_no);
	public List<Image> getImagesByprdNo(int prd_no);
	public Image getImageByPgNo(int pg_no);
	public Image getImageByPrdNo(int prd_no);
}
