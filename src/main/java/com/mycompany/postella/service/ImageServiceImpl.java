package com.mycompany.postella.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.postella.dao.ImageDao;
import com.mycompany.postella.dto.Image;


@Service
public class ImageServiceImpl implements ImageService{
	
	@Autowired
	private ImageDao imageDao;

	@Override
	public void write(Image image) {
		imageDao.insert(image);
	}
	
	@Override
	public List<Image> getImagesBypgNo(int pg_no) {
		List<Image> imgs = imageDao.selectByPgNo(pg_no);
	      return imgs;
	}
	
	@Override
	public Image getImageByPgNo(int pg_no) {
		Image img = imageDao.selectByPgNo2(pg_no);
		return img;
	}
	
	@Override
	public Image getImageByPrdNo(int prd_no) {
		Image image = imageDao.selectByPrdNo(prd_no);
		return image;
	}
}
