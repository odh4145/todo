package com.odh.todo.command;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.odh.todo.C;
import com.odh.todo.beans.todoDAO;
import com.odh.todo.beans.todoDTO;

public class insertCommand implements Command {
	private static final String SAVE_PATH = "C:\\tomcat\\apache-tomcat-9.0.35\\wtpwebapps\\ToDo\\img";

	@Override
	public void execute(Model model) {
		MultipartHttpServletRequest request = (MultipartHttpServletRequest) model.getAttribute("request");

		// todoDTO setting
		Map<String, Object> map = model.asMap();
		todoDTO dto = (todoDTO) map.get("dto");
		todoDAO dao = C.sqlSession.getMapper(todoDAO.class);
		
		// get request data;
		MultipartFile img = request.getFile("img");
		String title = request.getParameter("title");
		int mid = Integer.parseInt(request.getParameter("mid"));
		
		String imgPath = uploadFile(img);		
		model.addAttribute("result", dao.insert(title, imgPath, mid));
	}

	public String uploadFile(MultipartFile img) {
		UUID saveName = UUID.randomUUID();
		String orignalName = img.getOriginalFilename();
		String ext = orignalName.substring(orignalName.lastIndexOf("."), orignalName.length());
		String dataName = saveName.toString().substring(0, 10) + ext;
		String realPath = SAVE_PATH + "/" + dataName;

		try {
			byte[] data = img.getBytes();
			FileOutputStream fos = new FileOutputStream(realPath);
			fos.write(data);
			fos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return dataName;
	}
}
