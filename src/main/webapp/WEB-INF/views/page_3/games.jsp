<%@page import="pj.mvc.dreams_project2.dto.gamesDTO"%>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/setting.jsp" %>   
<%
	

%>
<!DOCTYPE html>
<html lang="ko">
<!-- 경기일정 및 운영 작업자 : 이민진 -->
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>경기일정 및 결과</title>

    <link rel="stylesheet" href="${path}/resources/css/common/reset.css">
    <!-- Bootstrap css-->
    <link href="${path}/resources/css/bootstrap/bootstrap.css" rel="stylesheet" />

    <!-- jQuery -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <!-- swiper js-->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>
    
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    <script src="${path}/resources/js/common/header.js"></script>

    <link rel="stylesheet" href="${path}/resources/css/common/common.css">
    <link rel="stylesheet" href="${path}/resources/css/common/header.css">
    <link rel="stylesheet" href="${path}/resources/css/common/footer.css">
    <link rel="stylesheet" href="${path}/resources/page_3/css/games.css">
    
    <!-- 경기일정 css -->
    <link rel="stylesheet" href="${path}/resources/page_3/calenderJs/calender.css">
    <style>
        .container-box {
            padding: 0;
        }

        input:focus {
            outline: none;
        }



        .slider-con img{
            width: 100%;
        }

        .center{max-width: 1240px; margin: 0 auto;}
        .section-1-con{height: 440px;}
        .section-1{height: 100%; padding: 80px 0;}
        .section-1-top h2{text-align: center; }
        .section-1-top h2 a{color: #000 !important;}
        .section-1-bottom ul{display: flex; justify-content: space-between;  align-items: center; padding-top: 40px; padding-left: 0;}
    </style>
  <script type="text/javascript">
  		let idCheck = "${sessionID}";
	    let games = {};
	    <%-- JSP 코드 부분 --%>	    
	    <%
	        List<gamesDTO> list = (List<gamesDTO>)request.getAttribute("list");
	        for(gamesDTO dto : list){
	            Date dgTime = dto.getDG_Time();
	            Calendar cal = Calendar.getInstance();
	            cal.setTime(dgTime);

	            int month = cal.get(Calendar.MONTH) + 1;
	            int day = cal.get(Calendar.DAY_OF_MONTH);
	            
	            DateFormat dateFormat = new SimpleDateFormat("HH:mm");
	            String time = dateFormat.format(dgTime);
	            char checkHome = 'T'; 
	            if(!dto.getDG_Home().equals("드림즈")){
	            	checkHome = 'F';
	            }
	            
	    %>
	    	if(!games['month_<%= month %>']){
	    		games['month_<%= month %>'] = {};
	    	}

	    	 // 시간만 추출 (HH:mm 형식)
	    	games['month_<%= month %>'][<%= day %>] = {
	    	    DG_No :  '<%= dto.getDG_No() %>',
    			home: '<%= dto.getDG_Home() %>',
   	            away: '<%= dto.getDG_Away() %>',
   	         	time: '<%= time %>',
   	         	checkHome : '<%= checkHome %>'
	    	}
	    	
	    <% } %>
	    
	    console.log(games);
 </script>


</head>
<div class="wrap">
    <body>
      	<!-- header -->
        <%@include file="../layout/header.jsp"%>

        <div class="slider-con">
            <div class="slider-box">
                <img src="${path}/resources/image/banner/category_STATS.jpg" alt="">
            </div>
        </div>
     		<!-- 상단 중앙1 시작 -->
		<div style="display: flex; justify-content: center;"class="board">
		
                 <!-- 좌측메뉴 시작 -->
		<div id="left">
                     <div class="left_inside">
                         <!-- 좌측메뉴바 시작 -->
				<ul class="left_menubar">
                             <li><h3 style="color: white !important;">GAMES</h3></li>
					<li>
                                 <ul class="product_menu">
							<p></p>
							<li><a href="${path}/games.gc">경기일정 및 결과</a></li>
							<li><a href="${path}/gamesInsert.gc">경기일정 등록<br>(관리자)</a></li>
						</ul>
					</li>	
				</ul>	
				<!-- 좌측메뉴바 종료 -->
			</div>
		</div>
		<!-- 좌측메뉴 종료 -->	

             <!-- 우측메뉴 시작 -->
                 <div class="right_game">
                     <h2 class="title"> 경기일정 및 결과 </h2>
                     <div class="calendar">
                         <div class="header">
                             <div class="year-month"></div>
                             <div class="nav">
                                 <button class="nav-btn go-prev" onclick="prevMonth()">&lt;</button>
                                 <button class="nav-btn go-today" onclick="goToday()">Today</button>
                                 <button class="nav-btn go-next" onclick="nextMonth()">&gt;</button>
                             </div>
                         </div>
                         <div class="main">
                             <div class="days">
                                 <div class="day">일</div>
                                 <div class="day">월</div>
                                 <div class="day">화</div>
                                 <div class="day">수</div>
                                 <div class="day">목</div>
                                 <div class="day">금</div>
                                 <div class="day">토</div>
                             </div>
                             <div class="dates"></div>
                         </div>
                     </div>
                     <!-- 경기일정 js -->
                     <script src="${path}/resources/page_3/calenderJs/calender.js"></script>
                 </div>
               
         </div>   
            
        <!-- footer -->
        <%@include file="../layout/footer.jsp"%>
    </body>
</div>

</html>