package com.java456.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.google.gson.Gson;
import com.java456.entity.Result;
import com.java456.entity.User;
import com.java456.service.ClientService;
import com.java456.service.PublicService;
import com.java456.service.UserService;
import com.java456.util.CryptographyUtil;
import com.java456.util.ResponseUtil;



@Controller
@RequestMapping("/user")
public class UserController {
	
	
	@Resource
	private UserService  userService;
	@Resource
	private PublicService  publicService;
	@Resource
	private ClientService clientService;
	/**
	 * /user/login
	 * 电脑登陆
	 */
	@RequestMapping("/login")
	public String login(User user,HttpServletResponse response,HttpServletRequest request
			,RedirectAttributes attr)throws Exception{
		Result result = new  Result();
		Gson gson = new Gson();
		Subject subject=SecurityUtils.getSubject();
		

		SecurityUtils.getSubject().getSession().setAttribute("login_type", "user_login");
		
		UsernamePasswordToken token=new UsernamePasswordToken(user.getName(), CryptographyUtil.md5(user.getPassword(), "chenhao"));
		try{
			subject.login(token); // 登录验证
			//如果登陆成功 就不会报错  报错就是登陆失败了
			user = userService.findByName(user.getName());
			SecurityUtils.getSubject().getSession().setAttribute("currentUser", user); //把当前用户信息存到session中
			//return "redirect:/admin/main";
			result.setSuccess(true);
			result.setMsg("登陆成功");
			ResponseUtil.write(response, gson.toJson(result));
			return null;
		}catch(Exception e){
			e.printStackTrace();
			result.setSuccess(false);
			result.setMsg("帐号或密码错误");
			ResponseUtil.write(response, gson.toJson(result));
			return null;
		}
	}
	
	/**
	 * /user/logout
	 * @throws Exception
	 */
	@RequestMapping("/logout")
	public String logout()throws Exception{
		SecurityUtils.getSubject().logout(); //shiro的退出
		return "redirect:/login";
	}
	
	
}
