package kr.co.mock.dao;

import java.util.ArrayList;

import kr.co.mock.dto.BoardDto;

public interface BoardDao {
	   public void write_ok(BoardDto bdto);
	   public ArrayList<BoardDto> list(int index);
	   public void hit(int f_id);
	   public BoardDto content(int f_id);
	   public BoardDto update(int f_id);
	   public void update_ok(BoardDto bdto);
	   public void delete(int f_id);
	   public Integer get_pagecount();
	   public ArrayList<BoardDto> list2(String field, String word);
}
