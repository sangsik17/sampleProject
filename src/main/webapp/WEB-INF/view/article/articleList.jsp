<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/view/include/header.jspf"%>
<link rel="stylesheet" href="/css/article.css">
<title>SampleProject - ${articleCategory}</title>
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
			<div>
				<input type="hidden" id="articleCategory" value="${articleCategory }" />
				<input type="hidden" id="articleTag" value="${result.articleTag }" />
			</div>
			<div class="article-control">
				<a class="btn btn-default" href="/articles/${articleCategory}/write">글쓰기</a>
			</div>
			<ul class="article-list">
				<c:choose>
					<c:when test="${empty result.articles}">
						<li>
							<div class="text-center">등록된 글이 없습니다.</div>
						</li>
					</c:when>
					<c:when test="${!empty result.articles }">
						<c:forEach items="${result.articles}" var="article">
							<li class="article-wrap">
								<div class="article-title-wrap">
									<div>
										<span>#${article.articleId }</span>
										<c:if test="${not empty article.articleTag }">
											<!-- query string encoding -->
											<c:url value="/articles/${articleCategory }" var="url">
												<c:param name="articleTag" value="${article.articleTag }" />
											</c:url>
											<span>
												<a href="${url }"><span class="tag">${article.articleTag }</span></a>
											</span>
										</c:if>
										<span class="article-info">
											<span>${article.articleWriterName }</span>
											<span class="articleInsertDate" title="${article.articleInsertDate }"></span>
											<span>${article.articleHit}hit</span>
										</span>
									</div>
									<div>
										<span>
											<a href="/article/${article.articleId }"> ${article.articleTitle }</a>
										</span>
										<c:if test="${article.commentCount ne 0 }">
											<span class="comment-count">${article.commentCount }</span>
										</c:if>
									</div>
								</div>
								<div class="article-info-wrap">
									<div>${article.articleWriterName }</div>
									<div>
										<span class="articleInsertDate" title="${article.articleInsertDate }"></span>
										<span class="text-right">${article.articleHit}hit</span>
									</div>
								</div>

							</li>
						</c:forEach>
					</c:when>
				</c:choose>
			</ul>
			<div class="text-center">
				<c:if test="${not empty result.articles && not empty result.paginationInfo}">
					<ui:pagination paginationInfo="${result.paginationInfo}" type="text" jsFunction="fn_search" />
				</c:if>
			</div>
			</main>
		</section>
		<footer>
			<a href="#">홈페이지</a>
		</footer>
	</div>
	<script>
		$(document).ready(function() {
			$.fn.setDate = function() {
				return this.each(function() {
					var str = date_calculator($(this).attr('title'));
					$(this).text(str);
				}
				);
			}
			;
			$('.articleInsertDate').setDate();
		});
	
		function fn_search(pageNo) {
			var articleCategory = $('#articleCategory').val();
			var articleTag = $('#articleTag').val();
			var prefix = "/";
			var suffix = "";
			if (articleCategory != '' && articleCategory != null) {
				prefix = "/articles/" + articleCategory + "?currentPageNo=" + pageNo;
			}
			if (articleTag != '' && articleTag != null) {
				suffix = "&articleTag=" + articleTag;
			}
			location.href = prefix + suffix;
		}
	</script>
</body>
</html>