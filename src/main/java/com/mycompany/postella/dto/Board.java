package com.mycompany.postella.dto;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class Board {
	// 공지사항 테이블 컬럼
	private int bo_no; 					// 게시글구분번호
	private String bo_kind; 			// 게시판 종류(자주 묻는 질문, 공지사항)
	private String bo_type; 			// 게시글 구분(공지, 이벤트)
	private String bo_title; 			// 게시물 제목
	private String bo_content; 			// 게시글 내용
	private Date bo_date; 				// 작성날짜

}
