package com.java456.dao;

import java.util.List;
import java.util.Map;

import com.java456.entity.DepositTrade;

public interface DepositTradeDao {
	
	public Integer add(DepositTrade depositTrade);
	
	public Integer update(DepositTrade depositTrade);
	
	public List<DepositTrade> list(Map<String,Object> map);
	
	public Integer getTotal(Map<String,Object> map);
	
}	
