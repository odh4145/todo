package com.odh.todo.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.odh.todo.C;
import com.odh.todo.beans.memberDAO;

@RestController
@RequestMapping("/member")
public class LoginRestController {
	@RequestMapping(value="/idCheck", method = RequestMethod.GET)
	public int idCheck(@RequestParam("id") String id) {		
		memberDAO dao = C.sqlSession.getMapper(memberDAO.class);	
		return dao.checkId(id);
	}	
	
	@RequestMapping(value="/pwCheck", method = RequestMethod.GET)
	public void pwCheck(String pw, String pw2) {		
	}
}
