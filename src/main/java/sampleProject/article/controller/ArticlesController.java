package sampleProject.article.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import sampleProject.article.service.ArticleService;
import sampleProject.article.vo.Article;

@Controller
@RequestMapping(value = "/articles")
public class ArticlesController {
    Logger LOG = Logger.getLogger(this.getClass());

    @Resource
    private ArticleService articleService;

    @RequestMapping(value = { "/{articleCategory}" }, method = RequestMethod.GET)
    public String articleList(HttpServletRequest req, Model model, @PathVariable String articleCategory,
            @RequestParam(value = "currentPageNo", required = false) Integer currentPageNo,
            @RequestParam(value = "articleTag", required = false) String articleTag) throws Exception {

        // 요청한 게시판이 존재하는지 확인 후 목록 검색
        if (articleService.hasArticleCategory(articleCategory)) {
            Map<String, Object> map = new HashMap<String, Object>();

            map.put("currentPageNo", currentPageNo);
            map.put("articleCategory", articleCategory);
            map.put("articleTag", articleTag);
            map = articleService.getArticles(map);

            model.addAttribute("result", map);
            return "article/articleList";
        } else {
            return "/common/main";
        }
    }

    @RequestMapping(value = "/{articleCategory}/write", method = RequestMethod.GET)
    public String articleWriteForm(Model model, @PathVariable String articleCategory) throws Exception {

        // 요청한 게시판이 존재하는지 확인 후 글쓰기 폼을 설정
        if (articleService.hasArticleCategory(articleCategory)) {
            model.addAttribute("article", new Article());
            model.addAttribute("articleCategory", articleCategory);
            model.addAttribute("articleTags", articleService.getArticleTags(articleCategory));
            return "article/articleWrite";
        }
        return "common/pageNotFound";
    }

    @RequestMapping(value = "/{articleCategory}/write", method = RequestMethod.POST)
    public ModelAndView articleWrite(@Valid Article article, BindingResult bindingResult, ModelAndView modelAndView, Principal principal)
            throws Exception {

        if (bindingResult.hasErrors()) {
            /*
             * modelAndView.setViewName("redirect:/articles/" +
             * article.getArticleCategory() + "/write");
             */
            modelAndView.addObject("articleTags", articleService.getArticleTags(article.getArticleCategory()));
            modelAndView.setViewName("/article/articleWrite");
        } else {
            // 사용자를 시큐리티 객체에서 가져옴
            article.setArticleWriter(principal.getName());
            articleService.setArticle(article);
            /*
             * modelAndView.addObject("article",
             * articleService.setArticle(article));
             */
            modelAndView.setViewName("redirect:/article/" + article.getArticleId());
        }
        return modelAndView;
    }

}
