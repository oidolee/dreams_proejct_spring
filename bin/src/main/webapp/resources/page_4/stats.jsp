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
    <title>팀순위</title>
    <!-- reset.css -->
    <link rel="stylesheet" href="./resource/css/common/reset.css">
    <!-- Bootstrap css-->
    <link href="${path}/resource/css/bootstrap/bootstrap.css" rel="stylesheet" />
    <!-- swiper css-->
    <link rel="stylesheet" href="${path}/resource/css/common/common.css">
    <link rel="stylesheet" href="${path}/resource/css/index.css">
    <link rel="stylesheet" href="${path}/resource/css/common/page4_stats.css">

    <!-- jQuery -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <!-- Bootstrap js -->
    <script src="${path}/resource/js/bootstrap/bootstrap.bundle.js"></script>
    <!-- swiper js-->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    <!-- scrollreveal -->
    <script src="https://unpkg.com/scrollreveal/dist/scrollreveal.min.js"></script>
    <!-- header.js -->
    <script src="${path}/resource/js/common/header.js"></script>

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
                <img src="${path}/resource/image/banner/category_STATS.jpg" alt="">
            </div>
        </div>
        <!-- 상단 중앙1 시작 -->
				<div style="display: flex; justify-content: center;"class="board">
					
                    <!-- 좌측메뉴 시작 -->
					<div id="left">
                        <div class="left_inside">
                            <!-- 좌측메뉴바 시작 -->
							<ul class="left_menubar">
                                <li><h3 style="color: white !important;">Stats</h3></li>
								<li>
                                    <ul class="product_menu">
										<p></p>
										<li><a href="stats.jsp">팀순위</a></li>
									</ul>
								</li>	
							</ul>	
							<!-- 좌측메뉴바 종료 -->
						</div>
					</div>
					<!-- 좌측메뉴 종료 -->	

                    <!-- 우측메뉴 시작 -->
                        <div style="width: 800px;">
                            <h2 class="title"> 팀 순위 </h2>
                            <table class="stats">
                                <tr id="firstTr">
                                    <td>순위</td>
                                    <td>팀명</td>
                                    <td>경기</td>
                                    <td>승</td>
                                    <td>무</td>
                                    <td>패</td>
                                    <td>승률</td>
                                    <td>승차</td>
                                </tr>

                                <tr>
                                    <td class="firstTd">1</td>
                                    <td>빌라 세이버스</td>
                                    <td>144</td>
                                    <td>87</td>
                                    <td>1</td>
                                    <td>56</td>
                                    <td>0.608</td>
                                    <td>0.0</td>
                                </tr>
                                
                                <tr>
                                    <td class="firstTd">2</td>
                                    <td>HG 바이킹스</td>
                                    <td>144</td>
                                    <td>84</td>
                                    <td>3</td>
                                    <td>57</td>
                                    <td>0.594</td>
                                    <td>1.5</td>
                                </tr>

                                <tr>
                                    <td class="firstTd">3</td>
                                    <td>MG 펠리컨즈</td>
                                    <td>144</td>
                                    <td>80</td>
                                    <td>2</td>
                                    <td>62</td>
                                    <td>0.563</td>
                                    <td>6.5</td>
                                </tr>

                                <tr>
                                    <td class="firstTd">4</td>
                                    <td>태강 웨일스</td>
                                    <td>144</td>
                                    <td>79</td>
                                    <td>3</td>
                                    <td>62</td>
                                    <td>0.560</td>
                                    <td>7</td>
                                </tr>

                                <tr>
                                    <td class="firstTd">5</td>
                                    <td>바들 재규어스</td>
                                    <td>144</td>
                                    <td>74</td>
                                    <td>2</td>
                                    <td>68</td>
                                    <td>0.521</td>
                                    <td>12.5</td>
                                </tr>

                                <tr>
                                    <td class="firstTd">6</td>
                                    <td>엘레트리아 데블스</td>
                                    <td>144</td>
                                    <td>69</td>
                                    <td>3</td>
                                    <td>72</td>
                                    <td>0.489</td>
                                    <td>17</td>
                                </tr>

                                <tr>
                                    <td class="firstTd">7</td>
                                    <td>SV 타이탄스</td>
                                    <td>144</td>
                                    <td>69</td>
                                    <td>2</td>
                                    <td>73</td>
                                    <td>0.486</td>
                                    <td>17.5</td>
                                </tr>

                                <tr>
                                    <td class="firstTd">8</td>
                                    <td>TT블랙윙스</td>
                                    <td>144</td>
                                    <td>61</td>
                                    <td>2</td>
                                    <td>81</td>
                                    <td>0.430</td>
                                    <td>25.5</td>
                                </tr>

                                <tr>
                                    <td class="firstTd">9</td>
                                    <td>수성 레드호크스</td>
                                    <td>144</td>
                                    <td>54</td>
                                    <td>6</td>
                                    <td>84</td>
                                    <td>0.391</td>
                                    <td>30.5</td>
                                </tr>

                                <tr id="dreamsTd">
                                    <td class="firstTd">10</td>
                                    <td>재송 드림즈</td>
                                    <td>144</td>
                                    <td>43</td>
                                    <td>0</td>
                                    <td>101</td>
                                    <td>0.299</td>
                                    <td>44</td>
                                </tr>

                            </table>
                            
                        </div>
                    
                </div>  
     
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
    </body>
</div>

</html>