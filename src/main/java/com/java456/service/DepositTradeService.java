package com.java456.service;

import java.util.List;
import java.util.Map;

import com.java456.entity.DepositTrade;

public interface DepositTradeService {
	
	public Integer add(DepositTrade depositTrade);
	
	public Integer update(DepositTrade depositTrade);
	
	public List<DepositTrade> list(Map<String,Object> map);
	
	public Integer getTotal(Map<String,Object> map);
	
}
