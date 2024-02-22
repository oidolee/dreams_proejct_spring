<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- <jstl> -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 컨텍스트 플젝명(jsp_pj_ict02) path 설정 -->

<%-- <c:set var="path" value="jsp_pj_ict02" /> --%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<script type="text/javascript"  src="http://code.jquery.com/jquery-3.7.1.min.js" ></script>  
<!--  따로 닫는다. -->