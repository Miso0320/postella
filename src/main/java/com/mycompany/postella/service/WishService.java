package com.mycompany.postella.service;

import com.mycompany.postella.dto.Wish;

public interface WishService {
	
	//찜 목록에 추가하기
	public void addWish(Wish wish);
	
	//찜 목록에서 삭제하기
	public void removeWish(Wish wish);
}
