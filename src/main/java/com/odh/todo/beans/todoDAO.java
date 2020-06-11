package com.odh.todo.beans;

import java.util.ArrayList;

public interface todoDAO {
	public ArrayList<todoDTO> todoList(int mid);
	public ArrayList<todoDTO> actList(int mid);
	public ArrayList<todoDTO> allList(int mid);
	
	public int todoAct(int mid, int tid);
	public int todoDelete(int mid, int tid);	
	public int insert(todoDTO dto);
}
