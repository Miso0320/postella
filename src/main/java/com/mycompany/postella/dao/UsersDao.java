package com.mycompany.postella.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.postella.dto.Agreement;
import com.mycompany.postella.dto.Users;

/**
 * 
 * @author 김미소, 박재홍
 *
 */
@Mapper
public interface UsersDao {
	
	// 회원 가입
	public int insertUsers(Users users);
	
	// 유저식별번호로 특정 유저 찾기
	public Users selectByNo(int us_no);
	
	// 이메일 중복 여부 확인
	public Users selectEmail(String us_email);
	
	// 전화번호 중복 여부 확인
	public Users selectTel(String us_tel);
	
	// 약관동의 내역 추가
	public int insertAgree(Agreement agreement);
	
	// 유저 정보 확인
	public Users selectByUser(String us_email);
	
	// 회원 적립금 변경
	public int updatePoint(Map<String, Object> map);
}
