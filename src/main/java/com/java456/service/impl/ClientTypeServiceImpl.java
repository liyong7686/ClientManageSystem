package com.java456.service.impl;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.java456.dao.ClientTypeDao;
import com.java456.entity.ClientType;
import com.java456.service.ClientTypeService;



@Service("clientTypeService")
public class ClientTypeServiceImpl implements ClientTypeService {
	
	

	@Resource
	private ClientTypeDao clientTypeDao;
	
	
	@Override
	public Integer add(ClientType clientType) {
		// TODO Auto-generated method stub
		return clientTypeDao.add(clientType);
	}

	@Override
	public Integer update(ClientType clientType) {
		// TODO Auto-generated method stub
		return clientTypeDao.update(clientType);
	}

	@Override
	public List<ClientType> list(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return clientTypeDao.list(map);
	}

	@Override
	public Integer getTotal(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return clientTypeDao.getTotal(map);
	}

	@Override
	public Integer delete(Integer id) {
		// TODO Auto-generated method stub
		return clientTypeDao.delete(id);
	}
	
	@Override
	public ClientType findById(Integer id) {
		// TODO Auto-generated method stub
		return clientTypeDao.findById(id);
	}

}
