<%@page import="kr.co.Kjw.dao.ArticleDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String seq = request.getParameter("seq");
	String group = request.getParameter("group");
	String cate = request.getParameter("cate");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	ArticleDao.getInstance().updateArticle(title, content, seq);
	
	response.sendRedirect("/Kjw//board/view.jsp?seq="+seq+"&group="+group+"&cate="+cate);
%>