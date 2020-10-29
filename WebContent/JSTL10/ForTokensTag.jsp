<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ForTokensTag.jsp</title>
</head>
<body>
	<fieldset>
		<legend>forTokens 태그</legend>
		<%
			String colors = "red,green,blue,#ab7dff";
			out.println("<h2>String클래스</h2>");
			
			for(String color:colors.split(",")){
				out.println("<h4 style='color:"+color+"'>"+color+"</h4>");
			}
			out.println("<h2>StringTokenizer클래스</h2>");
			//StringTokenizer String만 넣으면 빈 공백으로 나누기때문에 주의해야한다.
			StringTokenizer tokenizer = new StringTokenizer(colors,",");
			out.println("토큰 수 : "+tokenizer.countTokens());
			//hhasMorTokens() : 꺼내올 토근이 있으면 true, 없으면 false
			while(tokenizer.hasMoreTokens()){
				//토큰을 꺼내올때는 nextToken()
				String color = tokenizer.nextToken();
				out.println("<h4 style='color:"+color+"'>"+color+"</h4>");
			}
		%>
		
		<h2>JSTL의 forTokens 태그</h2>
		<c:set var="colors" value="<%=colors %>"/>
		<c:forTokens items="${colors }" delims="," var="color">
			<h4 style="color:${color}">${color }</h4>
		</c:forTokens>
		
		
	</fieldset>
</body>
</html>