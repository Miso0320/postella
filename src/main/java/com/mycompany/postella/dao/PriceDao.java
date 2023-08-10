package com.mycompany.postella.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.postella.dto.Image;
import com.mycompany.postella.dto.Product;
import com.mycompany.postella.dto.ProductGroup;
import com.mycompany.postella.dto.Pager;
import com.mycompany.postella.dto.Price;

@Mapper
public interface PriceDao {	
	public Price selectPriceByPgNo(int pg_no);//가격가져오기
}
