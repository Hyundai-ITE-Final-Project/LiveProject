package com.livecommerce.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.livecommerce.project.vo.LiveVO;

@Mapper
public interface LiveMapper {
	
	public List<LiveVO> liveList();
}
