package kr.co.mock.dao;

import java.util.ArrayList;

import kr.co.mock.dto.QaDto;

public interface QaDao {
	   public void write_ok(QaDto qdto);
	   public ArrayList<QaDto> list(int index);
	   public QaDto content(int q_id);
	   public QaDto update(int q_id);
	   public void update_ok(QaDto gdto);
	   public void delete(int q_id);
	   public Integer get_pagecount();
}

