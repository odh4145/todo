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
import com.odh.todo.beans.todoDTO;
import com.odh.todo.command.Command;
import com.odh.todo.command.JoinCommand;
import com.odh.todo.command.TodoCommand;
import com.odh.todo.command.actCommand;
import com.odh.todo.command.allCommand;
import com.odh.todo.command.goActCommand;
import com.odh.todo.command.goDeleteCommand;
import com.odh.todo.command.insertCommand;
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
	
	// 로그인 관련
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
	
	@RequestMapping(value="/loginCheck")
	public String loginCheck() {
		return "member/loginCheck";
	}
	
	
	// 회원가입 관련
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
	
	
	// todo list 목록
	@RequestMapping(value="/list/{mid}")
	public String todo(Model model, @PathVariable("mid")int mid) {	
		model.addAttribute("mid", mid); 
		new TodoCommand().execute(model);
		return "todo";
		
	}
	
	// act list 목록
	@RequestMapping(value="/act/{mid}")
	public String act(Model model, @PathVariable("mid")int mid) {	
		model.addAttribute("mid", mid); 
		new actCommand().execute(model);
		return "act";
		
	}
	
	// all list 목록
	@RequestMapping(value="/all/{mid}")
	public String all(Model model, @PathVariable("mid")int mid) {	
		model.addAttribute("mid", mid); 
		new allCommand().execute(model);
		return "all";
		
	}
	
	
	// todo 완료
	@RequestMapping(value="/goAct/{mid}", method = RequestMethod.GET)
	public String goAct(Model model, @PathVariable("mid")int mid, HttpServletRequest request) {		
		String[] tmp = request.getParameterValues("tid");
		int[] tid = new int[tmp.length];
		model.addAttribute("mid", mid);
		
		for(int i=0; i<tid.length; i++) {
			tid[i] = Integer.parseInt(tmp[i]);
			model.addAttribute("tid", tid[i]);
			new goActCommand().execute(model);
		}
		
		return "goAct";
	}	
	
	// todo 삽입
	@RequestMapping(value = "/insertOk")
	public String insertOk(Model model,HttpServletRequest request,
			String title, String img, int mid) {
		todoDTO dto = new todoDTO();
		dto.setTitle(title);
		dto.setImg(img);
		dto.setMid(mid);
		
		model.addAttribute("request", request);
		model.addAttribute("dto", dto);
		new insertCommand().execute(model);
		return "insertOk";
	}
	
	// todo 삭제
		@RequestMapping(value="/goDelete/{mid}", method = RequestMethod.GET)
		public String goDelete(Model model, @PathVariable("mid")int mid, HttpServletRequest request) {		
			String[] tmp = request.getParameterValues("tid");
			int[] tid = new int[tmp.length];
			model.addAttribute("mid", mid);
			
			for(int i=0; i<tid.length; i++) {
				tid[i] = Integer.parseInt(tmp[i]);
				model.addAttribute("tid", tid[i]);
				new goDeleteCommand().execute(model);
			}
			
			return "goDelete";
		}
}