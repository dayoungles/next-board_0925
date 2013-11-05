package org.nhnnext.web;

import org.nhnnext.repository.BoardRepository;
import org.nhnnext.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CommentController {
	
	@Autowired
	private CommentRepository commentRepository;
	@Autowired
	private BoardRepository boardRepository;
	
	@RequestMapping(value = "/board/{id}/comments",method = RequestMethod.POST)
	public String create(@PathVariable Long id, String contents){
		Board board = boardRepository.findOne(id);
		Comment comment = new Comment(board, contents);
		commentRepository.save(comment);
		return "redirect:/board/list";
	}
}
