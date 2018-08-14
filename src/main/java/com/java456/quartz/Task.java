package com.java456.quartz;


import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.java456.service.ConfigService;
import com.java456.service.PublicService;
import com.java456.util.DateUtil;



@Component
public class Task {
	
	/*
	@Scheduled(cron="* * * * * ?") 每秒执行一次
	@Scheduled(cron="0 * * * * ?") 每分执行一次
	@Scheduled(cron="0 0 * * * ?") 每时执行一次
	@Scheduled(cron="0 0 0 * * ?") 每天执行一次
	@Scheduled(cron="0 0 10,11,14,16  *  *  ?") 每天上午10点，下午2点，4点
	*/
	
	@Resource
	private PublicService publicService;
	@Resource
	private ConfigService configService;
	
	
	
	
}
