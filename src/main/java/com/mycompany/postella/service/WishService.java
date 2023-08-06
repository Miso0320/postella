package com.mycompany.postella.service;

import com.mycompany.postella.dto.Wish;

public interface WishService {
	public void add(Wish wish);
	public void remove(int pg_no);
}
