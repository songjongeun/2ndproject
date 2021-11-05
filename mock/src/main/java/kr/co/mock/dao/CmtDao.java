package kr.co.mock.dao;

import java.util.ArrayList;

import kr.co.mock.dto.CmtDto;

public interface CmtDao {
	
	public ArrayList<CmtDto> cmt_list(int f_id);
	public void cmt_write(CmtDto cdto);
	public void cmt_update(CmtDto cdto);
	public void cmt_delete(CmtDto cdto);
	public Integer get_pagecount();
}
