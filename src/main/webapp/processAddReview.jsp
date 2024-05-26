<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Game"%>
<%@ page import="dao.GameRepository"%>
<%@ page import="java.util.*"%>

<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	int rating = Integer.parseInt(request.getParameter("rating"));
	String review = request.getParameter("review");
	
	GameRepository dao = GameRepository.getInstance();

	dao.updateGame(name, rating, review);

	response.sendRedirect("games.jsp");
%>