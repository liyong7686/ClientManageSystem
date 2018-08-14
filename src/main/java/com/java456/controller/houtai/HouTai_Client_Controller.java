package com.java456.controller.houtai;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.java456.entity.Client;
import com.java456.entity.ClientType;
import com.java456.service.ClientService;
import com.java456.service.ClientTypeService;


@Controller
@RequestMapping("/houtai/client")
public class HouTai_Client_Controller {
	
	@Resource
	private ClientService clientService;
	
	@Resource
	private ClientTypeService clientTypeService;
	
	
	@RequestMapping("/add")
	public ModelAndView add() throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.addObject("btn_text", "����");
		mav.addObject("save_url", "/admin/client/add");
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<ClientType> clientTypeList = clientTypeService.list(map);
		mav.addObject("clientTypeList", clientTypeList);
		
		
		mav.setViewName("/admin/page/client/add_or_update");
		return mav;
	}
	
	
	
	@RequestMapping("/manage")
	public ModelAndView manage() throws Exception {
		ModelAndView mav = new ModelAndView();
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<ClientType> clientTypeList = clientTypeService.list(map);
		mav.addObject("clientTypeList", clientTypeList);
		mav.setViewName("/admin/page/client/client_manage");
		return mav;
	}
	
	
	@RequestMapping("/edit")
	public ModelAndView edit(@RequestParam(value = "id", required = false) String id, HttpServletResponse response,
			HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		Client client     = clientService.findById(Integer.parseInt(id));
		mav.addObject("client", client);
		mav.addObject("btn_text", "�޸�");
		mav.addObject("save_url", "/admin/client/update?id=" + id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<ClientType> clientTypeList = clientTypeService.list(map);
		mav.addObject("clientTypeList", clientTypeList);
		
		mav.setViewName("/admin/page/client/add_or_update");
		return mav;
	}
	
	
	
}
