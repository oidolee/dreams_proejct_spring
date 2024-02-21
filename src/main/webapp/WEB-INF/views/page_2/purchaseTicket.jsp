<%@page import="pj.mvc.dreams_project2.dto.TicketDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/setting.jsp" %>
<!DOCTYPE html>
<%
	String game_date = request.getParameter("game_date");

%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>티켓 결제</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script type="text/javascript">
    let member = {};
    
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
    <%
    	String game_date_1 = request.getParameter("game_date");

	 %>
         function selectEmailChk() {
            // select 박스에서 이메일 주소를 선택시 해당값이 들어가도록 한다.
            if(document.signIn.email3.value == 0) {  // 직접입력인 경우
                document.signIn.email2.value = "";
                document.signIn.email2.focus();
                return false;
            }
            else {
                document.signIn.email2.value = document.signIn.email3.value;
                return false;
            }
        }
        
        function calculator(){
            let parkseat =  document.getElementById("parkseat").value; // 좌석 등급
//            let bgNormalPrice = document.getElementById("bgNormalPrice").value; // 일반등급 좌석
            let bgNormalPrice = member[parkseat]['bgNormalPrice']; // 일반등급 좌석
            let bgMPrice = member[parkseat]['bgMPrice'];	// 멤버쉽 등급 가격
            let bgCPrice = member[parkseat]['bgCPrice']; 	// 어린이 등급 가격
            
            let bgNCnt = parseInt(document.getElementById("bgnCnt").value);
            let bgMCnt = parseInt(document.getElementById("bgmCnt").value);
            let bgCCnt = parseInt(document.getElementById("bgcCnt").value);
            let discount = 0; // 할인율
            
            console.log(member[parkseat]);
           //$("#bgNormalPrice").html(member[parkseat][bgCPrice])
			
             // 좌석에 따른 가격
            /* switch(parkseat){
                case "R.d club": 
                	bgNormalPrice ;
                    bgMPrice ;
                    bgCPrice ;
                break;
                case "1층 테이블석": bgNormalPrice  ;
                                bgMPrice ;
                                bgCPrice ;
                break;
                case "2층 테이블석": bgNormalPrice ;
                                bgMPrice = 50000;
                                bgCPrice = 50000;
                break;
                case "내야커플석": bgNormalPrice = 30000;
                                bgMPrice = 30000;
                                bgCPrice = 30000;
                break;
                case "외야커플석": bgNormalPrice = 17000;
                                bgMPrice = 17000;
                                bgCPrice = 17000;
                break;
                case "다크버건디석": bgNormalPrice = 17000;
                                bgMPrice = 17000;
                                bgCPrice = 8000;
                break;
                case "버건디석": bgNormalPrice = 15000;
                                bgMPrice = 	15000
                                bgCPrice = 7000;
                break;
                case "3층 지정석": bgNormalPrice = 12000;
                                bgMPrice = 12000;
                                bgCPrice = 6000;
                break;
                case "4층 지정석": bgNormalPrice = 9000,
                                bgMPrice = 9000;
                                bgCPrice = 7000;
                break;
                case "휠체어석": bgNormalPrice = 10000;
                                bgMPrice = 50000;
                                bgCPrice = 50000;
                break;
                case "외야 지정석": bgNormalPrice = 9000;
                                bgMPrice = 9000;
                                bgCPrice = 4000;
                break;
                case "외야 패밀리석 5인": bgNormalPrice = 100000;
                                bgMPrice = 100000;
                                bgCPrice = 100000;
                break;
                case "외야 패밀리석 4인": bgNormalPrice = 80000;
                                bgMPrice = 80000;
                                bgCPrice = 80000;
                break;
                case "외야 유아동반석 2인": bgNormalPrice = 40000;
                                bgMPrice = 40000;
                                bgCPrice = 40000;
                break;
                
            }
             */
            
			
            let totalCnt = (bgNCnt + bgMCnt + bgCCnt);
            let totalprice = ((bgNormalPrice*bgNCnt) + (bgMPrice*bgMCnt) + (bgCPrice*bgCCnt));
            
            let finalTotalprice = (totalprice - discount);

            
            document.getElementById('bgNormalPrice').textContent = bgNormalPrice.toLocaleString() + '원';
            document.getElementById('bgMPrice').textContent = bgMPrice.toLocaleString() + '원';
            document.getElementById('bgCPrice').textContent = bgCPrice.toLocaleString() + '원';
            document.getElementById('totalCnt').textContent = totalCnt.toLocaleString();
            document.getElementById('totalprice').textContent = totalprice.toLocaleString() + '원';
            document.getElementById('finalTotalprice').textContent = finalTotalprice.toLocaleString() + '원'; 
            
            document.getElementById('totalprice').value = totalprice;
            
        }
        

         $(function(){
	        $("#sign_In").submit(function(){
                if($("#result").length == 0){
                    $("#sign_In").append("<div id='result'> 입력완료 </div>");
                }
                
                // 1. validation check
                // 아이디 입력 확인
                if(!$("#user_name").val()){
                    $("#result").html("이름을 입력하시오");
                    $("#user_name").focus();
                    return false; // 다음칸으로 내려가는 동작 중지
                }
                
                // 생년월일 입력 확인
                if(!$("#user_birthday").val()){
                    $("#result").html("생년월일을 선택하시오");
                    $("#user_birthday").focus();
                    return false;
                }
                // 연락처 입력 확인
                if(!$("#user_hp").val()){
                    $("#result").html("연락처를 입력하시오");
                    $("#user_hp").focus();
                    return false;
                }
                
                
                // 이메일 입력 확인
                if(!$("#email1").val() || !$("#email2").val()){
                    $("#result").html("이메일을 입력하시오");
                    $("#email1").focus();
                    return false;
                }
                $("#result").html("입력완료");
		        return false; // 반드시 있어야 정상작동한다.!!!!!!
	        }); //.submit() => submit버튼을 눌렀을 때
	   
	        $('#payTicket').click(function(){
        		let param={"totalPrice" : $('#totalprice').val(),
        					"game_date" : $('#game_date').val(),
        					"parkseat" : $('#parkseat').val(),
        		}
        		
        		if(!$("#user_name").val() || !$("#user_birthday").val() || !$("#user_hp").val() || !$("#email1").val() || !$("#email2").val()){
                    alert("예매자 확인을 해주세요!")
                    $("#user_name").focus();
                    return false; // 다음칸으로 내려가는 동작 중지
                }
        		else{
	        		$.ajax({
	        			url: '${path}/ticketRes.tc',
	        			type: 'GET',
	        			dataType:"text",
	        			//data: {param : param},	// setAttribute {key : value}
	        			data: param ,	
	        			success: function(result){ // 6. 콜백 함수
	        				alert("결제가 완료되었습니다.");
	        		        window.opener.location.href = '${path}/myTicket.tc';
	        				window.close();
	        			},
	        			error: function(){
	        				alert('오류');
	        			}
	        		});
        		}
        	});
        });
       /*  function openNewWindow() {
            // 1. validation check
            // 아이디 입력 확인
            if(!$("#user_name").val() || !$("#user_birthday").val() || !$("#user_hp").val() || !$("#email1").val() || !$("#email2").val()){
                alert("예매자 확인을 해주세요!")
                $("#user_name").focus();
                return false; // 다음칸으로 내려가는 동작 중지
            }
            else{
            	$.ajax({
        			url: '${path}/ticketRes.tc',	// 3. 컨트롤러 basic5_next.jq 호출
        			type: 'get',
        			dataType:"json",
        			data: {param : param},	// setAttribute {key : value}
        			data: param ,	// setAttribute {key : value}
        			success: function(result){ // 6. 콜백 함수
        				alert("결제가 완료되었습니다.");
        				window.close();
        			},
        			error: function(){
        				alert('오류');
        			}
        		});
                return false;                        
            }
        } */
 
        
        /* $(function(){
        	$("#parkseat").change(function(){
        		document.parkseat.action="${path}/purchaseTicketPrice.tc?parkseat=" + $("#parkseat").val();
				document.parkseat.submit();
    		});
        	
        }); */
        
        
    	/* $(function(){ // 티켓 페이지 로딩
    		
    		$("#srch_button").click(function(){
    			
    			$("#parkseat").val();
    			
    			document.ticketForm.action="${path}/purchaseTicket.tc"; 
    			document.ticketForm.submit(); 
    			
    		});
    	}); */

    	function closeWindow() {
            window.close();
        }
    </script>
    
    <style>
        .purchase{
            display: flex;
            background: white;
        }
        .purchase elements{
            display: block;
            border: 1px;
            height: 498px;
        }
        table{
            border-collapse: collapse;
        
        }
        
    </style>
