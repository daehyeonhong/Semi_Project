<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="dbconn.jsp"%>
<%
	/* parameter로 넘어온 [ID_Value] */
String id = request.getParameter("id");
int qty = Integer.parseInt(request.getParameter("qty"));
/* ID값이 넘어왔는지 확인 */
if (id == null || id.trim().equals("")) {/* [ID_Value]가 넘어오지 않았으면 상품리스트 페이지로 이동 */
	response.sendRedirect("products.jsp");
	return;
}

/* [ID_Value]가 존재하면 상품처리 객체 생성 */
String sql = "SELECT*FROM TTProduct WHERE p_id=?";
PreparedStatement preparedStatement = con.prepareStatement(sql);
preparedStatement.setString(1, id);
ResultSet resultSet = preparedStatement.executeQuery();

Product product = null;
if (resultSet.next()) {
	product = new Product();
	product.setProductId(id);
	product.setPname(resultSet.getString("p_name"));
	product.setUnitPrice(resultSet.getInt("p_unitPrice"));
	product.setDescription(resultSet.getString("p_description"));
	product.setCategory(resultSet.getString("p_category"));
	product.setManufacturer(resultSet.getString("p_manufacturer"));
	product.setUnitsInStock(resultSet.getLong("p_unitsInStock"));
	product.setCondition(resultSet.getString("p_condition"));
	product.setFilename(resultSet.getString("p_fileName"));
}

/* 해당 ID에 맞는 상품정보 얻기 */

if (product == null) {/* 해당 ID로 상품이 존재하지 않으면 ErrorPage로 이동 */
	response.sendRedirect("exceptionNoProductId.jsp");
	return;
}

/* 상품 정보 담을 객체 생성 */
Product goods = product;

/* 세션에 cartList가 있는지 여부 확인
없으면 cartList를 생성하여 session에 저장 */

ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("cartlist");
if (list == null) {
	list = new ArrayList<Product>();
	session.setAttribute("cartlist", list);
}

int cnt = 0;
Product goodsQnt = new Product();

/* 장바구니에 동일 상품이 존재하면
수량을 추가 */
for (int i = 0; i < list.size(); i++) {
	goodsQnt = list.get(i);
	if (goodsQnt.getProductId().equals(id)) {
		cnt++;
		int orderQuantity = goodsQnt.getQuantity() + qty;/* 장바구니수량 증가 */
		goodsQnt.setQuantity(orderQuantity);
	}
}

/* 장바구니에 해당 상품이 없으면 */
if (cnt == 0) {
	goods.setQuantity(qty);
	list.add(goods);
}
System.out.println("상품수량: " + goods.getQuantity());
/* 상세페이지로 이동시 원래 상품 정보 출력 */
/* response.sendRedirect("product.jsp?id=" + id); */
resultSet.close();
preparedStatement.close();
con.close();
response.sendRedirect("product.jsp?id=" + id);
%>