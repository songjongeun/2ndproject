package kr.co.mock.dao;

import java.util.ArrayList;

import kr.co.mock.dto.BuyingDto;
import kr.co.mock.dto.SellingDto;
import kr.co.mock.dto.UserDto;

public interface AdminDao {
	public ArrayList<UserDto> adminpage(); 
	public ArrayList<BuyingDto> buyList();
	public ArrayList<SellingDto> sellList();
}
