<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 화면</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/footer.css" />
<style>
section {
  height: 500px;
}
</style>
</head>
<body>
  <%@include file="/include/header.jsp"%>
  <section><h3>메인화면임</h3></section>
  <%@include file="/include/footer.jsp"%>
<!-- 메인페이지 게시판1 클릭시 sampletb의 입력값을 받는 화면 출력(글쓰기?)
사용자가 입력한 후 저장버튼을 누르면 sampletb 테이블에 insert한뒤 index.jsp로 이동.
insert 실패시 다시 등록페이지로 이동 -->
</body>
</html>