<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
<html >
<head>    
   <link rel ="stylesheet" href ="./resources/css/bootstrap.min.css" />
	<title>Welcome</title>
</head>
<body>
<div class="container py-4">
   <%@ include file="menu.jsp"%>    
	<%!String discountEvent = "할인 중인 게임 -에몽어스-";
	String tagline = "할인까지 남은시간:";%>	
    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
	      <div>
	      </div>
        <h1 class="display-5 fw-bold"><%=discountEvent%></h1>
        <p class="col-md-8 fs-4">Aemong Us</p>      
      </div>
    </div>

    <div class="row align-items-md-stretch   text-center">
      <div class="col-md-12">
        <div class="h-100 p-5">
          <h3><%=tagline%></h3>          
          <%
                response.setIntHeader("Refresh", 1);
				Date day = new java.util.Date();
				
				Date discountEndDay = new java.util.Date(2024, 05, 21, 10, 0, 0);
						
				int hour = discountEndDay.getHours() - day.getHours() - 1;
				int minute = 60 - discountEndDay.getMinutes() - day.getMinutes()- 1;
				int second = 60 - discountEndDay.getSeconds() - day.getSeconds() - 1;
				
				String CT = hour + ":" + minute + ":" + second;
				out.println("마감임박!! " + CT +  "\n");
			%>  			
        </div>
      </div>   
 	</div> 	
	<%@ include file="footer.jsp"%>   
  </div>
</body>
</html>
  