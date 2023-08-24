package com.mycompany.postella.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Image {
	/*private int img_no;*/ 			// 이미지 파일 식별 번호 NOT NULL
	private int us_no; 					// 회원 고유 번호
	private int prd_no; 				// 상품 고유 번호
	private int can_no; 				// 교환, 반품 취소 번호
	private int rev_no; 				// 리뷰 식별 번호
	
	private byte[] img_file; 			// 이미지 파일 NOT NULL
	private String img_use; 			// 이미지 사용 용도
	private String img_oname; 			// 이미지 원본 파일명  NOT NULL
	private String img_type; 			// 이미지 MIME 타입  NOT NULL
	private MultipartFile img_attach;	// 이미지 MultipartFile
	private int pg_no; 					// 상품 대분류
	private String encodedFile; 		// 인코딩한 파일 저장
	private boolean nullOrnot;			// null 여부 확인
}
