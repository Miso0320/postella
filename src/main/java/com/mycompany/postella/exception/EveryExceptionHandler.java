package com.mycompany.postella.exception;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author 김미소
 *
 */
@Slf4j
@Component
@ControllerAdvice
public class EveryExceptionHandler {
	
	// 500 에러 처리
	@ExceptionHandler
	@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
	public String handleOhterException(Exception e) {
		return "exception/500";
	}
	
	// 404 에러 처리
	@ExceptionHandler(NoHandlerFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String handle404() {
		return "exception/404";
	}
}
