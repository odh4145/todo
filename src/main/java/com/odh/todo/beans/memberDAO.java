package com.odh.todo.beans;

public interface memberDAO {
	public memberDTO selectById(String id);
	public int checkId(String id);
	public int join(memberDTO dto);
}
