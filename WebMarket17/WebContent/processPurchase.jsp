<%@page import="java.sql.ResultSet"%>
<%@page import="dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="dbconn.jsp"%>
<%
try {
con.setAutoCommit(false);
/* String sql = "";
PreparedStatement preparedStatement = con.prepareStatement(sql); */
request.setCharacterEncoding("UTF-8");
	String price = request.getParameter("price"),
				 card1 = request.getParameter("cardId1"),
				 card2 = request.getParameter("cardId2"), 
				 card3 = request.getParameter("cardId3"),
				 card4 = request.getParameter("cardId4"),
				 cardMM = request.getParameter("cardMM"),
				 cardYY = request.getParameter("cardYY"),
				 cardPassword = request.getParameter("cardPassword"),
				 birth = request.getParameter("birth"), 
				 payment = request.getParameter("payment");
out.print(price + ", " + card1 + ", " + card2 + ", " + card3 + ", " + card4 + ", " + cardMM + ", " + cardYY + ", " + cardPassword + ", " + birth + ", " + payment + "<br />");


List<Product> cartList = (List<Product>) session.getAttribute("cartlist");
if (cartList != null) {
		for(Product product : cartList) {
			String sql = "select p_unitsInStock from product where p_id=?";
			int cartListQtt = product.getQuantity(), productStock = 0;
			String id = product.getProductId();
			System.out.print(id);
			PreparedStatement preparedStatement = con.prepareStatement(sql);
			preparedStatement.setString(1, id);
			ResultSet resultSet = preparedStatement.executeQuery(); 
			out.print("cartList<br />");
			out.print("ID: " + id + "<br />");
			out.print("Stock: " + product.getUnitsInStock() + "<br />");
			out.print("Quantity: "+ cartListQtt + "<br />");
			while(resultSet.next()){
				productStock = resultSet.getInt(1);
			out.print("DB<br />");
			out.print("Stock: " + productStock + "<br />");
				if (productStock < cartListQtt) {
					response.sendRedirect("./exceptionPurchaseFail.jsp");
				} else {
					productStock -= cartListQtt;
					System.out.print(productStock);
					sql = "update product set p_unitsInStock=? where p_id=?";
					preparedStatement = con.prepareStatement(sql);
					preparedStatement.setInt(1, productStock);
					preparedStatement.setString(2, id);
					int result = preparedStatement.executeUpdate();
				}
			}
		}
		con.commit();
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("thankCustomer.jsp");
		requestDispatcher.forward(request, response);
	} else {
		response.sendRedirect("./exceptionEmptyCart.jsp");
	}
} catch (Exception e) {
		e.printStackTrace();
	} finally {
		con.setAutoCommit(true);
		if (con != null) {
			con.close();
		}
	}
%>
<%-- <jsp:forward page="/thankCustomer.jsp"/> --%>