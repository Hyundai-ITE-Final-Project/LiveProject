package com.livecommerce.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.livecommerce.project.mapper.LiveMapper;
import com.livecommerce.project.vo.LiveVO;
/**
 * @author 신기원
 * @since 2023.01.17
 * @version 1.0
 * 
 * <pre>
 * 수정일                    수정자                   수정내용
 * ----------  --------    ---------------------------
 * 2023.01.17    신기원                	 최초 생성
 * </pre>
 */

@Service
@Transactional(readOnly = true)
public class LiveServiceImpl implements LiveService{

	@Autowired
	private LiveMapper LiveMapper;
	
	
	@Override
	public List<LiveVO> liveList() {
		return LiveMapper.liveList();
	}

}
