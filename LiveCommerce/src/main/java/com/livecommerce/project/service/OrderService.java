package com.livecommerce.project.service;
/**
 * @author 김민석
 * @since 2023.01.15
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
 * 2023.01.15    김민석                최초 생성
*/
import java.util.*;
import com.livecommerce.project.vo.*;

public interface OrderService {
	
	/* 주문 페이지로 넘길정보 */
	public List<OrderPageItemVO> getGoodsInfo(List<OrderPageItemVO> orders);
	/* 주문 */
	public void order(OrderVO ordervo);
}
