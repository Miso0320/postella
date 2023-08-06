package com.mycompany.postella.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.postella.dao.WishDao;
import com.mycompany.postella.dto.Wish;

@Service
public class WishServiceImpl implements WishService{
	
	@Autowired
	private WishDao wishDao;
	
	@Override
	public void add(Wish wish) {
		wishDao.insert(wish);
	}
	
	@Override
	public void remove(int pg_no) {
		wishDao.delete(pg_no);
	}
}
