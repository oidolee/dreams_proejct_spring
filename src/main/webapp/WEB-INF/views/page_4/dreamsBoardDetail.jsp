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
    <title>드림즈게시판 상세</title>
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
    <%-- <script src="${path}/resource/js/bootstrap/bootstrap.bundle.js"></script> --%>
    <!-- swiper js-->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    <!-- scrollreveal -->
    <script src="https://unpkg.com/scrollreveal/dist/scrollreveal.min.js"></script>
    <!-- header.js -->
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
        });

    
    $(function() {	// 페이지 로딩시
	 	// 댓글쓰기 버튼 클릭
	 	$('#reviewButton').click(function() {
	 		review_add();
	 	});
    
	 	// 로그인 안하고 댓글쓰기 버튼 클릭
	 	$('#reviewButton0').click(function() {
	 		alert("로그인을 해주세요");
	 	});
	 	
	 	// 댓글 목록
	 	review_list();
    
    });
    
    // 댓글쓰기 버튼 클릭시
    function review_add(){
    	
    	let param= {
    			"board_No": ${dto.board_No},
    			"reviewWrite": $('#reviewWrite').val(),
    			"cust_Id": '${sessionScope.sessionID}'
    	}
    	
    	$.ajax({
    		url: '${path}/dreamsBoardReview_add.bc',
    		type: 'POST',
    		data: param,
    		success: function(){
    			$('#reviewWrite').val("");
    			review_list();
    		},
    		error: function() {
    			alert('review_add() 오류')
    		}
    	});
    	
    }
    
    // 자동으로 댓글목록 호출
    function review_list() {
    	var sendData;
    	
    	if("${param.pageNum}" == ""){
    		sendData =  'board_No=${dto.board_No}';
		}
    	else{
			sendData =  'board_No=${dto.board_No}&pageNum=${param.pageNum}';
		}
    	
    	$.ajax({
    		url: '${path}/dreamsBoardReview.bc',
    		type: 'POST',
   			data: sendData,
    		    		
    		success: function(result){
    			$('#reviewList').html(result);
    		},
    		error: function(){
    			alert('review_list() 오류')
    		}
    	})
    }
    
    </script>
</head>
<body>
  
	<div class="wrap">
    	<%@ include file="/WEB-INF/views/layout/header.jsp" %>
      
        <div class="slider-con">
            <div class="slider-box">
                <img src="${path}/resources/image/banner/category_BOARDS.jpg" alt="">
            </div>
        </div>
        <!-- 상단 중앙1 시작 -->
        	<form name="boardDetailForm" method="post">
				<div style="display: flex; justify-content: center;"class="board">
					
                <!-- 좌측메뉴 시작 -->
				<%@ include file="/WEB-INF/views/page_4/boardLeftMenu.jsp" %>
				<!-- 좌측메뉴 종료 -->	
				<!-- 우측메뉴 시작 -->
                <div style="width: 800px; " >
					<h2 align="center" class="title"> 드림즈 게시판 </h2><br>
                    <table id="boardDetail">
                        <tr>
                            <th colspan="3" style="font-size: 25px;">
                                ${dto.board_Title}
                            </th>
                        </tr>
                        
                        <tr>
                            <td style="font-size: 13px; width: 500px;">
                            ${dto.cust_Id}
                            </td>
                       
                            <td style="font-size: 13px; width: 250px;">
                            ${dto.board_Date}
                            </td>
                        
                            <td style="font-size: 13px;">
                            <button type="button" style="background-color: white; border-color: white;">신고</button>
                            </td>
                        </tr>

                        <tr style="height: 200px;">
                            <td colspan="3">
                            <pre>
								${dto.board_Content}
                            </pre>
                            </td>
                           
                        </tr>
                        
                    </table>
                
                    <hr id="blackline">
                    <div style="display: flex; justify-content: center; margin-bottom: 50px;">
                        <div id="detailbutton">
                        	<input type="hidden" name="hidden_num" value="${dto.board_No}">
                            <c:if test="${dto.board_No != 1}">
                            	<a href="dreamsBoardDetail.bc?board_No=${dto.board_No - 1}" style="margin-right: 250px;"> < 이전 </a>
                            </c:if>
                            	<a href="dreamsBoard.bc"> 목록 </a>
                        	<c:if test="${dto.board_No != maxBoardNo}">
                            	<a href="dreamsBoardDetail.bc?board_No=${dto.board_No + 1}" style="margin-left: 250px;"> 다음 > </a>
                            </c:if>
                        </div>
                    </div>
	                <c:if test="${sessionID == dto.cust_Id}">		<!-- 세션아이디가 게시글 등록자와 같으면 수정 삭제 버튼 생성 -->
	                    <div style="display: flex; justify-content: right; margin-bottom: 50px;">
	                        <div id="writebutton">
	                        	<input type="hidden" name="board_No" value="${dto.board_No}">
	                        	<input type="button" value="수정" onclick="location.href='dreamsBoardEdit.bc?board_No=${dto.board_No}'">
	                        	<input type="button" value="삭제" onclick="location.href='dreamsBoardDelete.bc?board_No=${dto.board_No}'">
	                        </div>
	                    </div>
	                </c:if>
	                <br><br>
	                
                    <div id="reviewList"></div>
                    
                    <table>
                         <tr>
                          	<c:if test="${sessionScope.sessionID == null}">
	                          	<td style="width: 100%; padding: 20px 0">
	                              	<textarea name="reviewWrite0" id="reviewWrite0" cols="1" rows="2" placeholder="로그인 후 의견을 적어주세요."></textarea>
	                         	</td>
	                         	<td>
	                              	<button id="reviewButton0"> 댓글달기 </button>
	                         	</td>
                            </c:if>
                          	<c:if test="${sessionScope.sessionID != null}">
	                         	<td style="width: 100%; padding: 20px 0">
	                              	<textarea name="reviewWrite" id="reviewWrite" cols="1" rows="2" placeholder="타인에 대한 비난 및 욕설시 임의로 삭제 될 수 있습니다."></textarea>
	                          	</td>
	                          	<td>
	                              	<button id="reviewButton"> 댓글달기 </button>
	                         	</td>
                            </c:if>
                         </tr>
					</table>

					<!-- 우측메뉴 종료 -->
                </div>
            </div>
     	</form>
     	<br><br>
      
      	<div id="goTop" class="goTop">
            <a href="#header"></a>
        </div>
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
	</div>
</body>

</html>