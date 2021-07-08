<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 세션제거
	session.invalidate();
	// index로 리다이렉트
	response.sendRedirect("/Kjw/");
%>