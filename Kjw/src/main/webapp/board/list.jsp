<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String group = request.getParameter("group");
	String cate = request.getParameter("cate");
	String path = "./aside_"+group+".jsp";
%>

<jsp:include page="<%= path %>"/>

<section id="board" class="list">
    <h3>글목록</h3>
    <article>
        <table border="0">
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>글쓴이</th>
                <th>날짜</th>
                <th>조회</th>
            </tr>
            <tr>
                <td>번호</td>
                <td><a href="#">제목</a></td>
                <td>닉네임</td>
                <td>날짜</td>
                <td>조회수</td>
            </tr>
        </table>
    </article>

    <!-- 페이지 네비게이션 -->
    <div class="paging">
	       <a href="#" class="prev">이전</a>
	       <a href="#" class="num"></a>
	       <a href="#" class="next">다음</a>
	   </div>

    <!-- 글쓰기 버튼 -->
    <a href="" class="btnWrite">글쓰기</a>

</section>
    <!-- 내용 끝 -->
        </article>
    </section>
</div>
<%@ include file="../footer.jsp" %>