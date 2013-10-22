package org.nhnnext.web;



import java.util.List;

import org.nhnnext.repository.BoardRepository;
import org.nhnnext.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import support.FileUploader;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardRepository boardRepository;
	
	@Autowired
	private CommentRepository commentRepository;
	
	@RequestMapping("/form")
	public String form() {
		//board라는 변수가 없으므로 board라는 변수를 사용하는 것은 전부 ""로 뜬다.
		return "form";
	}
	
   //list로 보내는 메소
	@RequestMapping("/list")
	public String list(Model model) {
		
		Iterable<Board> iterable = boardRepository.findAll();
		model.addAttribute("list", iterable);
		return "list";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(Board board, MultipartFile file) {
		String fileName = FileUploader.upload(file);
		board.setFileName(fileName);
		
		Board savedBoard = boardRepository.save(board);
		//return  "redirect:http://www.naver.com" /*"form"*/;// redirect의 경우 정보 재전송 없이 새로고침이 가능
		//return "form";
		return "redirect:/board/" + savedBoard.getId();
	}
	
	@RequestMapping("/{id}")
	public String show(@PathVariable Long id, Model model){
		Board findedBoard = boardRepository.findOne(id);
		model.addAttribute("board",findedBoard);
		return "show";
	}
	
	@RequestMapping("/{id}/modify")
	public String modify(@PathVariable Long id, Model model){
		Board findedBoard = boardRepository.findOne(id);
		model.addAttribute("board", findedBoard);
		model.addAttribute("modify", 1);
		return "form";
	}
	
	@RequestMapping("/{id}/delete")
	public String delete(@PathVariable Long id, Model model){
		Board findedBoard = boardRepository.findOne(id);
		List<Comment> commentList= findedBoard.getComments();
		if(commentList != null){
			for(Comment comment : commentList) {
				commentRepository.delete(comment);
			}
		}

		boardRepository.delete(findedBoard);
		return "redirect:/board/list"; 
	}
}
