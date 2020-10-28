<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" 
href="css/common.css"/>
<link type="text/css" rel="stylesheet" 
href="css/login.css"/>

<style type="text/css">
	#bbs table {
	    width:580px;
	    margin-left:10px;
	    border:1px solid black;
	    border-collapse:collapse;
	    font-size:14px;
	    
	}
	
	#bbs table caption {
	    font-size:20px;
	    font-weight:bold;
	    margin-bottom:10px;
	}
	
	#bbs table th,#bbs table td {
	    text-align:center;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	.no {width:15%}
	.subject {width:30%}
	.writer {width:20%}
	.reg {width:20%}
	.hit {width:15%}
	.title{background:lightsteelblue}
	
	.odd {background:silver}
	
	/* paging */
	
	table tfoot ol.paging {
	    list-style:none;
	}
	
	table tfoot ol.paging li {
	    float:left;
	    margin-right:8px;
	}
	
	table tfoot ol.paging li a {
	    display:block;
	    padding:3px 7px;
	    border:1px solid #00B3DC;
	    color:#2f313e;
	    font-weight:bold;
	}
	
	table tfoot ol.paging li a:hover {
	    background:#00B3DC;
	    color:white;
	    font-weight:bold;
	}
	
	.disable {
	    padding:3px 7px;
	    border:1px solid silver;
	    color:silver;
	}
	
	.now {
	   padding:3px 7px;
	    border:1px solid #ff4aa5;
	    background:#ff4aa5;
	    color:white;
	    font-weight:bold;
	}
	
	.empty{ height: 50px; }
		
</style>

</head>
<body>
<div id="wrap">
	<!-- 상단 영역 -->
	<div id="header">
		<h1>SK Together</h1>
		<ul class="gnb">
			<li><a href=""><span class="menu m01">기브유</span></a></li>
			<li><a href=""><span class="menu m02">위드유</span></a></li>
			<li><a href=""><span class="menu m03">스마트 전통시장</span></a></li>
			<li><a href=""><span class="menu m04">BRAVO!</span></a></li>
			<li><a href=""><span class="menu m05">SKT와 사회공헌</span></a></li>
		</ul>
	</div>
	<!-- 상단 영역 끝 -->
	<!-- 콘텐츠 영역 -->
	<div id="contents_sub">
		<h1 style="font-size: 30px; color: #000; margin-bottom: 20px;">SKT와 사회공헌</h1>
		<div class="bbs_area" id="bbs">
		<table summary="게시판 목록">
			<caption>게시판 목록</caption>
			<thead>
				<tr class="title">
					<th class="no">번호</th>
					<th class="subject">제목</th>
					<th class="writer">글쓴이</th>
					<th class="reg">날짜</th>
					<th class="hit">조회수</th>
				</tr>
			</thead>
			
			<tfoot>
                      <tr>
                          <td colspan="4">
                              ${p_code }
                          </td>
						  <td>
							<input type="button" value="글쓰기"
			onclick="javascript:location.href='Controller?type=write'"/>
						  </td>
                      </tr>
                  </tfoot>
			<tbody>
			<c:if test="${ar ne null }">
				<c:forEach var="vo" items="${requestScope.ar }" varStatus="st">
				<tr>
					<td>${rowTotal - st.index }</td>
					<td style="text-align: left">
						<a href="Controller?type=view&cPage=${nowPage }&b_idx=${vo.b_idx}">${vo.subject }</a></td>
					<td>${vo.writer }</td>
					<td>
					<c:if test="${vo.write_date ne null }">
						${fn:substring(vo.write_date, 0, 10) }
					</c:if>
					</td>
					<td>${vo.hit }</td>
				</tr>
				</c:forEach>
			</c:if>
			<c:if test="${ar eq null }">
				<tr>
					<td colspan="5" class="empty">
						등록된 게시물이 없습니다.
					</td>
				</tr>
			</c:if>
			</tbody>
		</table>
		</div>
	</div>
	<!-- 콘텐츠 영역 끝-->
	<!-- 하단영역 -->
	<div id="footer">
		<div class="footer_area">
			<ul class="foot_guide">
				<li><a href="">개인정보취급방침</a></li>
				<li><a href="">회원이용약관</a></li>
				<li><a href="">책임한계와 법적고지</a></li>
				<li><a href="">이메일 무단수집 거부</a></li>
			</ul>
			<address>
				서울특별시 무슨구 아무길 100번지
				대표이사: 마루치
				고객상담: 국번없이 004 혹은 02-1234-1234 (평일 09:30~17:00)
			</address>
			<p class="copyright">
				COPYRIGHT (c) 2020 SK Telecom. All rights reserved.
			</p>
		</div>
	</div>
	<!-- 하단영역 끝-->
</div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

<script>

	$(function() {
		
		// 아이디ㅏ login_btn인 요소에 클릭 이벤트 등록
		$("#login_btn").bind("click", function() {
			
			
			// 현재 문서에서 아이디가 s_id와 s_pw인 요서의 값을 얻어낸다. 
			var id = $("#s_id").val();
			var pw = $("#s_pw").val();
			
			if(id.trim().length <1){
				// 하나도 입력하지 않은 경우 또는 공백만 입력한 경우
				alert("아이디를 입력하세요");
				$("#s_id").val("");
				$("#s_id").focus();
				return;
			}

			if(pw.trim().length <1){
				// 하나도 입력하지 않은 경우 또는 공백만 입력한 경우
				alert("비밀번호를 입력하세요");
				$("#s_pw").val("");
				$("#s_pw").focus();
				return;
			}
			
			//console.log(id+"/"+pw);
			
			// 비동기식 통신수행한다.ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
			
			$.ajax({
				url: "login", 
				type: "post",
				data: "m_id="+encodeURIComponent(id)+"&m_pw="+encodeURIComponent(pw),
				dataType:"json"
			
			}).done(function(data) {
				// 요청에 성공했을 때 
				// alert(data.res); // data.res값이 1이면 정상 로그인이 된 경우
									// 0이면 아이디 및 비밀번호가 틀린경우
				if(data.res == "1"){
					alert(data.mvo.m_name+"님 환영합니다. 처음화면으로 이동합니다.");
					location.href="/";
				}else{
					alert("아이디 또는 비밀번호가 다릅니다. ");
				}
					
				
			});				
		});
		
	});
	function exe(){
		//var id = document.forms[0].id.value;
		var id = document.getElementById("s_id").value;
		var pw = document.getElementById("s_pw").value;
		if(id.length < 4){
			alert("아이디를 정확하게 입력하세요!");
			return;
		}
		if(pw.length < 4){
			alert("비밀번호를 입력하세요!");
			return;
		}
		document.forms[0].submit();
	}
</script>
</body>
</html>










