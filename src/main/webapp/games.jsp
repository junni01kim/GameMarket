﻿<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Game"%>
<%@ page import="dao.GameRepository"%>
<html>
<head>
 <link href = "./resources/css/bootstrap.min.css" rel="stylesheet">

<title>도서 목록</title>
</head>
<body>
<div class="container py-4">
   <%@ include file="menu.jsp"%>	
   
   <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">게임목록</h1>
        <p class="col-md-8 fs-4">GameList</p>      
      </div>
    </div>
	<%
		GameRepository dao = GameRepository.getInstance();
		ArrayList<Game> listOfGames = dao.getAllGames();
	%>   
	   
	 <div class="row align-items-md-stretch   text-center">	 	
	 <%
		for (int i = 0; i < listOfGames.size(); i++) {
			Game game = listOfGames.get(i);
	  %>
     	<div class="col-md-4">
       		<div class="h-100 p-2">	
       			<img src="./resources/images/<%=game.getFilename()%>" style="width: 250; height:350" />		
				<h5><b><%=game.getName()%></b></h5>
				<p><%=game.getProducer()%>
				<br> <%=game.getPublisher()%> | <%=game.getUnitPrice()%>원
				<p> <%=game.getDescription().substring(0,60)%>...
				<p><%=game.getUnitPrice()%>원
				<p><%=game.getRating()%>
				<p><%=game.getReiview().substring(0,60)%>
				<p><a href="./game.jsp?id=<%=game.getGameId()%>" class="btn btn-secondary" role="button"> 상세 정보 &raquo;</a>
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
