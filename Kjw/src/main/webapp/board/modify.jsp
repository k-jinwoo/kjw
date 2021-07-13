<%@page import="kr.co.Kjw.bean.ArticleBean"%>
<%@page import="kr.co.Kjw.dao.ArticleDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String group = request.getParameter("group");
	String cate = request.getParameter("cate");
	String path = "./aside_"+group+".jsp";
	
	// 전송 데이터 수신
	String seq = request.getParameter("seq");
	
	// Dao 객체 가져오기
	ArticleDao dao = ArticleDao.getInstance();
		
	// 글 가져오기
	ArticleBean article = dao.selectArticle(seq);
	
%>
<<jsp:include page="<%= path %>"/>
<section id="board" class="modify">
    <h3>글수정</h3>
    <article>
        <form action="#">
            <table>
                <tr>
                    <td>제목</td>
                    <td><input type="text" name="title" value="<%= article.getTitle() %>" placeholder="제목을 입력하세요."/></td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td>
                        <textarea name="content"><%= article.getContent() %></textarea>                                
                    </td>
                </tr>
                <tr>
                    <td>첨부</td>
                    <td><input style="width:60%; float:left;" type="file" name="fname"/><%= article.getFb().getOriName() %></td>
                </tr>
            </table>
            <div>
                <a href="" class="btnCancel">취소</a>
                <input type="submit"  class="btnWrite" value="수정완료">
            </div>
        </form>
    </article>
</section>
<!-- 내용 끝 -->
</article>
</section>
</div>
<%@ include file="../footer.jsp" %>