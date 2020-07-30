<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% String id=request.getParameter("id");%><br>
<% int qty=Integer.parseInt(request.getParameter("qty"));%><br>   
<%
//세션에 cartlist가 있는지 여부 확인
//없으면 cartlist를 생성하여 session에 저장.
ArrayList<Product> list =(ArrayList<Product>)session.getAttribute("cartlist");
if(list==null){
	System.out.println("세션에 cartlist정보가 없음,새로만듦");
	list = new ArrayList<Product>();
	session.setAttribute("cartlist", list);
}

Product goodsQnt = new Product();
//장바구에 동일 상품이 존재하면
//수량 추가
for(int i=0;i<list.size();i++){
	goodsQnt=list.get(i);
	if(goodsQnt.getProductId().equals(id)){
		goodsQnt.setQuantity(qty);
	}
}
//수량변경 확인을 위해 cart페이지로 이동.
response.sendRedirect("./cart.jsp");
%>

</body>
</html>