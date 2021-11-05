package kr.co.mock.dao;

import java.util.ArrayList;

import kr.co.mock.dto.StockDto;


public interface StockDao {

 public ArrayList<StockDto> selectCode();
 public ArrayList<StockDto> selectCode(String code);
 public ArrayList<StockDto> selectData(String code);
}
