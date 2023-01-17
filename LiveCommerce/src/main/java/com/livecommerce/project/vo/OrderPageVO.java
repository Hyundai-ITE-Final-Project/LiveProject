package com.livecommerce.project.vo;
/**
 * @author 김민석
 * @since 2023.01.15
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
 * 2023.01.15    김민석                최초 생성
*/
import lombok.Data;
import java.util.*;

@Data
public class OrderPageVO {
	private List<OrderPageItemVO> orders;
}
