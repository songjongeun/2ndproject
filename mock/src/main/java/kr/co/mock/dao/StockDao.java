package kr.co.mock.dao;


import java.util.ArrayList;

import kr.co.mock.dto.BuyingDto;
import kr.co.mock.dto.StockDto;


public interface StockDao {

 public ArrayList<StockDto> selectCode();
 public String selectName(String code);
 public ArrayList<StockDto> selectData(String code);
 public int selectCountMock(String userid);
 public int selectMileage(String userid);

 public int selectPrice(String code);
 
 public void insertBuying(BuyingDto bdto);
 
}
