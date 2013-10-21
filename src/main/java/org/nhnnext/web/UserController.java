package org.nhnnext.web;


import org.nhnnext.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserController {
	
	@Autowired
	private UserRepository userRepository;
	
	@RequestMapping (value = "/login", method = RequestMethod.POST)
	public String login(@PathVariable String id, String password){
		Iterable<User> iterable = userRepository.findAll();
		//db에서 가지고 온 user객체의 id와 비교 
		if(iterable.equals(id)){
			if(iterable.equals(password)){
				return "list";
			}
			return "/login";
		} else {
			return "/login";
		}
	}
	//join에서 가지고 오는 id와 비밀 번호를 저장한다. 
	public String signUp(){
		
		return null;
	}
}
