<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="jumbotron text-center">
	  <h1>데이터분석 SW엔지니어 양성과정</h1>
	  <p>스프링부트를 사용하여, 간단한 게시판을 만들어보자</p>
	</div>
	
	<div class="container">
	  	<div class="panel panel-default">
		  <div class="panel-heading">
		  	<form class="form-inline" action="/web/search" method="get">
		  		<select class="form-control" name="filter" id="sel1">
				    <option value="content">내용</option>
				    <option value="writer">작성자</option>	
				    <option value="title">제목</option>
				  </select>
			  <div class="form-group">
			    <label for="search">검색할 내용 입력 :</label>
			    <input type="text" class="form-control" name="search" id="search">
			  </div>
			  <button type="submit" class="btn btn-default">검색</button>
			  <a href="/web/" class="btn btn-info">전체보기</a>
			</form>
		  
		  </div>
		  <div class="panel-body">
		  	<table class="table table-hover table-striped">
		  		<thead>
		  			<tr>
		  				<th>번호</th>
		  				<th>제목</th>
		  				<th>작성자</th>
		  				<th>작성일</th>
		  				<th>조회수</th>
		  			</tr>
		  		</thead>
		  		<tbody>
		  			<!-- request 영역에 저장되어있는 데이터들을 꺼내서 출력 -->
		  			<c:choose>
		  				<c:when test="${not empty boardList}">
		  					<c:forEach var="board" items="${boardList}">
		  						<tr>
		  							<td>${board.bnum}</td>
		  							<td><a href="selectOne/${board.bnum}">${board.title}</a></td>
		  							<td>${board.writer}</td>
		  							<td>
		  								<fmt:formatDate value="${board.indate}" pattern="yyyy-MM-dd HH:mm"/>
		  							</td>
		  							<td>${board.bcnt}</td>
		  						</tr>
		  					</c:forEach>
		  				
		  				</c:when>
		  				<c:otherwise>
		  					<tr>
		  						<td colspan="5" style="text-align: center;">검색 결과가 없습니다.</td>
		  					</tr>
		  				</c:otherwise>
		  			</c:choose>
		  		</tbody>
	            <tr>
	            	<td colspan="5">
	            		<button class="btn btn-primary btn-sm" onclick="location.href='temp'">테스트</button>
	            		<button class="btn btn-primary btn-sm" onclick="location.href='insert_page'">글쓰기</button>
	            		<button class="btn btn-warning btn-sm" onclick="location.href='crawlin	g'">데이터수집</button>
	            	</td>
	            </tr>
		  	</table>
		  </div>
		</div>
	</div>


</body>
</html>