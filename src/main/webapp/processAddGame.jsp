<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Game"%>
<%@ page import="dao.GameRepository"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");


	String filename = "";

	String realFolder = "C:\\Users\\audwn\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\GameMarket\\resources\\images";
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb
	String encType = "utf-8"; //인코딩 타입
	
	DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, policy);

	String gameID = multi.getParameter("gameId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String producer = multi.getParameter("producer");
	String publisher = multi.getParameter("publisher");
	String releaseDate = multi.getParameter("releaseDate");	
	String description = multi.getParameter("description");	
	String category = multi.getParameter("category");
	String condition = multi.getParameter("condition");

	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	
	int price;

	if (unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(unitPrice);
	
	GameRepository dao = GameRepository.getInstance();

	Game newGame = new Game();
	newGame.setGameId(gameID);
	newGame.setName(name);
	newGame.setUnitPrice(price);
	newGame.setProducer(producer);
	newGame.setPublisher(publisher);
	newGame.setPublisher(releaseDate);
	newGame.setDescription(description);
	newGame.setCategory(category);
	newGame.setCondition(condition);
	newGame.setFilename(fileName);

	dao.addGame(newGame);

	response.sendRedirect("games.jsp");

%>
