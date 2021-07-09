<%@page import="kr.co.Kjw.bean.MemberBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	MemberBean mb = (MemberBean)session.getAttribute("sessMember");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Kjw-Board</title>
	<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css"/>
    <link rel="stylesheet" href="/Kjw/css/style.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

</head>
<body>
	<div id="wrapper">
        <header>
            <a href="/Kjw/index.jsp" class="logo"><img src="/Kjw/img/logo.png" alt="로고"/></a>
            <p>
            	<% if(mb == null){ %>
                <a href="/Kjw/index.jsp">HOME |</a>
                <a href="/Kjw/user/login.jsp">로그인 |</a>
                <a href="/Kjw/user/terms.jsp">회원가입 |</a>
                <% }else{ %>
                <span><%= mb.getNick() %>님 반갑습니다.</span>
                <a href="/Kjw/index.jsp">HOME |</a>
                <a href="/Kjw/user/proc/logout.jsp">로그아웃 |</a>
                <% } %>
                <a href="#">고객센터</a>
            </p>
            
            <img src="/Kjw/img/head_txt_img.png" alt="3만원 이상 무료배송"/>
            
            <ul class="gnb">
                <li><a href="#">팜스토리소개</a></li>
                <li><a href="/Kjw/board/list.jsp?group=market&cate=market"><img src="/Kjw/img/head_menu_badge.png" alt="30%"/>장보기</a></li>
                <li><a href="/Kjw/board/list.jsp?group=croptalk&cate=story">농작물이야기</a></li>
                <li><a href="/Kjw/board/list.jsp?group=event&cate=event">이벤트</a></li>
                <li><a href="/Kjw/board/list.jsp?group=community&cate=notice">커뮤니티</a></li>
            </ul>
        </header>