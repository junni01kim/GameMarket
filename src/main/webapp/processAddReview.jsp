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
    
    Statement stmt = conn.createStatement();
    String sql = "SELECT g_rating, g_rating_count FROM game WHERE g_name = ?";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, name);
    ResultSet rs = pstmt.executeQuery();

	rs.next();
    
    sql = "UPDATE game SET g_rating = ?, g_rating_count = ?, g_review = ? WHERE g_name = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, rating + rs.getInt("g_rating"));
    pstmt.setInt(2, rs.getInt("g_rating_count") + 1);
    pstmt.setString(3, review);
    pstmt.setString(4, name);
    pstmt.executeUpdate();
    
    if (pstmt != null) {
        pstmt.close();
    }
    if (conn != null) {
        conn.close();
    }
    
    response.sendRedirect("games.jsp");
%>
