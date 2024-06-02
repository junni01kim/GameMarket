<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>


<html>
<head>
 <link rel ="stylesheet" href ="./resources/css/bootstrap.min.css" />
<title>게임 편집</title>
<script type="text/javascript">
	function deleteConfirm(id) {
		if (confirm("해당 게임을 삭제합니다!!") == true)
			location.href = "./deleteGame.jsp?id=" + id;
		else
			return;
	}
</script>

</head>
<%
	String edit = request.getParameter("edit");
%>
<body>
<div class="container py-4">
   <%@ include file="menu.jsp"%>	

   <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">게임 편집</h1>
        <p class="col-md-8 fs-4">GameEditing</p>      
      </div>
    </div>
    <%@ include file="dbconn.jsp" %>
     <div class="row align-items-md-stretch   text-center">
	<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = "select * from Game";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
			%>
      
	
	
     	<div class="col-md-4">
       		<div class="h-100 p-2 round-3">		
       		    <img src="./resources/images/<%=rs.getString("g_filename")%>" style="width: 250; height:350" />	
				<p><h5><b><%=rs.getString("g_name")%></b></h5>
				<p><%=rs.getString("g_producer")%>
				<br> <%=rs.getString("g_publisher")%> | <%=rs.getString("g_unitPrice")%>원
				<p> <%=rs.getString("g_description").substring(0,10)%>....
				<p><%=rs.getString("g_unitPrice")%>원
				<p><%
						if (edit.equals("update")) {
					%>
					<a href="./updateGame.jsp?id=<%=rs.getString("g_id")%>" class="btn btn-success" role="button"> 수정 &raquo;></a>
					
					<%
						} else if (edit.equals("delete")) {
					%>
					<a href="#" onclick="deleteConfirm('<%=rs.getString("g_id")%>')" class="btn btn-danger" role="button">삭제 &raquo;></a>
					<%
						}
					%>	
			</div>	
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
	
		</div>	
		<%@ include file="footer.jsp"%>   
  </div>
</body>
</html>
