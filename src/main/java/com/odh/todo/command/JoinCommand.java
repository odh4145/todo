package com.odh.todo.command;

import java.util.Map;

import org.springframework.ui.Model;

import com.odh.todo.C;
import com.odh.todo.beans.memberDAO;
import com.odh.todo.beans.memberDTO;

public class JoinCommand implements Command {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		memberDTO dto = (memberDTO) map.get("dto");
		memberDAO dao = C.sqlSession.getMapper(memberDAO.class);
		model.addAttribute("result", dao.join(dto));
	}


}
