<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		  <div class="panel-heading">데이터분석과정 게시판</div>
		  <div class="panel-body">
		  	
		  		<table class="table table-bordered table-striped">
		  			<tr>
		  				<th>수집하고 싶은 데이터 검색</th>
		  				<td>
							<input type="text" class="form-control" id="data">
		  				</td>
		  			</tr>
	
		  			
				 <tr>
	            	<td colspan = "2">
	            		<button  class="btn btn-warning btn-sm" id ="request">요청하기</button>
	            		<a href="${pageContext.request.contextPath}/web/" class="btn btn-default btn-sm">취소</a>
	            	</td>
            	</tr>
            	
	            <tr>
	            	<td colspan = "2" id = img_content>
	            		
	            	</td>
           		</tr>
           		
		  	</table>
		  	
		  </div>
		</div>
	</div>
	


	<script type="text/javascript">
		//1. 버튼을 클릭하면 비동기 통신으로 python 쪽에 요청을 보내기
	    $("button").on("click", () => {
	    	// 2. input 태그에 입력한 데이터를 가지고 와서
	    	let sendData = $('#data').val();
	     	console.log("요청 데이터 정보>>", sendData);
	     	// 3. 비동기 통신으로 python 쪽으로 요청 보내기
	        $.ajax({
	            url: 'http://127.0.0.1:8000/temp',
	            type: 'GET',
	            data: { sendData: sendData },
	            success: (res) => {
	            	// 4. 성공했다면, success 라면 글자를 받아와서 console에 찍어주기
	                console.log("요청 성공>>",res);
	            	let src = res.img_src;
	            	// 백틱 사용시 자바파일로 읽을때 자바 변수를 사용할수있기 때문에
	            	// \ 사용해 el 표현식을 무시해야한다
	            	let img = `<img src='\${src}'>`
	            	$("#img_content").append(img);
	            },
	            error: (e) => {
	                console.log("요청 실패>>", e);
	            }
	        });
	    });
	</script>



</body>
</html>