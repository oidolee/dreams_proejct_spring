<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/setting.jsp" %>

<!-- 작업자 : 윤석무 -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!-- 반응형 웹-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${path}/resources/css/customer/idConfirmAction.css">

    <script src="https://kit.fontawesome.com/48086a0d4e.js" crossorigin="anonymous"></script>
    <!-- (3-3-2). 자바스크립트 소스 추가 :  -->
    <!-- defer : 모든 html 파일을 로딩할때까지 html이 브라우저창에 표시가 안되는 것을 방지 -->
    <%--  <script src="${path}/resources/js/customer/main.js" defer></script> --%>
    
    <!-- join.js -->
    <script src="${path}/resources/js/customer/join.js"></script>
    
    <title>main</title>

</head>

<body onload="idConfirmFocus()">
    
    <div class="wrap">
  
        
        <!-- 컨텐츠 시작 -->
        <div id="container">
            <div id="contents">
                <!-- 상단 중앙1 시작 -->
                <div id="section1">
                    <h1 align="center"> 아이디 중복확인 </h1>
                </div>


                <!-- 상단 중앙2 시작 -->
                <div id="section2">
                    <div id="s2_inner">
                        <div class="join">
                            <form name="confirmform" action="idConfirmAction.cc" method="post" 
                            onsubmit="return idConfirmCheck()">
                          	
	                            <c:if test="${selectCnt == 1}"> <!-- id 중복일 때 -->
	                           		<table align="center" width="500px">
	                                    <tr>
	                                        <th colspan="2" align="center">
	                                        	<span> ${strUserid}는 사용할 수 없습니다.</span> 
	                                        </th>
	                                    </tr>
	                           
	                           			<tr>
	                                        <th align="center"> * 아이디 </th>
	                                        <td>
	                                            <input type="text" class="input" name="userid" id="userid" size="20" placeholder="공백없이 20자이내로 작성" required>    <!-- placeholder : 힌트 -->
	                                        </td>
	                                    </tr>
	                           
	                                    <tr>
	                                        <td colspan="2" style="border-bottom: none">
	                                            <br>
	                                            <div align="right">
	                                                <input class="inputButton" type="submit" value="확인">
	                                                <input class="inputButton" type="reset" value="취소" onclick="self.close()">
	                                            </div>
	                                        </td>
	                                    </tr>
	                                </table>	
	                            </c:if>	
	                            
	                            <c:if test="${selectCnt == -1}"> <!-- 탈퇴한 회원일 때 -->
	                           		<table align="center" width="500px">
	                                    <tr>
	                                        <th colspan="2" align="center">
	                                        	<span> ${strUserid}는 탈퇴한 회원입니다. <br>재가입을 원하실 경우에는 관리자에게 문의해 주세요.</span> 
	                                        </th>
	                                    </tr>
	                           
	                           			<tr>
	                                        <th align="center"> * 아이디 </th>
	                                        <td>
	                                            <input type="text" class="input" name="userid" size="20" placeholder="공백없이 20자이내로 작성" required>
	                                        </td>
	                                    </tr>
	                           
	                                    <tr>
	                                        <td colspan="2" style="border-bottom: none">
	                                            <br>
	                                            <div align="right">
	                                                <input class="inputButton" type="submit" value="확인">
	                                                <input class="inputButton" type="reset" value="취소" onclick="self.close()">
	                                            </div>
	                                        </td>
	                                    </tr>
	                                </table>	
	                            </c:if>	
                            
	                            <c:if test="${selectCnt == 0}"> <!-- id 중복이 아닐 때 -->	
	                          	  <table align="center" width="500px">
	                                    <tr>
	                                        <th colspan="2" align="center">
	                                        	<span> ${strUserid}는 사용할 수 있습니다. </span> 
	                                        </th>
	                                    </tr>
	                           
	                                    <tr>
	                                        <td colspan="2" style="border-bottom: none">
	                                            <br>
	                                            <div align="right">
	                                                <input class="inputButton" type="button" value="확인" onclick="setUserid('${strUserid}')">
	                                            </div>
	                                        </td>
	                                    </tr>
	                                </table>
	                            </c:if>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 컨텐츠 끝 -->
    </div>
</body>
</html>