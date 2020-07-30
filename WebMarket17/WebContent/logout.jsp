<%-- <%@ page contentType="text/html; charset=UTF-8"%>
<%
	session.invalidate();//브라우저 켜져있어도 접속정보 삭제하는 메소드
response.sendRedirect("addProduct.jsp");
%>
 --%>
 <%@ page contentType="text/html; charset=UTF-8"%>
<%
	session.invalidate();
	response.sendRedirect("./member/loginMember.jsp");
%>