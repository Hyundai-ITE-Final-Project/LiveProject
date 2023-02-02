package com.livecommerce.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.livecommerce.project.mapper.GraphicMapper;
import com.livecommerce.project.vo.GraphVO;

@Service
public class GraphicServiceImpl implements GraphicService{
	@Autowired
	private GraphicMapper graphicMapper;
	
	//테스트용으로 날짜별 주문합계
	@Override
	public List<GraphVO> countOrder() {
		return graphicMapper.countOrder();
	}

	@Override
	public List<GraphVO> positivenegative(String live_id, String mid) {
		List<GraphVO> list =  graphicMapper.positivenegative(live_id, mid);
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getPredict_result() == 1) {
				list.get(i).setPositive("긍정");
			}
			else {
				list.get(i).setPositive("부정");
			}
			 
		}
		
		return list;
	}

}
