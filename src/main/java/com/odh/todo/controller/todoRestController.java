package com.odh.todo.controller;

import javax.servlet.http.HttpServletRequest;

import org.omg.CORBA.Request;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.odh.todo.C;
import com.odh.todo.beans.todoDAO;

//@RestController
//@RequestMapping("/list")
//public class todoRestController {
//	@RequestMapping(value="/add/{mid}", method = RequestMethod.GET)
//	public int Insert(@RequestParam("mid") int mid, @RequestParam("title") String title,
//				@RequestParam("img") String img, HttpServletRequest request) {		
//		todoDAO dao = C.sqlSession.getMapper(todoDAO.class);
//		String title = (String)request.getParameter(title);
//		String img = (String)request.getParameter(img);
//		return dao.insert(title, img, mid);
//	}	
//}
