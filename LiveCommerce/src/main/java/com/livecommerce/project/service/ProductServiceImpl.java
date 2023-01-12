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
    //전체상품
    @Override
    public List<ProductVO> getList(Criteria cri){
    	log.info("list service 들어옴");
    	return mapper.getListWithPaging(cri);
    }
    //전체상품갯수
    @Override
    public int getTotal(Criteria cri) {
    	log.info("service 전체상품갯수");
    	return mapper.getTotalCount(cri);
    }
    
    // 상품 상세 조회
    @Override
    public ProductVO productGetDetail(int pid) {
        return mapper.productGetDetail(pid);
    }
}
