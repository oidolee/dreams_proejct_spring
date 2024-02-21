<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<!-- 페이지 작업자 : 윤석무 -->
<head>    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>비밀번호찾기-인증페이지</title>
    <!-- reset.css -->
    <link rel="stylesheet" href="${path}/resources/css/common/reset.css">
    <!-- Bootstrap css-->
    <link href="${path}/resources/css/bootstrap/bootstrap.css" rel="stylesheet" />
    <!-- swiper css-->
    <link rel="stylesheet" href="${path}/resources/css/common/common.css">
    <link rel="stylesheet" href="${path}/resources/css/common/header.css">
    <link rel="stylesheet" href="${path}/resources/css/common/footer.css">
    <link rel="stylesheet" href="${path}/resources/css/index.css">
    <link rel="stylesheet" href="${path}/resources/css/customer/join.css">
    

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

	<style>
		.container-box {
			padding: 0;
		}
	
		input:focus {
			outline: none;
		}
	
		.slider-con img {
			width: 100%;
		}
	
		.center {
			max-width: 1240px;
			margin: 0 auto;
		}
	
		.section-1-con {
			height: 440px;
		}
	
		.section-1 {
			height: 100%;
		}
	
		.section-1-top h2 {
			text-align: center;
		}
	
		.section-1-top h2 a {
			color: #000 !important;
		}
	
		.section-1-bottom ul {
			display: flex;
			justify-content: space-between;
			align-items: center;
			padding-top: 40px;
			padding-left: 0;
		}
	
	
		.here {
			color: #000  !important;
		}
	
	    .select_id1 {
	        margin-left: 180px;
	        margin-bottom: 25px;
	
	    }
	
	    .select_id2 {
	        position: relative;
	        border-bottom: 2px solid #e5e5e5;
	        padding-top: 80px;
	        width: 82.3%;
	    }
	
	    
	    .select_id2::before {
	    content: "";
	    position: absolute;
	    top: 0;
	    left: 0;
	    height: 102%;
	    width: 14.7%;
	    border-bottom: 2px solid #000;
	    box-sizing: border-box;
	
	    }
	    
	    .select_9 {
	        
	        display: flex;
	        justify-content: left;
	        align-items: left;
	        text-align: left;
	    }
	
	    .box6 {
	        margin: 0 auto;
	        align-items: center;
	        width: 70%;
	        padding: 39px 40px 20px;
	        border: 1px solid #e5e5e5;
	    }
	
	    .box_sub {
	        font-size: 14px;
	        display: block;
	        line-height: 18px;
	        padding-top: 1px;
	        padding-left: 17px;
	        color: #666;
	    }
	
	    ul {
	        padding: 0;
	        display: flex;
	        align-content: center;
	    }
	
	    li {
	        margin-right: 2px;
	        letter-spacing: -1px;
	    }
	
	    select {
	        width: auto;
	    }
	
	    .label_rd {
	        font-size: 17px;
	        font-weight: 700;
	        line-height: 18px;
	        margin-left: -2px;
	        letter-spacing: -1px;
	        color: #333;
	    }
	
	    .dsc {
	        line-height: 18px;
	        padding-top: 4px;
	    }
	
	    .box_selected2 {
	        border-top: 1px solid #e5e5e5;
	        padding-top: 25px;
	    }
	    
	    .box_selected3 {
	    	text-align: center;
	    }
	
	    .sel_value select {
	        width: 70px;
	    }
	
	    #lnb {
	        display: block;
	    }
	
	    .lnb {
	        position: relative;
	        margin: 0 auto;
	    }
	
	    .lnb .m5 {
	        left: -76px;
	        height: 57px;
	        background-position: 0 -567px;
	    }
	
	    .lnb li {
	        position: absolute;
	        top: 0;
	        width: 254px;
	    }
	</style>


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
        
        
 		<!-- 클릭하면 열리고 닫히는 기능 -->
         document.addEventListener("DOMContentLoaded", function () {
                var phoneRadio = document.getElementById("r_pn1");
                var emailRadio = document.getElementById("r_pn2");
                var phoneAuthentication = document.getElementById("phoneAuthentication");
                var emailAuthentication = document.getElementById("emailAuthentication");
                var membershipInfoSpan = document.getElementById("membership-info"); // 본인명의 휴대전화로 인증 시 색상 변경 대상
                
                phoneRadio.addEventListener("change", function () {
                    if (phoneRadio.checked) {
                        emailRadio.checked = false;
                        phoneAuthentication.style.display = "block";
                        emailAuthentication.style.display = "none";
                        membershipInfoSpan.style.color = "#000";	// 회원정보에 등록한 휴대전화로 인증시 색상 블랙
                    }
                });
        
                emailRadio.addEventListener("change", function () {
                    if (emailRadio.checked) {
                        phoneRadio.checked = false;
                        phoneAuthentication.style.display = "none";
                        emailAuthentication.style.display = "block";
                    }
                });
            });
            
            function change_color() {
                var membershipInfoSpan = document.getElementById("membership-info"); // 본인명의 휴대전화로 인증 시 색상 변경 대상
                if (membershipInfoSpan) {
                    membershipInfoSpan.style.color = "#0e9100"; // 색상 변경
                }
            }
        
    </script>
