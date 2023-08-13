package com.mycompany.postella.service;

import java.util.List;
import java.util.Map;

import com.mycompany.postella.dto.Qna;

public interface QnaService {
	public List<Qna> getQnasBypgNo(int pg_no);
	public int getTotalQnasCount(int pg_no);
	public List<Qna> getQnasPaged(Map<String, Object> map);
}
