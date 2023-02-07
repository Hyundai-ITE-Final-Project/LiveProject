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
	.paging {
		margin-top:50px;
		margin-bottom:30px;
		text-align:center;
		font-size:0;
	}
	.paging2 {
		display:inline-block;
	}
	.paging .none {
		display:none;
	}
	.paging .pageBtn {
		display:block;
		margin:0 3px;
		float:left;
		border:1px solid #e6e6e6;
		width:28px;
		height:28px;
		line-height:28px;
		text-align:center;
		background-color:#fff;
		font-size:13px;
		color:#999999;
		text-decoration:none;
	}
	.paging .arrow {
		border:1px solid #ccc;
		display:block;
		margin:0 3px;
		float:left;
		width:28px;
		height:28px;
		line-height:28px;
		text-align:center;
		background-color:#fff;
		font-size:13px;
		color:#999999;
		text-decoration:none;
	}

	.paging .prev {
		background:#f8f8f8 url('/resources/img/page_prev.png') no-repeat center center;
		margin-right:7px;
	}
	.paging .arrow.next {
		background:#f8f8f8 url('/resources/img/page_next.png') no-repeat center center;
		margin-left:7px;
	}
 	.paging .pageBtn.active {
		background-color:#42454c;
		color:#fff;
		border:1px solid #42454c;
	}
	</style>
</head>
<body>
	<script>
	$(document).ready(function(){
		$.ajax({
			url:'http://openapi.foodsafetykorea.go.kr/api/7d18cadba4a14db5bf10/COOKRCP01/json/1/100',
			type:'GET',
			datatype:'json',
	        success: function(data) {
	            let list = data["COOKRCP01"]["row"];
	            for(let i=0; i<list.length; i++){
	            	let mise = list[i];
	            	let name = mise["RCP_NM"];
	            	console.log(name);
		        	var template = `<div class="videoCard_wrap videoVerticalList_item">
			        					<form id="recipe`+mise["RCP_SEQ"]+`" name="formm`+mise["RCP_SEQ"]+`" action="/recipe/recipeDetail" method="post">
						                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						                    <input type="hidden" id="mid" name="mid" value="${member}">
						                    <input type="hidden" id="rcp_seq" name="rcp_seq" value="`+mise["RCP_SEQ"]+`">
						                    <input type="hidden" id="rcp_nm" name="rcp_nm" value="`+mise["RCP_NM"]+`">
						                    <input type="hidden" id="rcp_parts_dtls" name="rcp_parts_dtls" value="`+mise["RCP_PARTS_DTLS"]+`">
						                    <input type="hidden" id="att_file_no_main" name="att_file_no_main" value="`+mise["ATT_FILE_NO_MK"]+`">
						                    <input type="hidden" id="rcp_way2" name="rcp_way2" value="`+mise["RCP_WAY2"]+`">
						                    <input type="hidden" id="rcp_way2" name="rcp_pat2" value="`+mise["RCP_PAT2"]+`">						                    
						                    <input type="hidden" id="manual01" name="manual01" value="`+mise["MANUAL01"]+`">
						                    <input type="hidden" id="manual02" name="manual02" value="`+mise["MANUAL02"]+`">
						                    <input type="hidden" id="manual03" name="manual03" value="`+mise["MANUAL03"]+`">
						                    <input type="hidden" id="manual04" name="manual04" value="`+mise["MANUAL04"]+`">
						                    <input type="hidden" id="manual05" name="manual05" value="`+mise["MANUAL05"]+`">
						                    <input type="hidden" id="manual06" name="manual06" value="`+mise["MANUAL06"]+`">
						                    <input type="hidden" id="manual07" name="manual07" value="`+mise["MANUAL07"]+`">
						                    <input type="hidden" id="manual08" name="manual08" value="`+mise["MANUAL08"]+`">
						                    <input type="hidden" id="manual09" name="manual09" value="`+mise["MANUAL09"]+`">
						                    <input type="hidden" id="manual10" name="manual10" value="`+mise["MANUAL10"]+`">
						                    <input type="hidden" id="manual11" name="manual11" value="`+mise["MANUAL11"]+`">
						                    <input type="hidden" id="manual12" name="manual12" value="`+mise["MANUAL12"]+`">
						                    <input type="hidden" id="manual13" name="manual13" value="`+mise["MANUAL13"]+`">
						                    <input type="hidden" id="manual14" name="manual14" value="`+mise["MANUAL14"]+`">
						                    <input type="hidden" id="manual15" name="manual15" value="`+mise["MANUAL15"]+`">
						                    <input type="hidden" id="manual16" name="manual16" value="`+mise["MANUAL16"]+`">
						                    <input type="hidden" id="manual17" name="manual17" value="`+mise["MANUAL17"]+`">
						                    <input type="hidden" id="manual18" name="manual18" value="`+mise["MANUAL18"]+`">
						                    <input type="hidden" id="manual19" name="manual19" value="`+mise["MANUAL19"]+`">
				        					
						        				<a href="#" class="video_link" onclick="go_detail('`+ mise["RCP_SEQ"]+ `')">
						        					<div class="video_wrap" recipeid="`+ mise["RCP_SEQ"] + `">
								                        <div class="video_container">
								                            <img class="video_container_img" draggable="false" src=`+mise["ATT_FILE_NO_MAIN"]+`>
								                        </div>
								                    </div>
								                </a>
								                <span class="video_title">`+mise["RCP_NM"]+`</span>
							            </form>
						            </div>`
		            $(".infiniteScroll_wrap").append(template);
	            }
	        },// 요청 완료 시
	        error:function(jqXHR) {
	            console.log("실패입니다.");
	        }// 요청 실패.
		});
	});
	</script>
	<script>
    function go_detail(value){
    	var formm = "form" + value;
    	console.log("form"+value);
    	console.log(formm);
    	document.getElementById('recipe'+value).submit();
    }
	</script>
    <main class="container">
        <div id="shop_wrap">
            <div class="shop_content">
            <!-- 카테고리별 보기 -->
                <div class="menu_tabpanel">
                    <div class="infiniteScroll_wrap">

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
$(function() {
	   $(".main6").attr("aria-selected","true");
	   
	});
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