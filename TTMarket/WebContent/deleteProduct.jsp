<%@page import="java.sql.PreparedStatement"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
     //파라미터로 넘어온 상품id를 받아서 db에서 삭제처리
     String id=request.getParameter("id");
     String sql="delete from product where p_id=?";
     //수동커밋 처리
     con.setAutoCommit(false);
     PreparedStatement pstmt=con.prepareStatement(sql);
     pstmt.setString(1,id);
     //삭제 처리
     //executeUpdate()리턴값은 삭제된 행의 수
     int result = pstmt.executeUpdate();
     //삭제된 행의 수가 있으면 db에 반영
     if(result>0) con.commit();
     //삭제된 행의 수가 없으면 이전으로 되돌리기
     if(result==0) con.rollback();
     //db반영 옵션을 원래대로 초기화
     con.setAutoCommit(true);
     
     //이전페이지로 돌아가기
     response.sendRedirect("./editProduct.jsp?edit=delete");
%>
