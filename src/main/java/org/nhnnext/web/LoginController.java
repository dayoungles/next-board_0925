package org.nhnnext.web;

import javax.servlet.http.HttpSession;

import org.nhnnext.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/user")
public class LoginController {

	@Autowired
	private UserRepository userRepository;

	@RequestMapping("/login")
	public String form() {
		return "login";
	}
	
	@RequestMapping("/signup")
	public String signup_form() {
		return "signup";
	}
	@RequestMapping(value = "/login_check", method = RequestMethod.POST)
	public String login(String id, String password, HttpSession session) {
		// TODO userId에 해당하는 사용를 데이터베이스에서 조회
		User foundUser = userRepository.findOne(id);

		// db에서 가지고 온 user객체의 id와 비교

		if (password.equals(foundUser.getPassword())) {
			session.setAttribute("userId", id);
			return "redirect:/board/list";
		} else {
			System.out.println("wrong password");
			return "redirect:/user/login";
		}
		// TODO 사용자가 입력한 비밀번호와 데이터베이스에서 조회한 사용자 비밀번호가 같은지 확인
	}

	// signUp에서 가지고 오는 id와 비밀 번호를 저장한다.
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String signUp(User user) {
		userRepository.save(user);
		return "redirect:/user/login";
	}


}
