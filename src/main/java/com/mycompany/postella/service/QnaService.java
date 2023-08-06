package com.mycompany.postella.service;

import java.util.List;

import com.mycompany.postella.dto.Qna;

public interface QnaService {
	public List<Qna> getQnasBypgNo(int pg_no);
}
