package com.mycompany.postella.dto;

import lombok.Data;

@Data
public class ProductGroup {
	private int pg_no;//product group의 번호
	private String pg_name;//product group의 이름(상품페이지의 상품제목)
	private String img_type;
	private String encodedFile;
	private int pg_price;//product group의 상품가격

}
