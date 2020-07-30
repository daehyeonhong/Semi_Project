<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ include file="dbconn.jsp" %>    
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
String sql="select * from product where p_id=?";
PreparedStatement pstmt= con.prepareStatement(sql);
pstmt.setString(1,productId);
ResultSet rs=pstmt.executeQuery();

if(rs.next()){
	if(fileName!=null){//파일전송시 처리
sql="update product set p_name=?,p_unitPrice=?,p_description=?,p_category=?,p_manufacturer=?,p_unitsInStock=?,p_condition=?,p_fileName=? where p_id=?";
	pstmt=con.prepareStatement(sql);
	//바인딩변수 설정
	pstmt.setString(1,name);
	pstmt.setInt(2,price);
	pstmt.setString(3,description);
	pstmt.setString(4,category);
	pstmt.setString(5,manufacturer);
	pstmt.setLong(6,stock);
	pstmt.setString(7,condition);
	pstmt.setString(8,fileName);
	pstmt.setString(9,productId);
	//입력실행
	pstmt.executeUpdate();
	}else{//파일 미 전송시 처리
   sql="update product set p_name=?,p_unitPrice=?,p_description=?,p_category=?,p_manufacturer=?,p_unitsInStock=?,p_condition=? where p_id=?";
   pstmt=con.prepareStatement(sql);
		//바인딩변수 설정
		pstmt.setString(1,name);
		pstmt.setInt(2,price);
		pstmt.setString(3,description);
		pstmt.setString(4,category);
		pstmt.setString(5,manufacturer);
		pstmt.setLong(6,stock);
		pstmt.setString(7,condition);
		pstmt.setString(8,productId);
		//입력실행
		pstmt.executeUpdate();	
	}
}
if(rs!=null)rs.close();
if(pstmt!=null)pstmt.close();
if(con!=null)con.close();

%>
<%
	response.sendRedirect("editProduct.jsp?edit=update");
%>
    