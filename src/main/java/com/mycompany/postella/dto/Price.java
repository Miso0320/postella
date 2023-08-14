package com.mycompany.postella.dto;

import lombok.Data;

@Data
public class Price {
	private int prd_org_price; 	//정상가
	private int prd_price; 		//판매가
	private int pg_no;			//상품대분류
}
