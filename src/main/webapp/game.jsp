<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Game"%>
<%@ page import="dao.GameRepository"%>
<%@ page errorPage = "exceptionNogameId.jsp"%>

<html>
<head>
 <link href = "./resources/css/bootstrap.min.css" rel="stylesheet">

<title>도서 정보</title>
<script type = "text/javascript">
	function addToCart() {
		if (confirm("게임을 장바구니에 추가하시겠습니까?")){
			document.addForm.submit();
		} else{
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
<div class="container py-4">
   <%@ include file="menu.jsp"%>	

   <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">게임정보</h1>
        <p class="col-md-8 fs-4">GameInfo</p>      
      </div>
    </div>
	
	<%
		String id = request.getParameter("id");
	    GameRepository dao = GameRepository.getInstance();
	    Game game = dao.getGameById(id);
	%>
	 <div class="row align-items-md-stretch">	 	
	 		<div class="col-md-5">
				<img src="./resources/images/<%=game.getFilename()%>" style="width: 70%">
			</div>
			<div class="col-md-6">
				<h3><b><%=game.getName()%></b></h3>
				<p><%=game.getDescription()%>
				<p><b>게임코드 : </b><span class="badge text-bg-danger"> <%=game.getGameId()%></span>							
				<p><b>제작사</b> : <%=game.getProducer()%>	
				<p><b>출판사</b> : <%=game.getPublisher()%>	
				<p><b>공개날짜</b> : <%=game.getReleaseDate()%>					
				<p><b>분류</b> : <%=game.getCategory()%>
				<h4><%=game.getUnitPrice()%>원</h4>
				<p> <form name="addForm" action="./addCart.jsp?id=<%=game.getGameId()%>" method="post">
					<a href="#" class="btn btn-info" onclick="addToCart()">게임주문 &raquo;</a> 
					<a href="./cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>
					<a href="./games.jsp" class="btn btn-secondary">게임목록 &raquo;</a>
					</form>
			</div>
		</div>
	<jsp:include page="footer.jsp" />
</div>
</body>
</html>
