package com.java456.controller.admin;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.google.gson.Gson;
import com.java456.entity.Config;
import com.java456.entity.Result;
import com.java456.service.ConfigService;
import com.java456.util.Base64Test;
import com.java456.util.FileUtil;
import com.java456.util.ResponseUtil;
import com.java456.util.StringUtil;




@Controller
@RequestMapping("/admin/config")
public class AdminConfigController {
	
	@Resource
	private ConfigService configService;
	
	@RequestMapping("/update")
	public String update(Config config,@RequestParam(value = "imgData", required = false) String imgData ,HttpServletResponse response,HttpServletRequest request)throws Exception{
		
		int resultTotal=configService.update(config);
		Result result = new Result();
		Gson gson = new Gson();
		if(resultTotal>0){
			result.setSuccess(true);
			result.setMsg("修改成功");
		}else{
			result.setSuccess(false);
			result.setMsg("修改失败!!!!!!!");
		}
		ResponseUtil.write(response, gson.toJson(result));
		return null;
	}
	
	
	@RequestMapping("/findById")
	public String findById(
			@RequestParam(value="id",required=false)String id,
			HttpServletResponse response,HttpServletRequest request)throws Exception{
		Gson gson = new Gson();
		Config config = configService.findById(Integer.parseInt(id));
		ResponseUtil.write(response, gson.toJson(config));
		return null;
	}
	
}
