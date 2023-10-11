<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="../include/importSource.jsp"></jsp:include>

<link rel="stylesheet" href="/resources/css/user/myPage/modifyForm.css">
<link rel="stylesheet" href="/resources/css/user/board/uBoardList.css">
<link rel="stylesheet" href="/resources/css/user/myPage/myPage.css">
<link rel="stylesheet" href="/resources/css/font.css">
<link rel="stylesheet" href="/resources/css/reset.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>즐겨찾는 병원</title>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<main>

		<section style="padding-top: 120px;">
			<div id="wrap" class="clearfix">
				<aside class="aside">
					<h1 class="logo">
						<a href="#">프로필 사진</a>
					</h1>
					<nav class="nav" style="display: block;">
						<ul>
							<li><a href="#">회원관리</a>
								<ul class="subMenu">
									<li><a href="/userInfo/page.do">회원정보조회</a></li>
									<li><a href="/checkPw/page.do">회원정보수정</a></li>
									<li><a href="/delete/page.do">회원탈퇴</a></li>
								</ul></li>
							<li><a href="#">게시글관리</a>
								<ul class="subMenu">
									<li><a href="/userSearchBoard/page.do">게시글 조회</a></li>
									<li><a href="/userSearchBoardReply/page.do">댓글 조회</a></li>
									<li><a href="/userSearchBoardMark/page.do">북마크</a></li>
								</ul></li>
							<li><a href="#">후원관리</a>
								<ul class="subMenu">
									<li><a href="/userSearchSponsor/page.do">후원목록</a></li>
									<li><a href="/userSearchSponsorReply/page.do">후원댓글</a></li>
								</ul></li>
							<li><a href="#">병원관리</a>
								<ul class="subMenu">
									<li><a href="/userSearchHospital/page.do">즐겨찾는 병원</a></li>
									<li><a href="/userSearchHospitalReview/page.do">병원리뷰</a></li>
								</ul></li>
						</ul>
					</nav>
				</aside>
				<section class="contents">
					<div>
						<div class="title">
							<div class="info_img">
								<img src="/resources/images/pet.png">
							</div>
							<div class="info_h1">
								<h1 style="font-size: 1em; font-weight: bold;">즐겨찾는 병원</h1>
							</div>
						</div>
						<div class="info_hr">
							<hr>
						</div>
					</div>
					<div style="margin: 30px 60px 30px 60px;">
						<div id="boardTable" class="board-list">
							<form action="/userSearchHospital/page.do" method="get">
								<div class="filter input-group mb-3">
									<select name="searchCondition" style="border-radius: 20px;">
										<option value="all">전체</option>
										<option value="name">이름</option>
										<option value="id">아이디</option>
										<option value="nickname">닉네임</option>
									</select> <input class="form-control" type="text" name="searchKeyword"
										placeholder="검색"
										style="width: 75%; height: 28px; text-indent: 5px; border-radius: 20px; margin-left: 0; border-color: #FFD370;" />
									<input type="submit" value="검색"
										style="background-color: #ffd370; color: white; border-color: #ffd370; width: 10%; height: 28px; border-radius: 20px; margin-left: 0;">
								</div>
							</form>
						</div>
						<table class="table table-borderd  table-fixed">
							<thead>
								<tr>
									<th style="border-bottom: 1px solid #dee2e6;">No</th>
									<th style="border-bottom: 1px solid #dee2e6;">병원명</th>
									<th style="border-bottom: 1px solid #dee2e6;">주소</th>
									<th style="border-bottom: 1px solid #dee2e6;">전화번호</th>
									<th style="border-bottom: 1px solid #dee2e6;">영업상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${user }" var="uOne" varStatus="i">
									<tr>
										<td>user</td>
										<td>password</td>
										<c:url var="detailUrl" value="/admin/aInfo.do">
											<c:param name="userId" value="${uOne.userId }"></c:param>
										</c:url>
										<td><a href="${detailUrl }">이름</a></td>
										<td>닉네임</td>
										<td>가입일</td>
									</tr>
									<tr>
										<td>user</td>
										<td>password</td>
										<c:url var="detailUrl" value="/admin/aInfo.do">
											<c:param name="userId" value="${uOne.userId }"></c:param>
										</c:url>
										<td><a href="${detailUrl }">이름</a></td>
										<td>닉네임</td>
										<td>가입일</td>
									</tr>
									<tr>
										<td>user</td>
										<td>password</td>
										<c:url var="detailUrl" value="/admin/aInfo.do">
											<c:param name="userId" value="${uOne.userId }"></c:param>
										</c:url>
										<td><a href="${detailUrl }">이름</a></td>
										<td>닉네임</td>
										<td>가입일</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="paging" style="margin-top: 50px;">
							<div>
								<c:if test="${nInfo.nStartNavi != 1}">
									<c:url var="preUrl" value="/notice/n_list.do">
										<c:param name="page" value="${nInfo.nStartNavi -1 }" />
									</c:url>
									<a href="${preUrl }">[이전]</a>
								</c:if>
								<c:forEach begin="${nInfo.nStartNavi }" end="${nInfo.nEndNavi }"
									var="n">
									<c:url var="pageUrl" value="/notice/n_list.do">
										<c:param name="page" value="${n }"></c:param>
									</c:url>
									<a href="${pageUrl }">1 2 3 4 5</a>&nbsp;
                                </c:forEach>
								<c:if test="${nInfo.nEndNavi != nInfo.nNaviTotalCount }">
									<c:url var="nextUrl" value="/notice/n_list.do">
										<c:param name="page" value="${nInfo.nEndNavi +1 }" />
									</c:url>
									<a href="${nextUrl }">[다음]</a>
								</c:if>
							</div>
						</div>
					</div>
			</div>
			</div>
		</section>
		</div>
		</section>


	</main>
	<jsp:include page="../include/footer.jsp"></jsp:include>

	<script>
        // 클릭했을 때
        $(".nav > ul > li > a").click(function (e) {
            e.preventDefault();

            // 현재 클릭한 버튼에 대한 하위 메뉴만 열기
            var subMenu = $(this).next('.subMenu').not(':animated');
            subMenu.slideToggle();

            // 다른 모든 하위 메뉴 닫기
            $(".subMenu").not(subMenu).slideUp();
        });

    </script>
</body>
</html>