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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.livecommerce.project.mapper.CartMapper;
import com.livecommerce.project.mapper.MemberMapper;
import com.livecommerce.project.mapper.OrderMapper;
import com.livecommerce.project.mapper.ProductMapper;
import com.livecommerce.project.vo.CartVO;
import com.livecommerce.project.vo.IamprotDTO;
import com.livecommerce.project.vo.MemberVO;
import com.livecommerce.project.vo.OrderListVO;
import com.livecommerce.project.vo.OrderPageItemVO;
import com.livecommerce.project.vo.OrderVO;
import com.livecommerce.project.vo.ProductVO;
import com.nimbusds.jose.shaded.json.JSONObject;

@Service
public class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private CartMapper cartMapper;
	
	@Autowired
	private ProductMapper productMapper;
	
	Random random = new Random();
	
	final char[] digits = {
	        '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
	        'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 
	        'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 
	        'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D',
	        'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 
	        'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 
	        'Y', 'Z', '#', '$'
	    };
	
	   //아임포트
	   private final String imp_key = "0636646546784601";
	   private final String imp_secret = "P9bvL4zTldk4Pj5clPfn2JdZClbxQuFhRQqNVPpiOEaIsY3ViZhDA5G1ZdTufQx4W0GXAxHVn4DYVpCo";
	   private RestTemplate restTemplate=new RestTemplate();
	   private HttpHeaders headers = new HttpHeaders();
	   
	   private MultiValueMap<String, String> map = new LinkedMultiValueMap<String, String>();
	   private JSONObject body = new JSONObject();
	   
	   	//iamport 주문취소 토큰 가져오기
	    private IamprotDTO getToken() throws JSONException {
	        headers.setContentType(MediaType.APPLICATION_JSON);
	        body.put("imp_key", imp_key);
	        body.put("imp_secret", imp_secret);
	        try {
	           System.out.println("1");
//	            HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body, headers);
	           HttpEntity<JSONObject> entity = new HttpEntity<JSONObject>(body, headers);
	            System.out.println("2"+entity);
	      
	            IamprotDTO token = restTemplate.postForObject("https://api.iamport.kr/users/getToken", entity, IamprotDTO.class);
	            System.out.println(token+" FULLtoken");
	            return token;
	        } catch (Exception e) {
	            e.printStackTrace();
	            
	            System.out.println("gettoken에서 오류가 발생");
	        }finally{
	            headerAndBodyClear();
	        }
	        return null;
	    }
	    //바디에 있는 값하고 헤더에 있는 값 없애는것
	    private void headerAndBodyClear(){
	        headers.clear();
	        body.clear();
	    }
	
	//본격적으로 주문페이지에 필요로 한 상품 정보를 만들어 내는 로직
	@Override
	public List<OrderPageItemVO> getGoodsInfo(List<OrderPageItemVO> orders) {
		List<OrderPageItemVO> result = new ArrayList<OrderPageItemVO>();		
		
		for(OrderPageItemVO ord : orders) {
			
			OrderPageItemVO goodsInfo = orderMapper.getGoodsInfo(ord.getPid());			

			goodsInfo.setPcount(ord.getPcount());	
			
			goodsInfo.initSaleTotal();			
			
			result.add(goodsInfo);			
		}		
		
		return result;
	}

	@Override
	@Transactional
	public void order(OrderVO ord) {

		/* 사용할 데이터가져오기 */
			/* 회원 정보 */
			MemberVO member = memberMapper.getMemberInfo(ord.getMember_mid());
			/* 주문 정보 */
			List<OrderListVO> ords = new ArrayList<>();
			for(OrderListVO oit : ord.getOrders()) {
				OrderListVO orderItem = orderMapper.getOrderInfo(oit.getPid());
				// 수량 셋팅
				orderItem.setOlquantity(oit.getOlquantity());
				// 기본정보 셋팅
				orderItem.initSaleTotal();
				//List객체 추가
				ords.add(orderItem);
				
			}
			/* OrderVO 셋팅 */
			ord.setOrders(ords);
			ord.getOrderPriceInfo();
		/*DB 주문,주문상품(,배송정보) 넣기*/
			
			int shift = 6;
		    char[] buf = new char[64];
		    int charPos = 64;
		    int radix = 1 << shift;
		    long mask = radix - 1;
		    long number = System.nanoTime();
		    do {
		        buf[--charPos] = digits[(int) (number & mask)];
		        number >>>= shift;
		    } while (number != 0);
			
			
			
			/* oid만들기 및 OrderVO객체 oid에 저장 */
			Date date = new Date();
			SimpleDateFormat format = new SimpleDateFormat("_yyyyMMdd_HH:mm:ss");
			System.out.println(member.getMid());
			String orderId = new String(buf, charPos, (64 - charPos)) + format.format(date);
			
			ord.setOid(orderId);
			
			/* db넣기 */
			orderMapper.enrollOrder(ord);		//주문테이블에 등록
			for(OrderListVO oit : ord.getOrders()) {   //주문리스트테이블에 등록
				oit.setOid(orderId);
				orderMapper.enrollOrderList(oit);			
			}

		/* 비용 포인트 변동 적용 */
			
//			// 비용 차감 & 변동 돈(money) Member객체 적용 
//			int calMoney = member.getMoney();
//			calMoney -= ord.getOrderFinalSalePrice();
//			member.setMoney(calMoney);
			
			/* 포인트 차감, 포인트 증가 & 변동 포인트(point) Member객체 적용 */
			int calPoint = member.getMpoint();
			calPoint = calPoint - ord.getUsePoint() + ord.getOrdersavepoint();	// 기존 포인트 - 사용 포인트 + 획득 포인트
			member.setMpoint(calPoint);
				
			/* 변동 돈, 포인트 DB 적용 */
			orderMapper.deductPoint(member);
			
		/* 재고 변동 적용 */
			for(OrderListVO oit : ord.getOrders()) {
				/* 변동 재고 값 구하기 */
				ProductVO product = productMapper.productGetDetail(oit.getPid());
				product.setPstock(product.getPstock() - oit.getOlquantity());
				/* 변동 값 DB 적용 */
				orderMapper.deductStock(product);
			}			
			
		/* 장바구니 제거 */
			for(OrderListVO oit : ord.getOrders()) {
				CartVO vo = new CartVO();
				vo.setMember_mid(ord.getMember_mid());
				vo.setProduct_pid(oit.getPid());
				
				cartMapper.deleteOrderCart(vo);
			}			

	}

	@Override
	public void OrderCancel(String imp_uid) {
		//아임포트 결제 취소 부분
	      //String imp_uid = ouv.getImp_uid();
	      System.out.println(imp_uid);
	      try {
	         IamprotDTO iamproDto = getToken();
	         if (iamproDto == null) {
	            throw new Exception();
	         }
	         String token = (String) iamproDto.getResponse().get("access_token");
	         System.out.println("토큰 : " + (String) iamproDto.getResponse().get("access_token"));
	         headers.add("Authorization", token);
	      
	         map.add("imp_uid", imp_uid);
	         HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(map, headers);
	         System.out.println(entity);
	         String cancle = restTemplate.postForObject("https://api.iamport.kr/payments/cancel?_token=" + token, entity,
	               String.class);
	         System.out.println(cancle + " full cancle");
	      } catch (Exception e) {
	         e.printStackTrace();
	         System.out.println("cancleBuy가 실패 했습니다 직접 환불 바랍니다");
	         throw new RuntimeException("환불에 실패 했습니다 다시시도 바랍니다");
	      } finally {
	         headerAndBodyClear();
	      }
	}
	
	
}
