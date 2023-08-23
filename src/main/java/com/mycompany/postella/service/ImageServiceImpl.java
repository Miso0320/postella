package com.mycompany.postella.service;

import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.postella.dao.ImageDao;
import com.mycompany.postella.dto.Image;

/**
 * 
 * @author 이송미
 *
 */
@Service
public class ImageServiceImpl implements ImageService{
	
	@Autowired
	private ImageDao imageDao;
	
	//이미지 추가하기
	@Override
	public void write(Image image) {
		imageDao.insert(image);
	}
	
	//같은 상품 그룹인 이미지들 가져오기
	@Override
	public List<Image> getImagesBypgNo(int pg_no) {
		List<Image> imgs = imageDao.selectAllByPgNo(pg_no);
		encodeImgList(imgs);
	    return imgs;
	}
	
	//상품 옵션 이미지들 가져오기
	@Override
	public List<Image> getImagesByprdNo(int prd_no) {
		List<Image> imgs = imageDao.selectAllByPrdNo(prd_no);
		encodeImgList(imgs);
	    return imgs;
	}
	
	//상품 그룹의 대표 이미지 가져오기
	@Override
	public Image getImageByPgNo(int pg_no) {
		Image img = imageDao.selectByPgNo2(pg_no);
		encodeImg(img);
		return img;
	}
	
	//상품 상세이미지 가져오기
	@Override
	public Image getImageByPrdNo(int prd_no) {
		Image image = imageDao.selectByPrdNo(prd_no);
		encodeImg(image);
		return image;
	}
	
	//상품 옵션 대표 이미지 가져오기
	@Override
	public Image getDetailImageByPgNo(int pg_no) {
		Image img = imageDao.selectdetailImg(pg_no);
		if(img != null) {
			encodeImg(img);
			return img;
		} else {
			return null;
		}
	}
	
	//이미지 리스트 인코딩
	public List<Image> encodeImgList(List<Image> imgList) {

		for(int i=0; i < imgList.size(); i++) {
			if(imgList.get(i).getImg_file() != null) {
				imgList.get(i).setEncodedFile(Base64.getEncoder().encodeToString(imgList.get(i).getImg_file()));
				imgList.get(i).setNullOrnot(true);
			} else {
				imgList.get(i).setNullOrnot(false);
			}
		}
		
		return imgList;
	}
	
	//이미지 인코딩
	public Image encodeImg(Image img) {

		if(img.getImg_file() != null) {
			img.setEncodedFile(Base64.getEncoder().encodeToString(img.getImg_file()));
			img.setNullOrnot(true);
		} else {
			img.setNullOrnot(false);
		}
		
		return img;
	}
}
