<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%-- core 라이브러리 적용 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery 3.7.0 적용 -->
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<!-- BootStrap 5.3.1  및 4.6.2 적용 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<title>DCSLR</title>
<script type="text/javascript">
	$(function() {
		console.log('${id}');
	});
</script>
</head>
<body>
	<%@ include file="../NavBar.jsp" %>
	<div>
	<br/><br/>
	</div>
	<div style="text-align: center;">
	<h2>공지사항</h2>
	</div>
	<!-- 목록 테이블 -->
	<table border="1" class="table table-hover" style="width: 80%; margin: auto;">
		 <thead class="table-dark">
		<tr>
			<th width="10%">번호</th>
			<th width="*" style="text-align: center;">제목</th>
			<th width="15%">작성자</th>
			<th width="10%">조회수</th>
			<th width="15%">작성일</th>
			<th width="8%">첨부</th>
		</tr>
		</thead>
		
		<!-- 게시물이 없을 때 -->
		<c:choose>
			<c:when test="${ empty boardLists }">
				<tr>
					<td colspan="6" align="center">등록된 게시물이 없습니다^^*</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${ boardLists }" var="row" varStatus="loop" >
					<tr align="center"></tr>
					<td>
						${ map.totalCount -(((map.pageNum-1)*map.pageSize)+loop.index)} 
					</td>
					<td align="left"><a href=" ../noticeboard/lookup.do?notino=${row.notino }">${row.title }</a></td>
					<td>${row.nickname }</td>
					<td>${row.visitcount }</td>
					<td>${row.postdate }</td>
					<td>
						<c:if test="${not empty row.ofile }">
							<a href="../noticeboard/download.do?ofile=${row.ofile }&nfile=${row.nfile}&notino=${row.notino}">
							[Down]
							</a>
						</c:if>
					</td>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
		<!-- 검색자 -->
	<form method="get">
		<table border="1" class="table table-hover" style="width: 80%; margin: auto;">
			<tr>
				<td align="center"><select name="searchField">
						<option value="title">제목</option>
						<option value="content">내용</option>
				</select> <input type="text" name="searchWord" /> <input type="submit"
					value="검색하기" /></td>
			</tr>
		</table>
	</form>
	<!-- 하단메뉴(바로가기, 글쓰기 -->
	<table style="width:80%; border: none; margin:auto;">
		<tr align="center">
			<td>${map.pagingImg }</td>
	<c:if test="${ id eq 'admin' }">
			<td width="100"><button type="button" class="btn btn-outline-secondary btn-sm"
					onclick="location.href='../noticeboard/write.do';">글쓰기</button></td>
	</c:if>
		</tr>
	</table>
</body>
</html>