package com.mycompany.postella.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.postella.dao.WishDao;
import com.mycompany.postella.dto.Wish;

@Service
public class WishServiceImpl implements WishService{
	
	@Autowired
	private WishDao wishDao;
	
	//찜 목록에 추가하기
	@Override
	public void addWish(Wish wish) {
		wishDao.insertWish(wish);
	}
	
	//찜 목록에서 삭제하기
	@Override
	public void removeWish(Wish wish) {
		wishDao.deleteWish(wish);
	}
}
