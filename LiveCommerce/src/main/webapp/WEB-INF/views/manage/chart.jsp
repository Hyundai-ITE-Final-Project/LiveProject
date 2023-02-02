<%@page pageEncoding="UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/header/tool_header.jsp"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>     
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>텍스트마이닝 감정분석차트</title>
<link rel="stylesheet" href="/resources/css/chart.css">
</head>
<body>
			<div class="admin_tool_wrap">
				<div class="admin_tool_area">
					<div class="admin_tool_inner">			
						<div class="admin_tool_content">
							<div class="admin_list_body">
								<div class="chart_container">
									<canvas id="myChart1"></canvas>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
<script type="text/javascript">

      $(document).ready(function(){ 
    	    console.log("페이지실행");
    		$(".statistics_tab").attr("aria-selected","true");
    		getGraph1();
    		getGraph2();
    	});
      
      function getGraph1(){
    	  //그래프에 띄워줄 데이터를 담을 배열
       	  let timeList = [];
    	  let posList = [];
    	  
    	  $.ajax({
    		  url:"/chart",
    		  type:"get",
    		  data:{live_id:"${live_id}", mid:'<sec:authentication property="name"/>'},
    		  dataType:"json",
    		  success:function(data){
    			  // console.log(data[0].pos_count);
    			  // 그래프로 나타낼 자료 리스트에 담기
    			  for (let i = 0; i<data.length;i++){    				  
						timeList.push(data[i].positive);    				  
						posList.push(data[i].predict_count);    				  
    			  }
    			  // console.log(timeList);
    			  // console.log(posList);  	
				  // 그래프
    			  new Chart(document.getElementById("myChart1"), {
    		    	  type: 'doughnut',
    		    	  data: {
    		    	    labels: timeList, // X축 
    		    	    datasets: [{ 
    		    	        data: posList, // 값
    		    	        label: "주문",
    		    	        backgroundColor: 
    		    	        	[  
    		    	        	"#7CFC00",
    		                    "#FF0000"
    		                    ],
    		    	        fill: false
    		    	      }
    		    	    ]
    		    	  },
    		    	  options: {
    		    	    maintainAspectRatio: false,
    		    	    title: {
    		    	      display: true,
    		    	      text: '라이브 채팅분석통계'
    		    	    }
    		    	  }
    		    	}); //그래프
    		  },
    		  error:function(){
    			  alert("실패");
    		  }  
	     		  
    	  }) // ajax	  
      } // getGraph1
      
</script>
</body>
</html>
<%@include file="/WEB-INF/views/footer/footer.jsp" %>