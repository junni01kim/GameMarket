<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel ="stylesheet" href ="./resources/css/bootstrap.min.css" />

<title>게임 수정</title>
</head>
<body>
<div class="container py-4">
   <%@ include file="menu.jsp"%>	

   <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">게임 수정</h1>
        <p class="col-md-8 fs-4">Game Updating</p>      
      </div>
    </div>
  <%@ include file="dbconn.jsp"%>
  <%
		String gameId = request.getParameter("id");

		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		String sql = "select * from game where g_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, gameId);
		rs = pstmt.executeQuery();
		if (rs.next()) {
	%>		
	 <div class="row align-items-md-stretch">	  	
		
		<div class="col-md-5">
				<img src="./resources/images/<%=rs.getString("g_filename")%>" alt="image" style="width: 100%" />
			</div>
		<div class="col-md-7">	
		<form name="updateGame" action="./processUpdateGame.jsp" method="post" enctype ="multipart/form-data">
		
			
			<div class="mb-3 row">
				<label class="col-sm-2">게임코드</label>
				<div class="col-sm-5">
					<input type="text" name="gameId" id="gameId" class="form-control" value='<%=rs.getString("g_id")%>'>
				</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2">게임명</label>
				<div class="col-sm-5">
					<input type="text" name="name" id="name" class="form-control" value='<%=rs.getString("g_name")%>'>
				</div>
			</div>
				
			<div class="mb-3 row">
				<label class="col-sm-2">가격</label>
				<div class="col-sm-5">
					<input type="text" name="unitPrice"  id="unitPrice"class="form-control" value='<%=rs.getString("g_unitPrice")%>'>
				</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2">제작사</label>
				<div class="col-sm-5">
					<input type="text" name="producer" class="form-control" value='<%=rs.getString("g_producer")%>'>
				</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2">출판사</label>
				<div class="col-sm-5">
					<input type="text" name="publisher" class="form-control" value='<%=rs.getString("g_publisher")%>'>
				</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2">출판일</label>
				<div class="col-sm-5">
					<input type="text" name="releaseDate" class="form-control" value='<%=rs.getString("g_releaseDate")%>'>
				</div>
			</div>
	
			<div class="mb-3 row">
				<label class="col-sm-2">상세정보</label>
				<div class="col-sm-8">
					<textarea  name="description" id="description" cols="50" rows="2"
						class="form-control" placeholder="20자 이상 적어주세요"><%=rs.getString("g_description")%></textarea>
				</div>
			</div>
						
			<div class="mb-3 row">
				<label class="col-sm-2">분류</label>
				<div class="col-sm-5">
					<input type="text" name="category" class="form-control" value='<%=rs.getString("g_category")%>'>
				</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2">이미지</label>
				<div class="col-sm-8">
					<input type="file" name="gameImage" class="form-control">
				</div>
			</div>
			
			<div class="mb-3 row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary" value="등록 " >
				</div>
			</div>
		</form>
	</div>
	<%
		}
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	%>
	<jsp:include page="footer.jsp" />
</div>	

</body>
</html>
