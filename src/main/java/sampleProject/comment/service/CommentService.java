package sampleProject.comment.service;

import java.util.List;

import sampleProject.comment.vo.Comment;

public interface CommentService {
    Boolean setComment(Comment comment) throws Exception;
    List<Comment> getComments(Integer articleId)throws Exception;
}
