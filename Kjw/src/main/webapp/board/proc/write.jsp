<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="kr.co.Kjw.db.Sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="kr.co.Kjw.db.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.Kjw.bean.MemberBean"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String path = request.getServletContext().getRealPath("/file");
	int maxSize = 1024 * 1024 * 10; // 최대 파일 허용 용량 10MB
	MultipartRequest mRequest = new MultipartRequest(request, path, maxSize, "UTF-8", new DefaultFileRenamePolicy());

	String group = mRequest.getParameter("group");
	String cate = mRequest.getParameter("cate");
	String title = mRequest.getParameter("title");
	String content = mRequest.getParameter("content");
	String fname = mRequest.getFilesystemName("fname");
	String regip = request.getRemoteAddr();
	
	// 세션 사용자 정보 가져오기
	MemberBean mb = (MemberBean) session.getAttribute("sessMember");
	String uid = mb.getUid();
	
	int seq = 0;
	
	try{
		// 1,2단계
		Connection conn = DBConfig.getInstance().getConnection();
		// 3단계
		Statement stmt = conn.createStatement();
		PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_ARTICLE);
		psmt.setString(1, cate);
		psmt.setString(2, title);
		psmt.setString(3, content);
		psmt.setInt(4, fname == null ? 0 : 1);
		psmt.setString(5, uid);
		psmt.setString(6, regip);
		// 4단계
		psmt.executeUpdate();
		ResultSet rs = stmt.executeQuery(Sql.SELECT_MAX_SEQ);
		// 5단계
		if(rs.next()){
			seq = rs.getInt(1);
		}
		// 6단계
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// 파일을 첨부 했을경우
	try{
		if(fname != null){
			// 고유한 파일 이름 생성하기
			int i = fname.lastIndexOf(".");
			String ext = fname.substring(i);
			
		 	SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss_");
			String now = sdf.format(new Date());
			String newName = now+uid+ext;
			
			// 파일명 수정 스트림 작업
			File oriFile = new File(path+"/"+fname);
			File newFile = new File(path+"/"+newName);
			oriFile.renameTo(newFile);
			
			// 파일 테이블 INSERT 작업
			// 1,2단계
			Connection conn = DBConfig.getInstance().getConnection();
			// 3단계
			PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_FILE);
			psmt.setInt(1, seq);
			psmt.setString(2, fname);
			psmt.setString(3, newName);
			// 4단계
			psmt.executeUpdate();
			// 5단계 - Select인 경우
			// 6단계
			conn.close();
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	// 돌아가기(리다이렉트)
	response.sendRedirect("/Kjw/board/list.jsp?group="+group+"&cate="+cate);
	
	
	
%>