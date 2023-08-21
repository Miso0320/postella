package com.mycompany.postella.service;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.postella.dao.QnaDao;
import com.mycompany.postella.dto.Qna;

@Service
public class QnaServiceImpl implements QnaService{
	
	@Autowired
	private QnaDao qnaDao;
	
	@Autowired
	private ReviewService reviewService;
	
	//상품 문의 가져오기
	@Override
	public List<Qna> getQnasBypgNo(int pg_no) {
		List<Qna> qna = qnaDao.selectByPgNo(pg_no);
		addQnaInfo(qna);
		return qna;
	}
	
	//상품 문의 개수 가져오기
	@Override
	public int getTotalQnasCount(int pg_no) {
		int cnt = qnaDao.selectQnaCnt(pg_no);
		return cnt;
	}
	
	//페이지별 상품 문의 가져오기
	@Override
	public List<Qna> getQnasPaged(Map<String, Object> map) {
		List<Qna> qna = qnaDao.selectQnasByPage(map);
		addQnaInfo(qna);
		return qna;
	}
	
	//상품 문의에 필요한 정보 추가하기
	public void addQnaInfo(List<Qna> qnas) {
		SimpleDateFormat rformat = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		for(int i=0; i < qnas.size(); i++) {
			qnas.get(i).setPrd_name(qnaDao.selectPrdName(qnas.get(i).getPrd_no()));
			qnas.get(i).setSel_name(qnaDao.selectSelName(qnas.get(i).getPg_no()));
			qnas.get(i).setStringQdate(rformat.format(qnas.get(i).getQ_date()));
			if(qnas.get(i).getA_date() != null) {
				qnas.get(i).setStringAdate(rformat.format(qnas.get(i).getA_date()));
			}
		}
	}
}
