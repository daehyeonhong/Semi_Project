<%@page import="java.util.List"%>
<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //파라미터로 넘어온 id정보가 없으면
   String id=request.getParameter("id");
if(id==null|| id.trim().equals("")){
	response.sendRedirect("products.jsp");//상품리스트로 이동.
	return;
}
  //파라미터로 넘어온 id정보가 있으면 
  ProductRepository dao= ProductRepository.getInstance();
  //상품정보 얻기
  Product product = dao.getProductById(id);
  //해당상품 정보가 없으면 에러페이지로 이동.
  if(product==null)
	  response.sendRedirect("exceptionNoProductId.jsp");
  
  //해당상품정보가 있으면
  //cartlist에서 해당상품 정보 얻기
  List<Product> cartList 
      =(List<Product>)session.getAttribute("cartlist");
  Product goodsQnt = new Product();
  //해당상품정보가 cartlist에 있으면...
  for(int i=0;i<cartList.size();i++){
	  goodsQnt = cartList.get(i);
	  if(goodsQnt.getProductId().equals(id)){
		  cartList.remove(goodsQnt);//해당상품을 cartlist에서 삭제
	  }
  }
  
  //삭제한 내용 확인을 위해 cart페이지로 이동.
  response.sendRedirect("cart.jsp");
  
%>