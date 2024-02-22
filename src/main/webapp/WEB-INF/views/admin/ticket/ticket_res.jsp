<%@page import="pj.mvc.dreams_project2.dto.TicketResDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/setting.jsp" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>드림즈 관리자</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="${path }/resources/admin/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <!-- chartJs -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
    <script>
<%-- let member = {};
    
    <%
				
    			List<TicketDTO> list = (List<TicketDTO>)request.getAttribute("list");	
    			for(TicketDTO tdto : list){
    %>
    				member['<%= tdto.getTicket_seat() %>'] = {
    					'bgNormalPrice' : '<%= tdto.getTicket_grade_normal() %>',	
    					'bgMPrice' : '<%= tdto.getTicket_grade_membership() %>',	
    					'bgCPrice' : '<%= tdto.getTicket_grade_child() %>',	
    				}
    <%				
    			}
    %>
    function calculator(){
        let parkseat =  document.getElementById("parkseat").value; // 좌석 등급
//      let bgNormalPrice = document.getElementById("bgNormalPrice").value; // 일반등급 좌석
        let bgNormalPrice = member[parkseat]['bgNormalPrice']; // 일반등급 좌석
        let bgMPrice = member[parkseat]['bgMPrice'];	// 멤버쉽 등급 가격
        let bgCPrice = member[parkseat]['bgCPrice']; 	// 어린이 등급 가격
        
        /* let bgNCnt = parseInt(document.getElementById("bgnCnt").value);
        let bgMCnt = parseInt(document.getElementById("bgmCnt").value);
        let bgCCnt = parseInt(document.getElementById("bgcCnt").value);
        let discount = 0; // 할인율 */
		

        document.getElementById('bgNormalPrice').textContent = bgNormalPrice.toLocaleString() + '원';
        document.getElementById('bgMPrice').textContent = bgMPrice.toLocaleString() + '원';
        document.getElementById('bgCPrice').textContent = bgCPrice.toLocaleString() + '원'; --%>
    };
    </script>
     <script>
        /* function priceSelect(){
            calculator()
            // let getIdx = $("#parkseat").val();
            // let priceArr = [
            //     [100,200,300],
            //     [400,500,600],
            //     [100,200,300]
            // ]

            // let normalPrice = priceArr[getIdx][0];
            // $("#bgNormalPrice").html(priceArr[1][1])
            // // priceArr[1][1]
        }  */
        
    </script>
    <style>
        .tableContent .displayNone {
            display: none !important;
        }

        .tableContent .pageBox,
        .tableContent .pageCon {
            display: flex;
        }

        .chartCon {
            display: flex;
            justify-content: center;
            overflow-x: auto;
        }

    .floating-box {
        width: 50px;
        height: 50px;
        background: url("../../image/logoSmall.png") no-repeat 50% 50%;
        background-size: 110px;
        position: fixed;
        bottom: 10px;
        left: 250px;
        border-radius: 5px;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #fff;
        font-weight: bold;
        cursor: pointer;
        animation: floatUpDown 1s infinite alternate;
        transition: transform 0.3s;
        z-index: 10000;
    }

    .floating-box:hover {
        transform: translateY(-5px);
    }

    .floating-box::before {
        content: "드림즈 메인";
        white-space: pre-line;
        position: absolute;
        width: 58px;
        text-align: center;
        top: -50px;
        left: 50%;
        transform: translateX(-50%);
        background-color: #1c5c50;
        color: #fff;
        padding: 5px;
        border-radius: 3px;
        font-size: 12px;
        opacity: 0;
        transition: opacity 1s ease-in-out;
    }

    .floating-box:hover::before {
        opacity: 1;
    }

    @keyframes floatUpDown {
        from {
            transform: translateY(0);
        }

        to {
            transform: translateY(10px);
        }
    }
    
    #ticketIns{
    	width: 960px;
    }
    #ticketIns td{
    	border: 1px solid black;
    }
    </style>

    <script>
        //왼쪽 페이지 이동
        function moveChange(type){
            console.log(type)
            if(type == 1){
                window.location.href = "./member/member.jsp";
            }else if(type == 2){
                window.location.href = "./account/acocunt.jsp";
            }else if(type == 3){
                window.location.href = "./board/board.jsp";
            }else {
                window.location.href = "./ticket/ticket.jsp";
            }
        }
       
        $(function(){ // 티켓 가격 수정
        	$('#btnEdit').click(function(){
        		
        		/* alert('티켓 가격 수정');
        		let changePrice-normal = $("#changePrice-normal").val();
    			let changePrice-membership = $("#changePrice-membership").val();
    			let changePrice-child = $("#changePrice-child").val();
    			
    			if(changePrice-normal == ""){
    				alert("일반 가격을 입력하시오.");
    				$("#changePrice-normal").focus();
    				return false;
    			}
    			
    			else if(changePrice-membership == ""){
    				alert("멤버쉽 가격을 입력하시오");
    				$("#changePrice-membership").focus();
    				return false;
    			}
    			
    			else if(changePrice-child == ""){
    				alert("어린이 가격을 입력하시오");
    				$("#changePrice-child").focus();
    				return false;
    			} */
    			
    			alert("티켓 가격 수정 - btnEdit");
    			document.ticket_updateForm.action="${path}/updateTicket.tc"; 
    			document.ticket_updateForm.submit();
        		
        	});
        	
        	// 게시글 삭제 화면으로 이동
    		$("#btnDelete").click(function(){
    			
    			if(confirm("삭제하시겠습니까?")){
    				document.ticket_updateForm.action="${path}/deleteTicket.tc";
    				document.ticket_updateForm.submit();
    			}
    		});
        });
        
    </script>

    
