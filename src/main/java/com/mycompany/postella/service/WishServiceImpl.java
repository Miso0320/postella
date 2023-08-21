package com.mycompany.postella.service;

import java.util.HashMap;
import java.util.Map;

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
	
	
	//찜 목록에 들어 있는지 검사
	@Override
	public int checkWish(int pg_no, int us_no) {
		Map<String, Object> map = new HashMap<>();
		map.put("pg_no", pg_no);
		map.put("us_no", us_no);
		int result = wishDao.selectWish(map);
		return result;
	}
}
