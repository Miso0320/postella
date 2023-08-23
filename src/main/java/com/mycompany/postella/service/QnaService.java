package com.mycompany.postella.service;

import java.util.List;
import java.util.Map;

import com.mycompany.postella.dto.Qna;

/**
 * 
 * @author 이송미
 *
 */
public interface QnaService {
	
	//상품 문의 가져오기
	public List<Qna> getQnasBypgNo(int pg_no);
	
	//상품 문의 개수 가져오기
	public int getTotalQnasCount(int pg_no);
	
	//페이지별 상품 문의 가져오기
	public List<Qna> getQnasPaged(Map<String, Object> map);
	
	//문의 등록하기
	public void putQna(Qna qna);
}
