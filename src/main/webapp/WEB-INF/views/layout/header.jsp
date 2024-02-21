<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html lang="ko">
<!-- 페이지 작업자 : 이민진 -->
<head>    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>드림즈</title>
    <!-- reset.css -->
    <link rel="stylesheet" href="${path}/resources/css/common/reset.css">
    <!-- swiper css-->
    <link rel="stylesheet" href="${path}/resources/css/common/common.css">
    <link rel="stylesheet" href="${path}/resources/css/common/header.css">

    <!-- jQuery -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <!-- header.js -->
    <script src="${path}/resources/js/common/header.js"></script>
</head>
<div class="wrap">
    <!-- 상단 이동 헤더 -->
    <div id="header"></div>
    <body>
        <div class="container-fluid container-box">
            <header>
                <div class="header-top">
               	
                    <div class="top-box">
                     <c:if test="${not empty sessionID}">
	                 	<div class="top-left"><c:out value="${sessionID}"></c:out>님 <br>환영 합니다</div>
	                 </c:if>
                        <div class="right">
                            <ul>
                            	<c:if test="${not empty sessionID}">
	                                <li><a href="${path}/*.oc">마이페이지</a></li>
	                                <li><a href="${path}/logout.cc">로그아웃</a></li>
                            	</c:if>
                            	 <c:if test="${empty sessionID}"> 
                                	<li><a href="${path}/login.cc">로그인</a></li>
	                                <li><a href="${path}/join.cc">회원가입</a></li>
                            	</c:if> 
                                <li><a href="${path}/resources/page_4/qna.html">안내 및 Q&A</a></li>
                                <li><a href="https://www.youtube.com/results?search_query=%EC%8A%A4%ED%86%A0%EB%B8%8C%EB%A6%AC%EA%B7%B8" target="_blank">
                                        <img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/common/top_sns1.png"
                                            alt="youtube">
                                    </a></li>
                                <li><a href="https://www.instagram.com/explore/tags/%EC%8A%A4%ED%86%A0%EB%B8%8C%EB%A6%AC%EA%B7%B8/top/" target="_blank">
                                        <img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/common/top_sns2.png"
                                            alt="instagram">
                                    </a></li>
                                <li><a href="https://www.facebook.com/watch/sbsdrama.official/2552511298297818/" target="_blank">
                                        <img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/common/top_sns3.png"
                                            alt="facebokk">
                                    </a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="header-bottom">
                    <nav>
                        <h2>
                            <a href="${path}">
                                <img src="${path}/resources/image/logoSmall.png" style="width: 100%;" alt="logoSmall">
                            </a>
                        </h2>
                        <!-- pc -->
                        <ul id="menu_box" class="menu-box">
                            <li>
                                <a href="${path}/resources/page_6/Introduce.jsp">DREAMS</a>
                                <ul class="menu-son display-none">
                                    <li><a href="${path}/resources/page_6/Introduce.jsp">드림즈 소개</a></li>
                                    <li><a href="${path}/resources/page_6/stadium.jsp">구장안내</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="${path}/resources/page_4/players.jsp">PLAYERS</a>
                                <ul class="menu-son display-none">
                                    <li><a href="${path}/resources/page_4/players.jsp">선수</a></li>
                                    <li><a href="${path}/resources/page_4/coaching.jsp">코칭스태프</a></li>
                                    <li><a href="${path}/resources/page_4/steff.jsp">구단관계자</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">GAMES</a>
                                <ul class="menu-son display-none">
                                    <li><a href="${path}/games.gc">경기일정 및 결과</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="${path}/resources/page_4/stats.jsp">STATS</a>
                                <ul class="menu-son display-none">
                                    <li><a href="${path}/resources/page_4/stats.jsp">팀순위</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="${path}/resources/page_5/productList.jsp">GOODS</a>
                                <ul class="menu-son display-none">
                                    <li><a href="${path}/customerProductList.pc">야구용품</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="${path}/resources/page_4/news.jsp">BOARDS</a>
                                <ul class="menu-son display-none">
                                    <li><a href="${path}/resources/page_4/news.jsp">구단소식</a></li>
                                    <li><a href="${path}/dreamsBoard.bc">드림즈게시판</a></li>
                                    <li><a href="${path}/resources/page_4/qna.jsp">안내 및 Q&A</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="${path}/ticket.tc">TICKET</a>
                                <ul class="menu-son display-none">
                                    <li><a href="${path}/ticket.tc">일일티켓</a></li>
                                    <li><a href="${path}/resources/page_2/DreamsMembership.jsp">멤버쉽</a></li>
                                    <li><a href="${path}/resources/page_2/groupViewing.jsp">단체관람</a></li>
                                    <li><a href="${path}/resources/page_2/skybox.jsp">스카이박스</a></li>
                                </ul>
                            </li>
                        </ul>

                        <!-- mobile -->
                        <ul id="mo-menu-box" class="mo-menu-box">
                            <li style="position: relative;">
                                <div class="home-box">
                                    <a href="#">HOME</a>
                                    
                                   	<c:if test="${not empty sessionID}">
		                               <a href="${path}/*.oc">마이페이지</a>
	                            	</c:if>
	                            	<c:if test="${empty sessionID}">
	                                	<a href="${path}/resources/page_1/login.cc">로그인</a>
	                            	</c:if>
                                    <a href="${path}/resources/page_1/join.cc">회원가입</a>
                                </div>
                            </li>
                            <li>
                                <a href="#">DREAMS</a>
                                <ul class="menu-son">
                                    <li><a href="${path}/resources/page_6/Introduce.jsp">드림즈 소개</a></li>
                                    <li><a href="${path}/resources/page_6/stadium.jsp">구장안내</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="${path}/resources/page_4/players.jsp">PLAYERS</a>
                                <ul class="menu-son">
                                    <li><a href="${path}/resources/page_4/players.jsp">선수</a></li>
                                    <li><a href="${path}/resources/page_4/coaching.jsp">코칭스태프</a></li>
                                    <li><a href="${path}/resources/page_4/steff.jsp">구단관계자</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">GAMES</a>
                                <ul class="menu-son">
                                    <li><a href="${path}/games.gc">경기일정 및 결과</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="${path}/resources/page_4/stats.jsp">STATS</a>
                                <ul class="menu-son">
                                    <li><a href="${path}/resources/page_4/stats.jsp">팀순위</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">GOODS</a>
                                <ul class="menu-son">
                                    <li><a href="${path}/customerProductList.pd">야구용품</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="${path}/resources/page_4/news.jsp">BOARDS</a>
                                <ul class="menu-son ">
                                    <li><a href="${path}/resources/page_4/news.jsp">구단소식</a></li>
                                    <li><a href="${path}/dreamsBoard.bc">드림즈게시판</a></li>
                                    <li><a href="${path}/resources/page_4/qna.jsp">안내 및 Q&A</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">TICKET</a>
                                <ul class="menu-son ">
                                    <li><a href="${path}/ticket.tc">일일티켓</a></li>
                                    <li><a href="${path}/resources/page_2/DreamsMembership.jsp">멤버쉽</a></li>
                                    <li><a href="${path}/resources/page_2/groupViewing.jsp">단체관람</a></li>
                                    <li><a href="${path}/resources/page_2/skybox.jsp">스카이박스</a></li>
                                </ul>
                            </li>
                            <div class="ul-bg"></div>
                        </ul>
                    </nav>
                    <div id="menu_bg" class="menu-bg display-none"></div>
                    <div id="left-bg" class="left-bg"></div>
                    <div id="son-menu-bg" class="son-menu-bg"></div>

                    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" id="icon"
                        class="bi bi-list icon" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z" />
                    </svg>
                </div>
            </header>
        </div>
    </body>
</div>
</html>