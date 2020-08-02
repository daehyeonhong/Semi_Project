<%@page import="java.util.List"%>
<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
if (id == null || id.trim().equals("")) {
	response.sendRedirect("products.jsp");//상품리스트로 이동.
	return;
}

ProductRepository dao = ProductRepository.getInstance();
Product product = dao.getProductById(id);
if (product == null)
	response.sendRedirect("${pageContext.request.contextPath}/noProductId.jsp");

List<Product> cartList = (List<Product>) session.getAttribute("cartlist");
Product goodsQnt = new Product();
for (int i = 0; i < cartList.size(); i++) {
	goodsQnt = cartList.get(i);
	if (goodsQnt.getProductId().equals(id)) {
		cartList.remove(goodsQnt);//해당상품을 cartlist에서 삭제
	}
}

response.sendRedirect("cart.jsp");
%>