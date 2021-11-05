package kr.co.mock.dao;

<<<<<<< HEAD
import java.util.ArrayList;

import kr.co.mock.dto.StockDto;


public interface StockDao {

 public ArrayList<StockDto> selectCode();
 public ArrayList<StockDto> selectCode(String code);
 public ArrayList<StockDto> selectData(String code);
=======
import kr.co.mock.dto.StockDto;

public interface StockDao {

	
	public void testLombok(StockDto sdto);
	
>>>>>>> 0cf8fd16438c0a877719b83a0c5a997f8b2a86b3
}
