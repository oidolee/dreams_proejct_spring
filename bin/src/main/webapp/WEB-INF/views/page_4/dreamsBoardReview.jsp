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
    <title>드림즈게시판 댓글목록</title>
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

</head>
<body>

    <div>
        <div style="display: flex; justify-content: left;">
            <table id="reveiw" style="margin-bottom: 50px; width: 100%;">
                <tr  style="border-bottom: 2px solid gray;">
                    <td style="font-size: 15px;">
                        댓글 ${reviewCnt}
                    </td>                                    
                </tr>
                <c:forEach var="dto" items="${list}">
                <tr style="display: inline;">
                    <td style="width: 100px;">
                        ${dto.cust_Id}                                  
                    </td>
                    <td>
                        ${dto.review_date}
                    </td>
                    <td>
                        <button id="reportButton">신고</button>                                  
                    </td>
                    <c:if test="${sessionID == dto.cust_Id}"> <!-- 세션아이디가 댓글 등록자와 같으면 삭제 버튼 생성 -->
	                    <td>
	                	 	<input type="button" name="reviewDelete" id="reviewDelete" value="삭제" onclick="location.href='dreamsBoardReview_delete.bc?review_No=${dto.review_No}&board_No=${dto.board_No}'">
	                	</td>
                	</c:if>
                </tr>
                <tr style="border-bottom: 1px solid gray;">
                    <td style="color: rgb(110, 107, 107) !important;">
                        ${dto.review_Content}                                 
                    </td>
                </tr>
                </c:forEach>
            </table>
        </div>
        <div class="pageNav">
	                	<!-- 이전 버튼 활성화 -->
	                	<c:if test="${paging.startPage > 10}">
	                    <span class="prev1">
	                        <a href="${path}/dreamsBoardDetail.bc?board_No=${param.board_No}&pageNum=${paging.prev}" style="color: white !important; padding: 5px 5px 5px 5px; margin-right: 10px;">
	                            <span style="color: white !important;">< 이전</span>
	                        </a>
	                    </span>
	                    </c:if>
	                    
	                    <!-- 이전 버튼 활성화 -->
	                    <c:if test="${reviewCnt != 0}">
	                    <c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
	                    	<c:if test="${paging.currentPage == num}">
			                    <span class="page">
			                        <a href="${path}/dreamsBoardDetail.bc?board_No=${param.board_No}&pageNum=${num}" class="on" >${num}</a>
			                    </span>
			                </c:if>
	                    	<c:if test="${paging.currentPage != num}">
			                    <span class="page1">
			                        <a href="${path}/dreamsBoardDetail.bc?board_No=${param.board_No}&pageNum=${num}" class="on">${num}</a>
			                    </span>
			                </c:if>
	                    </c:forEach>
	                    </c:if>
	                    <!-- 다음 버튼 활성화 -->
	                    <c:if test="${paging.endPage < paging.pageCount}">
	                    <span class="next1">
	                        <a href="${path}/dreamsBoardDetail.bc?board_No=${param.board_No}&pageNum=${paging.next}" style="color: white !important; padding: 5px 5px 5px 5px; margin-left: 10px;">
	                            <span style="color: white !important;">다음 ></span>
	                        </a>
	                    </span>
	                    </c:if>
	                </div>

    </div>

</body>

</html>