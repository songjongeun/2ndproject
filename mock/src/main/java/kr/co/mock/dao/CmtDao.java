package kr.co.mock.dao;

import java.util.ArrayList;

import kr.co.mock.dto.CmtDto;

public interface CmtDao {
	
	public void cmt_write_ok(CmtDto cdto);
	public ArrayList<CmtDto> cmt_list(int f_id);
	public CmtDto cmt_update(int f_id);
	public void cmt_update_ok(CmtDto cdto);
	public void cmt_delete(int f_id);
	public Integer get_pagecount();
}
