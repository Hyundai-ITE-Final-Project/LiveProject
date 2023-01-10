package com.livecommerce.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.livecommerce.project.mapper.ProductMapper;
import com.livecommerce.project.vo.Criteria;
import com.livecommerce.project.vo.ProductVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor

public class ProductServiceImpl implements ProductService{

    @Autowired
    private ProductMapper mapper;
    
    @Override
    public List<ProductVO> getList(Criteria cri){
    	log.info("list service 들어옴");
    	return mapper.getListWithPaging(cri);
    }
}
