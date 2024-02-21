<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../../../WEB-INF/views/layout/setting.jsp" %>  
<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
    <div class="sb-sidenav-menu">
        <div class="nav">
            <div class="sb-sidenav-menu-heading">HOME</div>
            <a class="nav-link" href="${path}/admin.gc">
                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                메인
            </a>
            <div class="sb-sidenav-menu-heading">LIST</div>
            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                관리목록
                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
            </a>
            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne"
                data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link" href="${path}/admin_member.cc">회원</a>
                    <a class="nav-link" href="${path}/admin_board.bc">게시판</a>
                    <a class="nav-link" href="${path}/admin.tc">티켓</a>
                    <a class="nav-link" href="${path}/product_list.pc">상품</a>
                    <a class="nav-link" href="${path}/gamesInsert.gc">게임일정</a>
                </nav>
            </div>

            
        </div>
    </div>
    <div class="sb-sidenav-footer">
        <div class="small">Logged in as:</div>
        드림즈 관리자
    </div>
</nav>