<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String cate = request.getParameter("cate");
%>
<div id="sub">
    <div><img src="/Kjw/img/sub_top_tit2.png" alt="MARKET"></div>
    <section class="cate2">
        <aside>
            <img src="/Kjw/img/sub_aside_cate2_tit.png" alt="장보기"/>

            <ul class="lnb">
                <li class="<%= cate.equals("market") ? "on" : "off" %>"><a href="/Kjw/board/list.jsp?group=market&cate=market">장보기</a></li>
            </ul>
        </aside>
        <article>
            <nav>
                <img src="/Kjw/img/sub_nav_tit_cate2_tit_<%= cate %>.png" alt="장보기"/>
                <p>
                    HOME > 장보기 > 
						<% if(cate.equals("market")){ %>
                        <em>장보기</em>
                        <% } %>
                </p>
            </nav>