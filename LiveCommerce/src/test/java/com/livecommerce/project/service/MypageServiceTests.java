package com.livecommerce.project.service;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.livecommerce.project.vo.OrderVO;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
public class MypageServiceTests {
	@Autowired
	private MypageService mypageService;
	
	//주문id별로 주문현황리스트 뽑기
	@Test
	public void getOrderList() {
		String member_mid = "nadong";
		List<List<OrderVO>> list3 = new ArrayList<>();
		List<String> list = mypageService.getOid(member_mid);
		for(int i=0; i<list.size(); i++) {
			String oid1 = list.get(i);
			List<OrderVO> list2 = mypageService.getOidorderList(oid1, member_mid);
			list3.add(list2);
		}

		for(int i=0; i<list3.size(); i++) {
			System.out.println(list3.get(i));
		}
	}
}
