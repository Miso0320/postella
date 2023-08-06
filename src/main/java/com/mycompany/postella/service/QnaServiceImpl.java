package com.mycompany.postella.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.postella.dao.QnaDao;
import com.mycompany.postella.dto.Qna;

@Service
public class QnaServiceImpl implements QnaService{
	
	@Autowired
	private QnaDao qnaDao;
	
	@Override
	public List<Qna> getQnasBypgNo(int pg_no) {
		List<Qna> qna = qnaDao.selectByPgNo(pg_no);
		return qna;
	}
}
