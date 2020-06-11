package com.odh.todo.command;

import java.util.Map;

import org.springframework.ui.Model;

import com.odh.todo.C;
import com.odh.todo.beans.todoDAO;

public class allCommand implements Command {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		int mid = (Integer)map.get("mid");
		
		todoDAO dao = C.sqlSession.getMapper(todoDAO.class);
		model.addAttribute("list", dao.allList(mid));		
	}
}
