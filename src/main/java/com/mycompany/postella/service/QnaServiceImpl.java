package com.mycompany.postella.service;

import java.text.SimpleDateFormat;
import java.util.List;

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
	
	@Override
	public List<Qna> getQnasBypgNo(int pg_no) {
		List<Qna> qna = qnaDao.selectByPgNo(pg_no);
		addQnaInfo(qna);
		return qna;
	}
	
	public void addQnaInfo(List<Qna> qnas) {
		SimpleDateFormat rformat = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		for(int i=0; i < qnas.size(); i++) {
			qnas.get(i).setPrd_name(reviewService.getPrdName(qnas.get(i).getPrd_no()));
			qnas.get(i).setSel_name(qnaDao.selectSelName(qnas.get(i).getPg_no()));
			qnas.get(i).setStringQdate(rformat.format(qnas.get(i).getQ_date()));
			qnas.get(i).setStringAdate(rformat.format(qnas.get(i).getA_date()));
		}
	}
}
