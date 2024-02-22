<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/setting.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<!-- 페이지 작업자 : 강승재 -->
<head>    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>드림즈게시판</title>
    <!-- reset.css -->
    <link rel="stylesheet" href="${path}/resources/css/common/reset.css">
    <!-- Bootstrap css-->
    <link href="${path}/resources/css/bootstrap/bootstrap.css" rel="stylesheet" />
    <!-- swiper css-->
    <link rel="stylesheet" href="${path}/resources/css/common/common.css">
    <link rel="stylesheet" href="${path}/resources/css/index.css">
    <link rel="stylesheet" href="${path}/resources/css/common/page4_board.css">

    <!-- jQuery -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <!-- Bootstrap js -->
    <script src="${path}/resources/js/bootstrap/bootstrap.bundle.js"></script>
    <!-- swiper js-->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    <!-- scrollreveal -->
    <script src="https://unpkg.com/scrollreveal/dist/scrollreveal.min.js"></script>
    <!-- dreamsBoard.js -->
	<script src="${path}/resources/js/board/dreamsBoard.js"></script>
    <script>
        // 페이지 로드 후 실행될 함수
        $(document).ready(function () {
            // top 버튼 클릭 시 스크롤
            $('#goTop a[href="#header"]').on('click', function (e) {
                window.scroll({
                    top: 0,
                });
                checkButton();
            });

            $(".floating-box.center").on("click",function(){
                $(".first-bg").hide();
            })
        });

        //크롬 스크롤 오류로 시간 지정 후 동장
        $(window).on("scroll", function () {
            $("#goTop a").attr("href", "#none")
            $("#goTop").css({ "background-color": "rgba(255, 255, 255, 0.1)" });
            setTimeout(() => {
                $("#goTop a").attr("href", "#header")
                $("#goTop").css({ "background-color": "rgba(255, 255, 255, 0.7)" });
            }, 2000);
        })

    </script>
</head>
<div class="wrap">

    <body>
    	<%@ include file="/WEB-INF/views/layout/header.jsp" %>
      
        <div class="slider-con">
            <div class="slider-box">
                <img src="${path}/resources/image/banner/category_BOARDS.jpg" alt="">
            </div>
        </div>
        <!-- 상단 중앙1 시작 -->
			<form name="boardForm" method="post">
				<div style="display: flex; justify-content: center;"class="board">
                    <!-- 좌측메뉴 시작 -->
					<%@ include file="/WEB-INF/views/page_4/boardLeftMenu.jsp" %>
					<!-- 좌측메뉴 종료 -->	
					<!-- 우측메뉴 시작 -->
	                <div style="width: 800px;">
						<h2 align="center" class="title"> 드림즈 게시판 </h2><br>
	                    
	                <table>
	                    <colgroup>
	                        <col width="100px">
	                        <col width="600px">
	                        <col width="300px">
	                        <col width="150px">
	                    </colgroup>
	                    <tbody>
	                    <c:forEach var="dto" items="${list}">
	                    	<tr class="boardtable">
	                    		<td> 
	                    		</td>
	                    		<td class="boardtitle">
	                    			<a href="dreamsBoardDetail.bc?board_No=${dto.board_No}">${dto.board_Title}</a>
	                    		</td>
	                    		<td class="name">${dto.cust_Id}</td>
	                    		<td class="date">${dto.board_Date}</td>
	                    	</tr>
	                    </c:forEach>
	                    </tbody>
	                </table>
	                
	                <hr id="blackline">
	                <div style="display: flex; justify-content: right;">
	                    <input type="text" class="search" name="searchKey" id="searchKey" style="height: 30px;" placeholder="제목 키워드 입력">
	                    <input type="button" name="searchButton" id="search" value="Search" onclick="searchBoard()">
	                    <c:if test="${sessionScope.sessionID != null}">
	                    	<a href="dreamsBoardWrite.bc"><button type="button" id="write" >드림즈 게시판 글쓰기</button></a>
	                    </c:if>
	                    <c:if test="${sessionScope.sessionID == null}">
	                    	<a href="#"><button type="button" id="write" onclick="nonSessionID()">드림즈 게시판 글쓰기</button></a>
	                    </c:if>
	                </div>
	
	                <div class="pageNav">
	                	<!-- 이전 버튼 활성화 -->
	                	<c:if test="${paging.startPage > 10}">
	                    <span class="prev1">
	                        <a href="${path}/dreamsBoard.bc?pageNum=${paging.prev}" style="color: white !important; padding: 5px 5px 5px 5px; margin-right: 10px;">
	                            <span style="color: white !important;">< 이전</span>
	                        </a>
	                    </span>
	                    </c:if>
	                    
	                    <!-- 이전 버튼 활성화 -->
	                    <c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
	                    	<c:if test="${paging.currentPage == num}">
			                    <span class="page">
			                        <a href="${path}/dreamsBoard.bc?pageNum=${num}" class="on" >${num}</a>
			                    </span>
			                </c:if>
	                    	<c:if test="${paging.currentPage != num}">
			                    <span class="page1">
			                        <a href="${path}/dreamsBoard.bc?pageNum=${num}" class="on">${num}</a>
			                    </span>
			                </c:if>
	                    </c:forEach>
	                    
	                    <!-- 다음 버튼 활성화 -->
	                    <c:if test="${paging.endPage < paging.pageCount}">
	                    <span class="next1">
	                        <a href="${path}/dreamsBoard.bc?pageNum=${paging.next}" style="color: white !important; padding: 5px 5px 5px 5px; margin-left: 10px;">
	                            <span style="color: white !important;">다음 ></span>
	                        </a>
	                    </span>
	                    </c:if>
	                </div>
                </div>
            </div>
          </form>
		<!-- 우측메뉴 종료 -->
		<div id="goTop" class="goTop">
            <a href="#header"></a>
        </div>
        <%-- 
        <a href="${path}/admin_board.bc">
            <div class="floating-box left"></div>
        </a>
     	 --%>
      	<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
        
        <script>
            //메인 스크롤 이벤트 
            window.sr = ScrollReveal({ reset: true });
            let SRArr = ['.first-title','.slider-con','.section-1-con','.section-2-con','.section-3-con','footer'];
            SRArr.forEach(selector => {
                sr.reveal(selector, { 
                    origin: 'bottom', distance: '100px', duration: 2000,
                    viewFactor: 0.1 // 10%만 보이면 나타나도록 설정
                });
            });
            ScrollReveal().reveal('.headline');
        </script>
    </body>
</div>

</html>