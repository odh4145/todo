package com.odh.todo.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.odh.todo.C;
import com.odh.todo.beans.todoDAO;
import com.odh.todo.beans.todoDTO;

@RestController
@RequestMapping("/list")
public class todoRestController {
	@RequestMapping(value="/goAct/{mid}/{tid}", method = RequestMethod.GET)
	public int goAct(int mid, int tid) {		
		todoDAO dao = C.sqlSession.getMapper(todoDAO.class);
		return dao.todoAct(mid, tid);
	}	
	
	@RequestMapping(value="/goDelete/{mid}/{tid}", method = RequestMethod.GET)
	public int goDelete(int mid, int tid) {		
		todoDAO dao = C.sqlSession.getMapper(todoDAO.class);
		return dao.todoDelete(mid, tid);
	}	
}
