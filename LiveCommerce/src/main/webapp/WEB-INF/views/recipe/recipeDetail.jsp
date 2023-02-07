<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header/main_header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>H-LIVE</title>
	<style>
	body{
    	margin: 0 auto;
    	width: auto;
    	font-size:16px;
    }
    .recipe-info dl{
    	display:inline-flex;
    	position:relative;
    	margin-left:55px;
    	padding-left:32px;
    	text-align:left;
    	line-height:24px;
    }
    dt{
    	float:left;
    	margin-right:15px;
    	font-weight:bold;
    }
	</style>
</head>
<body>
    <main class="container">
        <div id="shop_wrap">
            <div class="shop_content">
                <div class="menu_tabpanel">
                    <div class="infiniteScroll_wrap">
                    	<div class="lnbarea" style="float: none; position: relative; padding-bottom: 15px; padding-top:40px; padding-left:20px; width: auto; border-bottom: 2px solid #454545;">
	                    	<h1>레시피</h1>
	                    </div>
	                    <div class="recipename" style="padding-bottom: 15px; padding-top:30px; padding-bottom:20px; padding-left:20px;"; >
	                    	<h1>${recipe.rcp_nm}</h1>
	                    </div>
	                    <hr>
	                    <div class="recipe-info" style="padding: 32px 0; text-align: center; font-size:18px;">
			                <dl class="level">
			                    <dt>조리방법</dt>
			                    <dd>${recipe.rcp_way2}</dd>
			                </dl>
			                <dl class="time">
			                    <dt>요리 종류</dt>
			                    <dd>${recipe.rcp_pat2}</dd>
			                </dl>
			            </div>
			            <div style="text-align:center;">
	                        <img src="${recipe.att_file_no_main}">
			            </div>
			            <div style="margin-left:200px; padding-top:50px; margin-right:200px;">
				            <div>
				            	<h2>이런 재료가 필요해요🥕</h2>
				            </div>
		                    <div style="padding-top:20px; font-size:18px; line-height:1.5;">
		                    	${recipe.rcp_parts_dtls}
							</div>
						</div>
			            <div style="margin-left:200px; padding-top:50px; margin-right:200px;">
	                    	<div>
	                    		<h2>이렇게 요리하세요👨‍🍳</h2>
	                    	</div>
	                    	<div style="padding-top:20px; font-size:18px; line-height:2;">
		                    	${recipe.manual01}
		                    	<br>                    	
		                    	${recipe.manual02}
		                    	<br>
		                    	${recipe.manual03}
		                    	<br>                    	
		                    	${recipe.manual04}
		                    	<br>
	                    		${recipe.manual05}
		                    	<br>                    	
		                    	${recipe.manual06}
		                    	<br>
		                    	${recipe.manual07}
		                    	<br>                    	
		                    	${recipe.manual08}
		                    	<br>
		                    	${recipe.manual09}
		                    	<br>                    	
		                    	${recipe.manual10}
		                    	<br>
		                    	${recipe.manual11}
		                    	<br>                    	
		                    	${recipe.manual12}
		                    	<br>
	                    		${recipe.manual13}
		                    	<br>                    	
		                    	${recipe.manual14}
		                    	<br>
		                    	${recipe.manual15}
		                    	<br>                    	
		                    	${recipe.manual16}
		                    	<br>
		                    	${recipe.manual17}
		                    	<br>
		                    	${recipe.manual18}
		                    	<br>                    	
		                    	${recipe.manual19}
		                    	<br>
	                    	</div>
	                    </div>
                    </div>
	                <!-- 김나형 페이지 번호 처리  -->
					<div class="paging" style="display: block;">
						<div class="paging2">
							<input type="hidden" class="realEnd" value="${pageMaker.realEnd}">
							<c:if test="${pageMaker.prev}">
								<!-- 이전 버튼 -->
								<a class="arrow prev"
									href="/product/listCategory?lcategory=${lc}&scategory=${sc}&pageNum=${pageMaker.startPage -1}"></a>
							</c:if>
						
							<!-- 1~10 버튼 -->
							<span class="num">
								<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
									<c:if test="${(pageMaker.startPage+i) <= pageMaker.endPage}">
										<a href="/product/listCategory?lcategory=${lc}&scategory=${sc}&pageNum=${num}"
											class="pageBtn" onclick="click(${num})">${num}</a>
									</c:if>
								</c:forEach>
							</span>  
							<c:if test="${pageMaker.next}">
								<!-- 다음 버튼 -->
								<a href="/product/listCategory?lcategory=${lc}&scategory=${sc}&pageNum=${pageMaker.endPage +1}"
									class="arrow next"></a>
							</c:if>
						</div>
					</div>
					<!--  end Pagination -->
                </div>
            </div>
        </div>
    </main>
</body>
<script>
$(document).ready(function() {
		// 김나형 recipeDetail 페이지로 이동
		const recipes = document.querySelectorAll(".videoCard_wrap")
		for(i = 0; i < recipes.length; i++){
			var recipeid = recipes[i].getElementsByClassName("video_wrap")[0]
				.getAttribute("recipeid");
			recipes[i].getElementsByClassName("video_link")[0].setAttribute(
					"href", "/recipe/recipeDetail?recipeid=" + recipeid);
		}

	    function click(num){
	    	var strText = $(num).text();
	    	alert(strText);
	    }
	});//  end ready
</script>
</html>
<%@ include file="/WEB-INF/views/footer/footer.jsp"%>