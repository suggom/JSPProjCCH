<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/Common/IsValidate.jsp" %>
<!--  ForwardRedirectExamProcess.jsp -->
<%
	
	//파라미터 받기]
	String id = request.getParameter("id");
	if(!isValidate(out,id,"아이디를 입력하세요?")) return;
	String pwd = request.getParameter("pwd");
	if(!isValidate(out,pwd,"비밀번호를 입력하세요?")) return;

	//리퀘스트 영역에 아이디와 비번 저장:포워드로 전달하는 경우 아래 코드는 불필요(아이디 비번 불일치시). 파라미터가 그대로 전달됨으로
	request.setAttribute("id", id);
	request.setAttribute("pwd", pwd);
	
	
	//가정:아이디가 KIM ,비번이 1234이면 회원
	if("KIM".equals(id.trim()) && "1234".equals(pwd.trim())){
		//1.sendRedirect로 페이지 이동하기
		//response.sendRedirect("ForwardRedirectExamMyPage.jsp");
		//2.포워드로 이동하기. 이때는 리퀘스트영역에 저장하기
		request.getRequestDispatcher("ForwardRedirectExamMyPage.jsp").forward(request, response);
	}
	else{//아이디 및 비번 불일치
		//1.sendRedirect로 페이지 이동하기
		//response.sendRedirect("ForwardRedirectExample.jsp");
		//2.포워드로 이동하기:입력한 값을 유지하기위해
		//에러 메시지 리퀘스트 영역에 저장
		request.setAttribute("errorMsg","아이디와 비번 불일치");
		request.getRequestDispatcher("ForwardRedirectExample.jsp").forward(request, response);
	}
	
%>