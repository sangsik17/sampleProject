<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/view/include/header.jspf"%>
<link rel="stylesheet" href="/css/article.css">
<title>SampleProject - 글작성</title>
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
			<main> <input type="hidden" id="articleCategory" value="${articleCategory }" />
			<div class="box-medium">
				<form:form modelAttribute="article" mthod="post" autocomplete="false">
					<div class="form-box">
						<c:choose>
							<c:when test="${!empty articleTags }">
								<div class="input-box">
									<select name="articleTag" class="form-control">
										<option value="">선택하세요</option>
										<c:forEach items="${articleTags}" var="articleTag">
											<option>${articleTag }</option>
										</c:forEach>
									</select>
								</div>
							</c:when>
						</c:choose>
						<div class="input-box">
							<form:input path="articleTitle" class="form-control" placeholder="제목" maxlength="50" required="required" />
						</div>
					</div>
					<div class="form-box">
						<div class="input-box">
							<form:textarea path="articleContent" class="form-control" placeholder="내용" rows="10" required="required" />
						</div>
					</div>
					<button class="btn btn-default btn-block" id="btn-register">작성</button>
				</form:form>
			</div>
			</main>
		</section>
		<footer>
			<a href="#">홈페이지</a>
		</footer>
	</div>
</body>
</html>