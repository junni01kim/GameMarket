<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Game"%>
<%@ page import="dao.GameRepository"%>
<html>
<head>
 <link href = "./resources/css/bootstrap.min.css" rel="stylesheet">

<title>게임 목록</title>
</head>
<body>
<div class="container py-4">
   <%@ include file="menu.jsp"%>	
   
   <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">게임 목록</h1>
        <p class="col-md-8 fs-4">GameList</p>      
      </div>
    </div>
	<%
		GameRepository dao = GameRepository.getInstance();
		ArrayList<Game> listOfGames = dao.getAllGames();
	%>   
	 <%@ include file="dbconn.jsp" %>  
	 <div class="row align-items-md-stretch   text-center">	 	
	 <% 
	 	PreparedStatement pstmt = null;
		 ResultSet rs = null;
		 String sql = "SELECT * FROM game";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
	 %>
     	<div class="col-md-4">
       		<div class="h-100 p-2">	
       			<img src="./resources/images/<%=rs.getString("g_filename")%>" style="width: 250; height:350" />		
				<h5><b><%=rs.getString("g_name")%></b></h5>
				<p><%=rs.getString("g_producer")%>
				<br> <%=rs.getString("g_publisher")%> | <%=rs.getString("g_unitPrice")%>원
				<p> <%=rs.getString("g_description").substring(0,10)%>...
				<p><%=rs.getString("g_unitPrice")%>원
				<p><%=rs.getString("g_rating")%>
				<p><%=rs.getString("g_review")%>
				<p><a href="./game.jsp?id=<%=rs.getString("g_id")%>" class="btn btn-secondary" role="button"> 상세 정보 &raquo;</a>
			</div>	
		</div>			
		<%
			}
		%>	
		</div>	
		<%@ include file="footer.jsp"%>   
  </div>
</body>
</html>
