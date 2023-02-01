package com.livecommerce.project.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.livecommerce.project.vo.RecipeVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
/**
 * @author 김나형
 * @since 2023.01.11
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
 * 2023.02.01	김나형		최초 생성
*/

@Controller
@RequestMapping("/recipe")
@Log4j
@AllArgsConstructor
public class RecipeController {
	@GetMapping(value="/api", produces = "application/json; charset=UTF-8")
	public String getRecipe(HttpServletRequest request, Model model) throws IOException{
		StringBuilder urlBuilder = new StringBuilder("http://openapi.foodsafetykorea.go.kr/api");
		urlBuilder.append("/" + "7d18cadba4a14db5bf10");
		urlBuilder.append("/" + "COOKRCP01");
		urlBuilder.append("/" + "json");
		urlBuilder.append("/" + "1");
		urlBuilder.append("/" + "10");
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		BufferedReader rd;
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
		}
		else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		String line;
		StringBuilder result = new StringBuilder();
		
		while((line = rd.readLine()) != null) {
			result.append(line + "\n");
		}
		rd.close();
		conn.disconnect();
		model.addAttribute("result", result);
		log.info(result);
		return "recipe/recipeList";
	}
	
	@PostMapping("/recipeDetail")
	public void recipeDetail(HttpServletRequest request, Model model, RecipeVO recipe, RedirectAttributes rttr) {
		log.info("레시피 : " + recipe);
		model.addAttribute("recipe", recipe);
	}
}
