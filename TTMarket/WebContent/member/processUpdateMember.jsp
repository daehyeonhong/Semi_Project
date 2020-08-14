<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
	request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String name = request.getParameter("name");
String gender = request.getParameter("gender");
String birthyy = request.getParameter("birthyy");
String birthmm = request.getParameter("birthmm");
String birthdd = request.getParameter("birthdd");

String birth = birthyy + "/" + birthmm + "/" + birthdd;

String phone = request.getParameter("phone");
String postcode = request.getParameter("postcode");
String address = request.getParameter("address");
String detailAddress = request.getParameter("detailAddress");
String extraAddress = request.getParameter("extraAddress");
//member테이블 등록 일시 데이타 생성
Date currentDatetime = new Date(System.currentTimeMillis());
java.sql.Date sqlDate = new java.sql.Date(currentDatetime.getTime());
Timestamp timestamp = new Timestamp(currentDatetime.getTime());
%>
<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://15.165.66.140:3306/TTMarketDB?useSSL=false" user="ttestt"
	password="ttestt11#" />

<sql:update dataSource="${dataSource}" var="resultSet">
	UPDATE TTMember SET name=?,gender=?,birth=?,phone=?,postcode=?,address=?,detailAddress=?,extraAddress=?,regist_day=? WHERE id=?
	<sql:param value="<%=name%>" />
	<sql:param value="<%=gender%>" />
	<sql:param value="<%=birth%>" />
	<%-- <sql:param value="<%=email%>" /> --%>
	<sql:param value="<%=phone%>" />
	<sql:param value="<%=postcode%>" />
	<sql:param value="<%=address%>" />
	<sql:param value="<%=detailAddress%>" />
	<sql:param value="<%=extraAddress%>" />
	<sql:param value="<%=timestamp%>" />
	<sql:param value="<%=id%>" />
</sql:update>

<c:if test="${resultSet>=1}">
	<c:redirect url="resultMember.jsp?msg=0" />
</c:if>