</head>
<div class="wrap">
  
    <body>
    	<%@ include file="../layout/header.jsp"%> 
      
      	<div class="slider-con">
			<div class="slider-box">
				<img src="${path}/resources/image/banner/드림즈_포토샵.jpg">
			</div>
		</div>
		
		<!-- 컨텐츠 시작 -->
		<div id="container">
			<div id="contents">
                <div class="select_id1">
                    <div class="select_id2">
                        <h4 style="font-weight: bold; color: #333 !important; letter-spacing: -1px;">비밀번호 찾기</h4>
                    </div>
                    <div style="font-size: 14px; color: #000 !important; margin-top: 10px; letter-spacing: -1px;">
                        <td>비밀번호 찾는 방법을 선택해 주세요.</td>
                    </div>
                </div>
                <div class="select_9">
                    <div class="box6" style="margin-bottom: 25px;">
                        <!-- 휴대전화로 인증 -->
                        <div id="div_phone" class="box_selected">
                            <input type="radio" id="r_pn1" class="input_rd" name="authenticationMethod" checked>
                            <label for="r_pn1" class="label_rd" style="color: #333 !important"> 회원정보에 등록한 휴대전화로 인증 </label>
                            <div class="box_sub" id="phoneAuthentication">
                                <!-- 휴대전화로 인증 내용 -->
                                <p class="dsc" style="letter-spacing: -1px; color: #666 !important" >회원정보에 등록한 휴대전화 번호와 입력한 휴대전화 번호가 같아야, 인증번호를 받을 수 있습니다.</p>
                                <div>
                                    <ul>
                                        <li style="margin-bottom: 8px;margin-top: 17px;">
                                            <label for="phoneNm" class="label_txt" style="color: #333 !important; padding-right: 50px; font-weight: 700 !important">이름</label>
                                            <input type="text" id="phoneNm" name="phoneNm" maxlength="40" class="input_txt" style="margin-left: -2px; width: 202px;">
                                        </li>
                                    </ul>
                                </div>
                                <div class="phoneInfo" >
                                    <ul style="margin-bottom: 6px">
                                        <li>
                                            <label for="t_ph1" class="label_txt" style= "color: #333 !important; padding-right: 24px; font-weight: 700 !important">휴대전화</label>
                                        </li>
                                        <li>
                                            <div class="sel_value"  style="color:#000 !important; font-size: 13px;">
                                                <select>
                                                    <option value="82">+82</option>
                                                </select>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="int_mod" style="margin: 0 5px 0 5px;">
                                                <input type="text" id="phoneNo" name="phoneNo" class="input_txt" placeholder="휴대전화번호" style="padding-left: 3px; color:#000 !important; font-size: 13px; width: 122.6px;">
                                            </div>
                                        </li>
                                        <li>
                                            <input type="button" id="certify" name="certify" value="인증번호 받기" style="padding-right: 4px; letter-spacing: -1px; font-weight: bold; font-size: 13.5px; width: 98px; color: #000 !important;">
                                        </li>
                                    </ul>
                                    <ul>
                                        <li>
                                            <input type="text" id="phoneNq" name="phoneNq" maxlength="40" class="input_txt" placeholder="인증번호 6자리 숫자 입력" style="padding-left: 3px; letter-spacing: -1px; margin-left: 78px; width: 202px; font-size: 13px; background: #f7f7f7; border: 1px solid; height: 22px;">
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- 이메일로 인증 --> 
                        <div id="div_email" class="box_selected2" style="margin-top: 30px; margin-bottom: 25px;">
                            <div style="padding-bottom: 17px; padding-top: 17px;">
                            	<strong style="letter-spacing: -0.5px; color: #000000 !important;">등록한 회원정보로 찾기 어려우시면, 본인 확인 후 비밀번호를 찾아드립니다.</strong>
                            </div>
                            <input type="radio" id="r_pn2" class="input_rd" name="authenticationMethod" onchange="change_color()">
                            <label for="r_pn2" class="label_rd" style="color: #333 !important">본인 명의 휴대전화로 인증</label> <span id="membership-info" style="color: #000 !important">(본인 주민등록번호로 가입된 휴대전화)</span>
                            <!-- 이메일로 인증 내용 -->
                            <div class="box_sub" id="emailAuthentication" style="display: none;">
                                <p class="dsc" style="letter-spacing: -1px; color: #000 !important">내 명의(주민등록번호)의 휴대전화로 비밀번호를 재설정 할 수 있습니다.</p>
                            </div> 
                        </div>
                        
                    </div>
                </div>
                
	            <div class="box_selected3">
					<td style="padding-top: 19px;">
						<input class="input" type="submit" value="다음" style="margin-bottom:-5px; padding: 5px 20px; border: none; background-color: rgb(33 113 98); font-size: 18px; font-weight: 550; color: #fff !important;">
					</td>
	            </div>   
	            
			</div>
		</div>
		<!-- 컨텐츠 끝 -->
     
      	<section class="section-1-con">
            <div class="section-1 center">
                <div class="section-1-top">
                    <h2><a href="#">드림즈 바로가기</a></h2>
                </div>
                <div class="section-1-bottom">
                    <ul>
                        <li><a href="${path}/WEB-INF/views/page_2/ticketFee.jsp"><img src="${path}/resources/image/main/dreams_char.png"
                                    alt=""></a></li>
                        <li><a href="https://www.instagram.com/explore/tags/%EC%8A%A4%ED%86%A0%EB%B8%8C%EB%A6%AC%EA%B7%B8/top/"><img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/index/btn_link_toolbar_item2.png"
                                    alt=""></a></li>
                        <li><a href="${path}/WEB-INF/views/page_6/stadium.jsp"><img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/index/btn_link_toolbar_item3.png"
                                    alt=""></a></li>
                    </ul>
                </div>
            </div>
        </section>
     
		<%@ include file="../layout/footer.jsp"%>
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