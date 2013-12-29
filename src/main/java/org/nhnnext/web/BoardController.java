package org.nhnnext.web;



import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import org.nhnnext.repository.BoardRepository;
import org.nhnnext.repository.CommentRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	private static final Logger log = LoggerFactory
			.getLogger(BoardController.class);
	@Autowired
	private BoardRepository boardRepository;
	
	@Autowired
	private CommentRepository commentRepository;
	
	
	
   //list로 보내는 메소드 
	@RequestMapping("/list")
	public String list(Model model) {
		
		Iterable<Board> iterable = boardRepository.findAll();
		
		ArrayList<Board> boardList = new ArrayList<Board>();
		Iterator iterator = iterable.iterator();
		while(iterator.hasNext()){
			boardList.add(0,(Board) iterator.next());
		}
		
		model.addAttribute("list", boardList); //모델은 키밸류 쌍으로 이루어져서 (이름, 값 )
		
		return "list";
	}
	
	@RequestMapping(value = "/writing")
	public String writing(){
		return "write";
	}
	
	@RequestMapping(value = "/write", method=RequestMethod.POST)
	public String write(Board board, MultipartFile file) {
		String fileName = FileUploader.upload(file);
		board.setFileName(fileName);
		//여기에서 세션이용해서 유저 아이디를 찾아서 넣는다. 
		Board savedBoard = boardRepository.save(board);
		log.debug("board : {}", board);
		//return  "redirect:http://www.naver.com" /*"form"*/;// redirect의 경우 정보 재전송 없이 새로고침이 가능
		//return "form";
		return "redirect:/board/list";
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
//		model.addAttribute("modify", 1);
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
		findedBoard.getComments().clear();
		boardRepository.delete(findedBoard);

		return "redirect:/board/list"; 
	}
}
