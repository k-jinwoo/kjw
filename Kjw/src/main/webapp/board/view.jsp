<%@page import="kr.co.Kjw.bean.ArticleBean"%>
<%@page import="kr.co.Kjw.bean.FileBean"%>
<%@page import="kr.co.Kjw.dao.ArticleDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<script>
	jQuery(function(){
		$('.btnDelete').click(function(){
			if(confirm('정말 삭제 하시겠습니까?')){
				return true;
			}else{
				return false;
			}
		});
	});
</script>
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
	
	// 해당 글 조회수 업데이트
		dao.updateArticleHit(seq);
	
%>
<jsp:include page="<%= path %>"/>
<section id="board" class="view">
    <h3>글보기</h3>
    <table>
        <tr>
            <td>제목</td>
            <td><input type="text" name="title" value="<%= article.getTitle() %>" readonly/></td>
        </tr>
        <% if(article.getFile() == 1){ %>
        <tr>
            <td>첨부파일</td>
            <td>
                <a href="/Kjw/board/proc/download.jsp?seq=<%= article.getFb().getSeq() %>"><%= article.getFb().getOriName() %></a>
                <span><%= article.getFb().getDownload() %>회 다운로드</span>
            </td>
        </tr>
        <% } %>
        <tr>
            <td>내용</td>
            <td>
                <textarea name="content" readonly><%= article.getContent() %></textarea>
            </td>
        </tr>
    </table>
    <div>
    	<% if(mb.getUid().equals(article.getUid())){ %>
        	<a href="/Kjw/board/proc/delete.jsp?group=<%= group %>&cate=<%= cate %>&seq=<%= article.getSeq() %>" class="btnDelete">삭제</a>
        	<a href="/Kjw/board/modify.jsp?group=<%= group %>&cate=<%= cate %>&seq=<%= article.getSeq() %>" class="btnModify">수정</a>
        <% } %>
        <a href="/Kjw/board/list.jsp?group=<%= group %>&cate=<%= cate %>" class="btnList">목록</a>
    </div>  
    
    <!-- 댓글리스트 -->
    <section class="commentList">
        <h3>댓글목록</h3>
        
        <article class="comment">
            <span>
                <span></span>
                <span></span>
            </span>
            <textarea name="comment" data-seq="" data-parent="" readonly></textarea>
            
            <div>
                <a href="#" class="btnCommentDel">삭제</a>
                <a href="#" class="btnCommentModify">수정</a>
            </div>
        </article>
        
        <p class="empty">
            등록된 댓글이 없습니다.
        </p>
    </section>

    <!-- 댓글입력폼 -->
    <section class="commentForm">
        <h3>댓글쓰기</h3>
        <form action="/Kjw/board/proc/comment.jsp" method="post">
        	<input type="hidden" name="group" value=""/>
        	<input type="hidden" name="cate" value=""/>
        	<input type="hidden" name="parent" value=""/>
        	<input type="hidden" name="uid" value=""/>
            <textarea name="comment" required></textarea>
            <div>
                <a href="#" class="btnCancel">취소</a>
                <input type="submit" class="btnWrite" value="작성완료"/>
            </div>
        </form>
    </section>

</section>
<!-- 내용 끝 -->
</article>
</section>
</div>
<%@ include file="../footer.jsp" %>