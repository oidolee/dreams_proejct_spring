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
    <title>드림즈게시판 글수정</title>
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
    <!-- header.js -->
    <script src="${path}/resources/js/common/header.js"></script>
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
<script>
$(function() {
	$("#btnEdit").click(function() {
		const title = $("#writeTitle").val();
		const content = $("#writeTextarea").val();
		
		if(title == ""){
			alert("제목을 입력하세요!!");
			$("#title").focus();
			return false;
		}
		
		if(content == ""){
			alert("글내용을 입력하세요!!");
			$("#content").focus();
			return false;
		}
		
		document.boardForm.action="${path}/dreamsBoardEditAction.bc";
		document.boardForm.submit();
		
	});
});
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
        <form name="boardForm" method="post">
			<div style="display: flex; justify-content: center;"class="board">
	            <!-- 좌측메뉴 시작 -->
				<%@ include file="/WEB-INF/views/page_4/boardLeftMenu.jsp" %>
				<!-- 좌측메뉴 종료 -->	
					<!-- 우측메뉴 시작 -->
	                <div style="width: 800px; " >
						<h2 align="center" class="title"> 게시글 수정하기 </h2><br>
	                    <table id="boardwrite">
	                        <tr>
	                            <th style="font-weight: bold">
	                                제목
	                            </th>
	                            <td>
	                                <input type="text" name="writeTitle" id="writeTitle" style="width: 100%; color: #000 !important;" placeholder="${dto.board_Title}" oninput="titleLength(this, 20)">
	                            </td>
	                        </tr>
	
	                        <tr style="height: 200px;">
	                            <th style="font-weight: bold">
	                                내용
	                            </th>
	                            <td>
	                                <textarea name="writeTextarea" id="writeTextarea" cols="30" rows="10" onclick="clearTextarea()" oninput="writeLength(this, 150)" style="text-align: left;">${dto.board_Content}</textarea>
	                            </td>
	                        </tr>
	                        
	                    </table>
	                
	                	<hr id="blackline">
	                    <div style="display: flex; justify-content: right; margin-bottom: 50px;">
	                        <div id="writebutton">
	                        	<input type="hidden" name="hidden_Id" value="로그인된 아이디">
	                        	<input type="hidden" name="board_No" value="${dto.board_No}">
	                        	<input type="submit" id="btnEdit" value="등록" >
	                        	<input type="button" value="취소" onclick="location.href='dreamsBoardDetail.bc?board_No='+${dto.board_No}">
	                        </div>
	                    </div>

					<!-- 우측메뉴 종료 -->
                </div>
            </div>
        </form>    
        
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