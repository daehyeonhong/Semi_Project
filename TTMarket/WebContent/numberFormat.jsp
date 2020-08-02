<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	DecimalFormat numberFormat = new DecimalFormat("#,###");
DecimalFormat priceFormat = new DecimalFormat("\u00A4 #,###");
SimpleDateFormat readDateFormat = new SimpleDateFormat("yyyy-MM-dd");
SimpleDateFormat writeDateFormat = new SimpleDateFormat("yyyy/MM/dd");
%>