</head>
<body class="sb-nav-fixed">

	<%@ include file="../templet/header.jsp" %>
	<div id="layoutSidenav">
        <div id="layoutSidenav_nav">
        	<%@ include file="../templet/nav.jsp" %>
            <a href="../index.html">
                <div class="floating-box"></div>
            </a>
        </div>
        <div id="layoutSidenav_content">
            <main>
             	<div class="purchase">
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-table me-1"></i>
                            티켓 구매 목록
                        </div>

                        <div class="tableContent">
                            <input type="hidden" id="nowPage" name="nowPage" value="1">
                            <input type="hidden" id="startNum" name="startNum" value="1">
                            <input type="hidden" id="endNum" name="endNum" value="15">
                            <table id="table" class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">티켓 번호</th>
                                        <th scope="col">아이디</th>
                                        <th scope="col">좌석</th>
                                        <th scope="col">가격</th>
                                        <th scope="col">구매날짜</th>
                                        <th scope="col">상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach var="trdto" items="${list}">
	                                    <tr onclick="goToDetails('${trdto.ticket_no}', '${trdto.cust_Id}', '${trdto.ticket_seat}', '${trdto.purchase_date}')">
	                                   
	                                        <td>${trdto.ticket_no}</td>
	                                        <input type="hidden" name="ticket_no" value="${trdto.ticket_no}">                                        
	                                        <td>${trdto.cust_Id}</td>
	                                        <td>${trdto.ticket_seat}</td>
	                                        <td>${trdto.ticket_price}</td>
	                                        <td>${trdto.purchase_date}</td>
	                                        <td>
	                                        	<c:if test="${trdto.show == 'y' }">
	                                        		예매
	                                        	</c:if>
	                                        	<c:if test="${trdto.show == 'n' }">
	                                        		예매 취소
	                                        	</c:if>
	                                        </td>
	                                    </tr>
                                    </c:forEach>
                                </tbody>
                                <tr>
									<td colspan="5" align="center">
										<!-- 페이징 처리 -->
										<!-- 이전 버튼 활성화 -->
										<c:if test="${paging.startPage > 10}">
											<a href="${path }/ResAdminCheck.tc?pageNum=${paging.prev}">[이전]</a>
										</c:if>
										<!-- 페이지 번호 처리 -->
										<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
											<a href="${path }/ResAdminCheck.tc?pageNum=${num}">${num}</a>
										</c:forEach>
										
										<!-- 다음 버튼 활성화 -->
										<c:if test="${paging.endPage < paging.pageCount}">
											<a href="${path }/ResAdminCheck.tc?pageNum=${paging.next}">[다음]</a>
										</c:if>
									</td>
								</tr>
                            </table>

                        </div>
                    </div>
                </div>
            </main>
            <footer class="py-4 bg-light mt-auto">
                <div class="container-fluid px-4">
                    <div class="d-flex align-items-center justify-content-between small">
                        <div class="text-muted">Copyright &copy; 드림즈 관리자 </div>
                    </div>
                </div>
            </footer>
        </div>
    </div>
     	
	
	

 	<!-- ticket.js -->
    <script src="${path}/resources/admin/js/ticket.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
    <script src="../js/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="${path}/resources/admin/assets/demo/chart-area-demo.js"></script>
    <script src="${path}/resources/admin/assets/demo/chart-bar-demo.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
        crossorigin="anonymous"></script>
    <script src="../js/datatables-simple-demo.js"></script>
    <!-- 드림즈 테이블, chartJs -->
    <script src="../js/admin.js"></script>
</body>

</html>