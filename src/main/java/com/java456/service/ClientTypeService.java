package com.java456.service;

import java.util.List;
import java.util.Map;

import com.java456.entity.ClientType;

public interface ClientTypeService {

	public Integer add(ClientType clientType);

	public Integer update(ClientType clientType);

	public List<ClientType> list(Map<String, Object> map);

	public Integer getTotal(Map<String, Object> map);

	public Integer delete(Integer id);

	public ClientType findById(Integer id);

}
