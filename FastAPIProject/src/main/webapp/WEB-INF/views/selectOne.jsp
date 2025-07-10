<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세 보기</title>

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
		  <div class="panel-heading">데이터분석과정 게시판</div>
		  <div class="panel-body">
		  		<table class="table table-bordered table-striped">
		  		<c:if test="${not empty boardVO}">
		  			<tr>
		  				<th>제목</th>
		  				<td>
							${boardVO.title}
		  				</td>
		  			</tr>
		  			
		  			<tr>
		  				<th>작성자</th>
		  				<td>
							${boardVO.writer}
		  				</td>
		  			</tr>
		  			
		  			<tr>
		  				<th>내용</th>
		  				<td>
							${boardVO.content}
		  				</td>
		  			</tr>
		  			
		  			<tr>
		  				<th>작성일</th>
		  				<td>
							<fmt:formatDate value="${boardVO.indate}" pattern="yyyy-MM-dd HH:mm"/>
		  				</td>
		  			</tr>
		  			
		  			<tr>
		  				<th>조회수</th>
		  				<td id="bcnt">
							${boardVO.bcnt}
		  				</td>
		  			</tr>
		  			
				  <tr>
	            	<td colspan="2">
	            		<button class="btn btn-primary btn-sm">작성</button>
	            		<a href="javascript:history.back()" class="btn btn-default btn-sm">취소</a>
	            	</td>
	            </tr>
		        </c:if>
		        
		        <c:if test="${empty boardVO}">
		          <tr>
		            <td colspan="2" class="text-center">게시글을 찾을 수 없습니다.</td>
		          </tr>
		        </c:if>    
		  	</table>
		  </div>
		</div>
	</div>
	
	<script type="text/javascript">
		// js 작성 공간
		$(document).ready(function() {
		    // 페이지 로드 시 실행
		    let bnum = '${boardVO.bnum}';
		    console.log("게시글 번호:", bnum);
		    
		    // 값이 비어있거나 숫자가 아니면 실행하지 않음
		    if(!bnum || isNaN(bnum)) {
		        console.error("유효한 게시글 번호가 아닙니다:", bnum);
		        return;
		    }
		    
		    $.ajax({
		        url: '${pageContext.request.contextPath}/count',
		        type: 'POST',
		        data: { bnum: bnum },
		        success: function(response) {
		            let bcnt = parseInt($('#bcnt').text().trim());
		            $('#bcnt').text(bcnt + 1);
		        },
		        error: function(xhr, status, error) {
		            console.error('조회수 업데이트 실패:', error);
		            console.error('상태:', status);
		            console.error('XHR:', xhr.responseText);
		        }
		    });
		});
	</script>
</body>
</html>
