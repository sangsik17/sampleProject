<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/view/include/header.jspf"%>
<link rel="stylesheet" href="/css/member.css">
<title>SampleProject - 회원가입</title>
</head>
<body>
	<div class="container">
		<header>
			<h1>
				<a href="/">SampleProject</a>
			</h1>
		</header>
		<section class="content">
			<%@ include file="/WEB-INF/view/include/navigation.jsp"%>
			<main>
			<div class="box-small">
				<form:form modelAttribute="member" method="post" autocomplete="false">
					<div class="form-box">
						<div class="input-box">
							<form:input path="memberId" class="form-control" placeholder="아이디" maxlength="15" />
							<div class="info">
								<form:errors path="memberId" cssClass="errorMessage" />
							</div>
						</div>
						<div class="input-box">
							<form:password path="memberPassword" class="form-control" placeholder="비밀번호" maxlength="15" />
							<div class="info">
								<form:errors path="memberPassword" cssClass="errorMessage" />
							</div>
						</div>
						<div class="input-box">
							<form:password path="confirmPassword" class="form-control" placeholder="비밀번호 확인" maxlength="15" />
							<div class="info">
								<form:errors path="confirmPassword" cssClass="errorMessage" />
							</div>
						</div>
					</div>
					<div class="form-box">
						<div class="input-box">
							<form:input path="memberName" class="form-control" placeholder="이름" maxlength="10" />
							<div class="info">
								<form:errors path="memberName" cssClass="errorMessage" />
							</div>
						</div>
						<div class="input-box">
							<form:input path="memberEmail" class="form-control" placeholder="이메일 (선택)" maxlength="30" />
							<div class="info">
								<form:errors path="memberEmail" cssClass="errorMessage" />
							</div>
						</div>
					</div>
					<button class="btn btn-default btn-block" id="btn-register">회원가입</button>
				</form:form>
			</div>
			</main>
		</section>
		<footer>
			<a href="#">홈페이지</a>
		</footer>
	</div>
	<script src="/js/member.js"></script>
</body>
</html>
