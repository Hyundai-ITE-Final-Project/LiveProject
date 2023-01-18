package com.livecommerce.project.vo;
import com.nimbusds.jose.shaded.json.JSONObject;

import lombok.Data;
import lombok.NoArgsConstructor;
/**
 * @author 김민석
 * @since 2023.01.18
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
 * 2023.01.18    김민석                최초 생성
*/
@NoArgsConstructor
@Data
public class IamprotDTO {
   private String code;
   private String message;
   private JSONObject response = new JSONObject();
}