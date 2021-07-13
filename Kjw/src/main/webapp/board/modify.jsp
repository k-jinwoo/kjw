<%@page import="kr.co.Kjw.bean.FileBean"%>
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
	
	// 파일 정보 가져오기
		FileBean fb = dao.selectFile(seq);
	
%>

<jsp:include page="<%= path %>"/>
<section id="board" class="modify">
<!--
<script type="text/javascript">
		$(document).ready(function(){
			$('#file').onchange(function(){
				document.getElementById("file").innerHTML="<%= article.getFb().getOriName() %>";
			}
		});
	);
</script>
-->
    <h3>글수정</h3>
    <article>
        <form action="/Kjw/board/proc/modify.jsp" method="post">
        <input type="hidden" name="seq" value="<%= seq %>"/>
        <input type="hidden" name="group" value="<%= group %>"/>
        <input type="hidden" name="cate" value="<%= cate %>"/>
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
                    <td>새 첨부파일</td>
                    <td>
                    	<input type="file" name="fname"/> 미구현 입니다.
                    </td>
                </tr>
                <tr>
                	<td>기존 첨부파일</td>
                	<td>
                		<%= article.getFb().getOriName() %>
                	</td>
                </tr>
            </table>
            <div>
                <a href="/Kjw/board/view.jsp?group=<%= group %>&cate=<%= cate %>&seq=<%= seq %>" class="btnCancel">취소</a>
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