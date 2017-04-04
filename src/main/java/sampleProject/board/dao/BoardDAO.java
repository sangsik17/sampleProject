package sampleProject.board.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import sampleProject.board.domain.Article;
import sampleProject.common.dao.AbstractDAO;

@Repository("boardDAO")
public class BoardDAO extends AbstractDAO {

    @SuppressWarnings("unchecked")
    public List<Article> selectArticles() throws Exception {
        return selectList("board.selectArticles");
    }

    public Article selectArticle(Article article) throws Exception {
        return (Article) selectOne("board.selectArticle", article);
    }

    public void insertArticle(Article article) throws Exception {
        insert("board.insertArticle", article);
    }

    public void updateHit(Article article) throws Exception {
        update("board.updateHit", article);
    }

    public void updateDeleteDate(Article article) throws Exception {
        update("board.updateDeleteDate", article);
    }

    public void updateArticle(Article article) throws Exception {
        update("board.updateArticle", article);
    }

    public void deleteAll() throws Exception {
        deleteAll("board.deleteAll");
    }

}
