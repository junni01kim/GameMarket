<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Game"%>
<%@ page import="dao.GameRepository"%>
<%@ page import="java.util.*"%>
<%@ page import = "java.sql.*" %>
<%@ include file="dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	int rating = Integer.parseInt(request.getParameter("rating"));
	String review = request.getParameter("review");
	
	PreparedStatement pstmt = null;	
	
	String sql = "update book set rating=?, review=? where name=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, rating);
	pstmt.setString(2, review);
	pstmt.setString(3, name);
	pstmt.executeUpdate();
	
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	
	response.sendRedirect("games.jsp");
%>