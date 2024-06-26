<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<link rel ="stylesheet" href ="./resources/css/bootstrap.min.css" />
<script type="text/javascript" src="./resources/js/validation.js"></script>
<title>리뷰 등록</title>
</head>
<body>
<fmt:setLocale value='<%= request.getParameter("language") %>'/>
<fmt:bundle basename="bundle.message">
<div class="container py-4">
   <%@ include file="menu.jsp"%>		

   <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold"><fmt:message key="addReviewTitle" /></h1>
        <p class="col-md-8 fs-4">Review Addition</p>      
      </div>
    </div>
  
  <div class="row align-items-md-stretch">	 
   		<div class="text-end"> 
			<a href="?language=ko" >Korean</a> | <a href="?language=en" >English</a> | <a href="?language=jp" >Japanese</a>
			<a href = "logout.jsp" class ="btn btn-sm btn-success pull right">logout</a>
		</div>	
		<form name="newReview" action="./processAddReview.jsp" method="post">		
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key="name" /></label>
				<div class="col-sm-3">
					<input type="text" name="name" class="form-control" >
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key="rating" /></label>
				<div class="col-sm-3">
					<input type="text" name="rating" class="form-control">
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key="review" /></label>
				<div class="col-sm-3">
					<textarea name="review" id="review" cols="50" rows="2" 
						class="form-control" placeholder="리뷰를 적어주세요"></textarea>
				</div>
			</div>
			<div class="mb-3 row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary" value="등록">
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="footer.jsp" />
</div>
</fmt:bundle>
</body>
</html>