package com.mycompany.postella.dto;

import lombok.Data;


// 테스트
@Data
public class CodeTb {
	// 코드 테이블 컬럼
	private String code;	// 코드명(URL에 사용할 내용)
	private String codeval;	// 코드설명(메뉴표출에 사용할 내용)
}
