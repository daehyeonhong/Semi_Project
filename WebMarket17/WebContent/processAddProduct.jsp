<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.Enumeration"%>
<%@page import="dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>    
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="product" class="dto.Product"/>
<jsp:setProperty property="*" name="product"/>
<%
String filename = "";
String realFolder = "/resources/images"; //웹 어플리케이션상의 절대 경로
String encType = "utf-8"; //인코딩 타입
int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb

System.out.print(getServletContext().getRealPath(realFolder));

MultipartRequest multi = 
     new MultipartRequest(request, 
    		 getServletContext().getRealPath(realFolder), 
    		 maxSize, 
    		 encType, 
    		 new DefaultFileRenamePolicy());

 String productId = multi.getParameter("productId");
String name = multi.getParameter("pname");
String unitPrice = multi.getParameter("unitPrice");
String description = multi.getParameter("description");
String manufacturer = multi.getParameter("manufacturer");
String category = multi.getParameter("category");
String unitsInStock = multi.getParameter("unitsInStock");
String condition = multi.getParameter("condition");

Integer price;
if (unitPrice.isEmpty())	price = 0;
else price = Integer.valueOf(unitPrice);
long stock;
if (unitsInStock.isEmpty()) stock = 0;
else stock = Long.valueOf(unitsInStock);

Enumeration files = multi.getFileNames();
String fname = (String) files.nextElement();
String fileName = multi.getFilesystemName(fname);

//쿼리객체 생성
String sql="insert into product values (?,?,?,?,?,?,?,?,?)";
PreparedStatement pstmt= con.prepareStatement(sql);
//바인딩변수 설정
pstmt.setString(1,productId);
pstmt.setString(2,name);
pstmt.setInt(3,price);
pstmt.setString(4,description);
pstmt.setString(5,category);
pstmt.setString(6,manufacturer);
pstmt.setLong(7,stock);
pstmt.setString(8,condition);
pstmt.setString(9,fileName);
//입력실행
pstmt.executeUpdate();
//자원해제
 if(pstmt!=null) pstmt.close();
 if(con!=null) con.close();
%>
<%
	response.sendRedirect("./products.jsp");
%>
</body>
</html>
