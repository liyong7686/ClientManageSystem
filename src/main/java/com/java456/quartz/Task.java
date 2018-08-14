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
	@Scheduled(cron="* * * * * ?") ÿ��ִ��һ��
	@Scheduled(cron="0 * * * * ?") ÿ��ִ��һ��
	@Scheduled(cron="0 0 * * * ?") ÿʱִ��һ��
	@Scheduled(cron="0 0 0 * * ?") ÿ��ִ��һ��
	@Scheduled(cron="0 0 10,11,14,16  *  *  ?") ÿ������10�㣬����2�㣬4��
	*/
	
	@Resource
	private PublicService publicService;
	@Resource
	private ConfigService configService;
	
	
	
	
}
