package com.odh.todo.command;

import java.util.Map;

import org.springframework.ui.Model;

import com.odh.todo.C;
import com.odh.todo.beans.todoDAO;

public class goDeleteCommand implements Command {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		int mid = (Integer)map.get("mid");
		int tid = (Integer)map.get("tid");
		
		todoDAO dao = C.sqlSession.getMapper(todoDAO.class);
		model.addAttribute("result", dao.todoDelete(mid, tid));
	}
}