<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");


	String filename = "";
	//String realFolder = "C:\\upload"; //웹 어플리케이션상의 절대 경로


	String realFolder = "C:\\Users\\audwn\\eclipse-workspace\\GameMarket\\src\\main\\webapp\\resources\\images";
	String encType = "utf-8"; //인코딩 타입
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

	
	
	String gameId = multi.getParameter("gameId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String producer = multi.getParameter("producer");
	String publisher = multi.getParameter("publisher");
	String releaseDate = multi.getParameter("releaseDate");	
	String description = multi.getParameter("description");	
	String category = multi.getParameter("category");
	
	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	int price;

	if (unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(unitPrice);	
	
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from game where g_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, gameId);
	rs = pstmt.executeQuery();	
	
	
	if (rs.next()) {		
		if (fileName != null) {
			sql = "UPDATE game SET g_name=?, g_unitPrice=?, g_producer=?, g_description=?, g_publisher=?, g_category=?, g_releaseDate=?, g_fileName=? WHERE g_id=?";	
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setString(3, producer);
			pstmt.setString(4, description);
			pstmt.setString(5, publisher);
			pstmt.setString(6, category);
			pstmt.setString(7, releaseDate);	
			pstmt.setString(8, fileName);	
			pstmt.setString(9, gameId);	
			pstmt.executeUpdate();
			
					
		} else {
			sql = "UPDATE game SET g_name=?, g_unitPrice=?, g_producer=?, g_description=?, g_publisher=?, g_category=?, g_releaseDate=? WHERE g_id=?";	
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setString(3, producer);
			pstmt.setString(4, description);
			pstmt.setString(5, publisher);
			pstmt.setString(6, category);
			pstmt.setString(7, releaseDate);		
			pstmt.setString(8, gameId);	
			pstmt.executeUpdate();
		}		
	}
	

	
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	

	response.sendRedirect("editGame.jsp?edit=update");

%>
