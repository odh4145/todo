package com.odh.todo.command;

import java.util.Map;

import org.springframework.ui.Model;

import com.odh.todo.C;
import com.odh.todo.beans.memberDAO;
import com.odh.todo.beans.memberDTO;

public class loginCommand implements Command {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		String id = (String)map.get("id");
		String pw = (String)map.get("pw");

		memberDAO dao = C.sqlSession.getMapper(memberDAO.class);
		int result = 0;

		try {
			memberDTO dto = dao.selectById(id);
			String mpw = dto.getPw();

			if (mpw.equals(pw)) {
				result = 1; // 로그인 성공
				model.addAttribute("mid", dto.getMid());
				model.addAttribute("id", dto.getId());

			} else if (!mpw.equals(pw)) {
				result = 2; // 비밀번호가 틀림
			}

		} catch (Exception e) {
			System.out.println(e);
			result = 3; // 아이디가 없다.
			model.addAttribute("result", result);
		}
		model.addAttribute("result", result);
	}

}
