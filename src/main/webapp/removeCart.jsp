<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Game"%>
<%@ page import="dao.GameRepository"%>
<%
	String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("games.jsp");
		return;
	}

	GameRepository dao = GameRepository.getInstance();
	
	Game game = dao.getGameById(id);
	if (game == null) {
		response.sendRedirect("exceptionNoGameId.jsp");
	}

	ArrayList<Game> cartList = (ArrayList<Game>) session.getAttribute("cartlist");
	Game goodsQnt = new Game();
	for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
		goodsQnt = cartList.get(i);
		if (goodsQnt.getGameId().equals(id)) {
			cartList.remove(goodsQnt);
		}
	}

	response.sendRedirect("cart.jsp");
%>
