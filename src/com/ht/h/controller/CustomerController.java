package com.ht.h.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ht.h.bean.Customer;
import com.ht.h.service.interfaces.CustomerService;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	@Resource
	private CustomerService customerService;
	
	@RequestMapping(value="/cusLogin",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> cusLogin(Customer customer,HttpSession session){
		Map<String, Object> map=new HashMap<>();
		map.put("phone", customer.getUsername());
		map.put("username", customer.getUsername());
		map.put("userpwd", customer.getUserpwd());
		customer=customerService.cusLogin(map);
		if(customer != null){
			System.out.println(customer);
			session.setAttribute("customer", customer);
			map.put("result", "success");
		}else{
			map.put("result", "用户名或密码错误");
		}
		return map;
	}
	
	
	
	
}
