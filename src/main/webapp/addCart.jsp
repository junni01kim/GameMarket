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

	ArrayList<Game> goodsList = dao.getAllGames();
	Game goods = new Game();
	for (int i = 0; i < goodsList.size(); i++) {
		goods = goodsList.get(i);
		if (goods.getGameId().equals(id)) { 			
			break;
		}
	}
	
	ArrayList<Game> list = (ArrayList<Game>) session.getAttribute("cartlist");
	if (list == null) { 
		list = new ArrayList<Game>();
		session.setAttribute("cartlist", list);
	}

	int cnt = 0;
	Game goodsQnt = new Game();
	for (int i = 0; i < list.size(); i++) {
		goodsQnt = list.get(i);
		if (goodsQnt.getGameId().equals(id)) {
			cnt++;
			int orderQuantity = goodsQnt.getQuantity() + 1;
			goodsQnt.setQuantity(orderQuantity);
		}
	}

	if (cnt == 0) { 
		goods.setQuantity(1);
		list.add(goods);
	}

	response.sendRedirect("game.jsp?id=" + id);
%>