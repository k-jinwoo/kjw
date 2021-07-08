<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="kr.co.Kjw.db.Sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.Kjw.db.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 데이터 수신
	request.setCharacterEncoding("utf-8");
	String nick = request.getParameter("nick");
	
	int count = -1;
	
	try{
		// 1,2 단계
		Connection conn = DBConfig.getInstance().getConnection();
		// 3 단계
		PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_COUNT_NICK);
		psmt.setString(1, nick);
		// 4 단계
		ResultSet rs = psmt.executeQuery();
		// 5 단계
		if(rs.next()){
			count = rs.getInt(1);
		}
		// 6 단계
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	// JSON 결과 데이터 전송
	JsonObject json = new JsonObject();
	json.addProperty("result", count);
	
	out.print(json);


%>