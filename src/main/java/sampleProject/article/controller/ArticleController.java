package sampleProject.article.controller;

import java.security.Principal;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import sampleProject.article.service.ArticleService;
import sampleProject.article.vo.Article;
import sampleProject.comment.service.CommentService;

@Controller
@RequestMapping(value = "/article")
public class ArticleController {
    Logger LOG = Logger.getLogger(this.getClass());

    @Resource
    private ArticleService articleService;
    
    @Resource
    private CommentService commentService;

    @RequestMapping(value = "/{articleId}", method = RequestMethod.GET)
    public ModelAndView viewArticle(ModelAndView modelAndView, @PathVariable Integer articleId) throws Exception {

        Article article = articleService.getArticle(new Article(articleId));

        if (article != null) {
            // 게시물 읽기 뷰페이지 지정
            modelAndView.addObject("article", article);
            modelAndView.addObject("comments", commentService.getComments(article.getArticleId()));
            modelAndView.setViewName("/article/articleDetail");
        } else {
            // 게시물 없음 뷰페이지 지정
            modelAndView.setViewName("/common/pageNotFound");
        }
        return modelAndView;
    }

    @RequestMapping(value = "/edit/{articleId}", method = RequestMethod.GET)
    public ModelAndView editArticleForm(ModelAndView modelAndView, Principal principal, @PathVariable Integer articleId) throws Exception {

        // edit 요청한 사용자와 게시물 id를 검색조건으로 하여 해당사용자가 맞는지 확인 후 view 리턴
        Article article = articleService.getArticle(new Article(articleId, principal.getName()));
        if (article != null) {
            modelAndView.addObject("article", article);
            modelAndView.addObject("articleTags", articleService.getArticleTags(article.getArticleCategory()));
            modelAndView.setViewName("/article/articleEdit");
        } else {
            modelAndView.setViewName("/common/main");

        }
        return modelAndView;
    }

    @RequestMapping(value = "/edit/{articleId}", method = RequestMethod.POST)
    public ModelAndView editArticle(@Valid Article article, BindingResult bindingResult, ModelAndView modelAndView, Principal principal)
            throws Exception {

        if (bindingResult.hasErrors()) {
            // 바인딩 에러처리
            modelAndView.addObject("articleTags", articleService.getArticleTags(article.getArticleCategory()));
            modelAndView.setViewName("/article/articleEdit");
        } else {
            // 로그인 사용자를 article 객체에 넣서 edit query 실행
            article.setArticleWriter(principal.getName());
            if (articleService.editArticle(article)) {
                modelAndView.addObject("article", articleService.getArticle(article));
                modelAndView.setViewName("/article/articleDetail");
            } else {
                // update 에러 처리
                modelAndView.setViewName("/common/serverError");
            }
        }
        return modelAndView;
    }

    @RequestMapping(value = "/delete/{articleId}", method = RequestMethod.POST)
    public ModelAndView deleteArticlePost(@PathVariable Integer articleId, ModelAndView modelAndView, Principal principal, Article article)
            throws Exception {

        if (articleService.deleteArticle(new Article(articleId, principal.getName()))) {
            // 성공처리
            modelAndView.setViewName("redirect:/articles/" + article.getArticleCategory());
        } else { // delete 에러 처리
            modelAndView.setViewName("/common/serverError");
        }
        return modelAndView;
    }

}
