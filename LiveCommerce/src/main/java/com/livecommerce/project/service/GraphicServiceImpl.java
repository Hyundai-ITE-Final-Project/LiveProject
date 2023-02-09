package com.livecommerce.project.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.livecommerce.project.mapper.GraphicMapper;
import com.livecommerce.project.vo.GraphVO;
/**
 * @author 신기원
 * @since 2023.02.02
 * @version 1.0
 * 
 * <pre>
 * 수정일                    수정자                   수정내용
 * ----------  --------    ---------------------------
 * 2023.02.02    신기원              긍정/부정 Text

 * </pre>
 */
@Service
public class GraphicServiceImpl implements GraphicService{
	@Autowired
	private GraphicMapper graphicMapper;
	
	//테스트용으로 날짜별 주문합계
	@Override
	public List<GraphVO> countOrder() {
		return graphicMapper.countOrder();
	}

	//예측 결과가 0 : 부정, 1 : 긍정으로 
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

	//긍정 결과 5개
	@Override
	public List<GraphVO> selectPositive(String liveId) {
		List<GraphVO> positive = graphicMapper.selectPositive(liveId);
		
		Random random = new Random();
		List<GraphVO> result = new ArrayList<GraphVO>();
        
        for(int i = 0; i < 5; i++) {
        	int randomIndex = random.nextInt(positive.size());
        	result.add(positive.get(randomIndex));
        }
		return result;
	}

	//부정 결과 5개
	@Override
	public List<GraphVO> selectNegative(String liveId) {
		List<GraphVO> negative = graphicMapper.selectNegative(liveId);
		
		Random random = new Random();
		List<GraphVO> result = new ArrayList<GraphVO>();
        
        for(int i = 0; i < 5; i++) {
        	int randomIndex = random.nextInt(negative.size());
        	result.add(negative.get(randomIndex));
        }
		return result;
	}

}
