package com.odh.todo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.odh.todo.C;
import com.odh.todo.beans.memberDTO;
import com.odh.todo.command.Command;
import com.odh.todo.command.JoinCommand;
import com.odh.todo.command.TodoCommand;
import com.odh.todo.command.loginCommand;

@Controller
public class MainController {
	private Command cmd;
	private SqlSession sqlSession;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		C.sqlSession = sqlSession;
	}
	
	@RequestMapping(value="/login")
	public String login(Model model) {
		return "member/login";
	}
	
	@RequestMapping(value="/loginOk", method=RequestMethod.POST)
	public String loginOk(String id, String pw, Model model, HttpServletRequest request, HttpSession session) {
		
		model.addAttribute("id", id);
		model.addAttribute("pw", pw);
		cmd = new loginCommand();
		cmd.execute(model);
		
		session = request.getSession();
		
		if((Integer)model.getAttribute("result") == 1) {
			session.setAttribute("mid", model.getAttribute("mid"));
			session.setAttribute("id", model.getAttribute("id"));
		}
		
		return "member/loginOk";
	}
	
	@RequestMapping(value="/logout")
	public String logout() {
		return "member/logout";
	}
	
	@RequestMapping(value="/join")
	public String join() {
		return "member/join";
	}
	
	@RequestMapping(value = "/joinOk", method=RequestMethod.POST)
	public String joinOk(Model model, String id, String pw) {
		memberDTO dto = new memberDTO();
		dto.setId(id);
		dto.setPw(pw);
		model.addAttribute("dto", dto);
		new JoinCommand().execute(model);
		return "member/joinOk";
	}
	
	@RequestMapping(value="/list/{mid}")
	public String todo(Model model, @PathVariable("mid")int mid) {	
		model.addAttribute("mid", mid); 
		new TodoCommand().execute(model);
		return "todo";
	}
}