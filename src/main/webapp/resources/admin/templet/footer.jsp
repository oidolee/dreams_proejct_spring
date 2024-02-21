<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/layout/setting.jsp" %>
<style>
   .floating-box {
        background: url("${path}/resource/image/logoSmall.png") no-repeat 50% 50%;
        width: 50px;
        height: 50px;
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
</style>
<footer class="py-4 bg-light mt-auto">
    <div class="container-fluid px-4">
        <div class="d-flex align-items-center justify-content-between small" style="margin-left: 55px;">
            <div class="text-muted">Copyright &copy; 드림즈 관리자 </div>
        </div>
    </div>
</footer>