package com.mycompany.postella.dto;

import lombok.Data;

@Data
public class Wish {
	private int pg_no; //상품(옵션) 식별
	private int us_no; //유저 식별
	private boolean active; //추가인지 삭제인지 구분
}