</head>
<body style="background: #1c5c50;">
	 
    <div class="purchase">
        <div class="elements">
            <h3>가격</h3>
            <form name = "ticketForm" method="post" action="ticketRes.tc">
			<table border="1" style="width: 416.55px;">
				<tr>
					<td colspan="4">
						<strong>좌석</strong>
						<select id="parkseat" name="parkseat" onchange="priceSelect()">
						
		                    <option value="#">좌석을 선택해 주세요.</option>
						<% 
							/* List<TicketDTO> list = (List<TicketDTO>)request.getAttribute("list"); */	
							for(TicketDTO tdto : list){
						%>
							<!-- html -->
							 <option value="<%= tdto.getTicket_seat() %>"><%= tdto.getTicket_seat() %></option> 
						<%		
								
							}
						
						%>
		                    <!-- <option value="R.d club">R.d club</option>
		                    <option value="1층 테이블석">1층 테이블석</option>
		                    <option value="2층 테이블석">2층 테이블석</option>
		                    <option value="내야커플석">내야커플석</option>
		                    <option value="외야커플석">외야커플석</option>
		                    <option value="다크버건디석">다크버건디석</option>
		                    <option value="버건디석">버건디석</option>
		                    <option value="3층 지정석">3층 지정석</option>
		                    <option value="4층 지정석">4층 지정석</option>
		                    <option value="휠체어석">휠체어석</option>
		                    <option value="외야 지정석">외야 지정석</option>
		                    <option value="외야 패밀리석 4인">외야 패밀리석 4인</option>
		                    <option value="외야 패밀리석 5인">외야 패밀리석 5인</option>
		                    <option value="외야 유아동반석 2인">외야 유아동반석 2인</option> -->
	                	</select>
	                	
					</td>
					
	              </tr>
	            
            
                <tr id="normal-price">
                    <td style="background: whitesmoke;">기본가</td>
                    <td>일반</td>
                    <td id="bgNormalPrice" >${tdto.ticket_grade_normal}</td>
                    <td><input id="bgnCnt" type="number" style="width: 25px;" value="0" min="0" max="5" oninput="calculator()">매</td>
                </tr>
                <tr>
                    <td rowspan="2" style="background: whitesmoke;">기본할인</td>
                    <td>멤버쉽</td>
                    <td id="bgMPrice">${tdto.ticket_grade_membership}</td>
                    <td><input id="bgmCnt" type="number" style="width: 25px;" value="0"  min="0" max="5" oninput="calculator()">매</td>
                </tr>
                <tr>
                    <td>듬린이</td>
                    <td id="bgCPrice">${tdto.ticket_grade_child }</td>
                    <td><input id="bgcCnt" type="number" style="width: 25px;" value="0"  min="0" max="5" oninput="calculator()">매</td>
                </tr>
            </table>
            <hr>
            
            </form>
            <hr>
            
            <h3>예매자 정보</h3>
            <form id="sign_In" name="signIn" action="#">
                <table>
                    <tr>
                        <td> 이름 </td>
                        <td><input id="user_name" type="text" size="30px" name="이름" value="${cdto.cust_Name }" ></td>
                    </tr>
                    <tr>
                        <td> 생년월일 </td>
                        <td><input id="user_birthday" type="date" value="${cdto.cust_Birth }"></td>
                    </tr>
                    <tr>
                        <td> 연락처 </td>
                        <td><input id="user_hp" type="text" size="30px"  value="${cdto.cust_Phone }" ></td>
                    </tr>
                    <tr>
                        <td> 이메일 </td>
                        <td>
	                        <c:set var="emailArr" value="${fn:split(cdto.getCust_Email(),'@') }"/>
								<input type="text" class="input" id="email1" name="email1" maxlength="20" style="width:100px" required value="${emailArr[0]}" required>
								@
								<input type="text" class="input" id="email2" name="email2" maxlength="20" style="width:100px" required value="${emailArr[1]} " required>
								<select class="input" id="email3" name="email3" style="width:100px" required onchange="selectEmailChk()">
									<option value="0">직접입력</option>
									<option value="naver.com">네이버</option>
									<option value="gmail.com">구글</option>
									<option value="daum.net">다음</option>
									<option value="nate.com">네이트</option>
								</select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                           <br><br>
                           <div align="center">
                              <input type="submit"  value="확인"  class="myButton">
                              <input type="reset"  value="취소"  class="myButton">
                           </div>
                        </td>
                     </tr>
                </table>
            </form>
            
            <hr>
            <h6>결제방식</h6>
            <form name="radioForm" action="#" method="post"> <!-- radio 는 단 하나만 선택가능 -->
                <fieldset>
                    <table>
                        <tr>
                            <td><input type="radio" name="apply" id="ra_mu" value="무통장 입금" checked></td>
                            <td><label for="ra_sales"></label>무통장 입금</td>
                        </tr>
                        
                        <tr>
                            <td><input type="radio" name="apply" id="ra_card" value="카드"></td>
                            <td><label for="ra_card"></label>카드</td>
                            <td>
                                <select name="cardtype"  style="width:100px">
                                    <option value="shinhan">신한카드</option>
                                    <option value="kako">카카오</option>
                                    <option value="nh">농협</option>
                                    <option value="woori">우리카드</option>
                                    <option value="kb">국민카드</option>
                                </select>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </form>
            <hr>

        </div>
        <div class="elements" style="background-color: white; width: 432px; height: 400px; margin-left: 100px;" >
        <form name="resForm">
            <h3 style="background-color: white; margin-bottom: 0;"><img src="https://ticketimage.interpark.com/TicketImage/onestop/tit_buy.gif" alt="My예매정보"></h3>
            <table style="background: white; height: 400px;" border="1" >
                <colgroup>
                    <col width="32%">
                    <col width="68">
                </colgroup>
                <tbody>
                    <tr>
                        <th>일시</th>
                        <td>
                        	<input type="hidden" id="game_date" name="game_date" value="<%= game_date_1 %>:00">
                            <span id="game_date" name="game_date"  title="<%= game_date_1 %>"><%= game_date_1 %></span>
                        </td>
                    </tr>
                    <tr>
                        <th>선택좌석<br>(<span id="totalCnt" name="totalCnt">0</span>석)</th>
                        
                        <td class="seat">
                             <span id="parkseat" name="parkseat">석</span>
                        </td>
                    </tr>
                    <tr>
                        <th>티켓금액</th>
                        <td id="totalprice" name="totalprice">원</td>
                    </tr>
                    
                    <tr>
                        <th>배송료</th>
                        <td><div class="skip"><span id="MyDeliveryAmt" name="MyDeliveryAmt" title="0원 | 모바일티켓">0원 | 모바일티켓</span></div></td>
                    </tr>
                    <tr>
                        <th>할인</th>
                        <td><div class="skip"><span id="MyDiscount" name="MyDiscount" title=""></span></div></td>
                    </tr>
                    <tr class="total">
                        <th>총 결제금액</th>
                        <td id="finalTotalprice">0원</td>
                    </tr>
                    <tr style="border: 0 solid white;">
                        <td>
                        </td>
                        <td style="padding-right: 0;">
                            <div style="display: flex; justify-content: flex-end; background: white; " >
                                <div id="cancle" style="margin-right: 10px;">
                                    <input type="button" value="취소하기" onclick="closeWindow()">
                                </div>
                                <div id="payit">
                                    <input type="button" id="payTicket" value="결제하기" >
                                </div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
            </form>
        </div>
    </div>

    <script>
        function priceSelect(){
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
        } 
    </script>
</body>
</html>