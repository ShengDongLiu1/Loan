package com.ht.h.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ht.h.bean.Customer;
import com.ht.h.bean.PageBean;
import com.ht.h.dto.StringUtil;
import com.ht.h.service.interfaces.CustomerService;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	@Resource
	private CustomerService customerService;
	
	
	/**
	 * 跳转到客户列表
	 * @return
	 */
	@RequestMapping(value="/toList")
	public String toList(){
		return "customer/cusList";
	}
	
	/**
	 * 客户登录
	 * @param customer
	 * @param session
	 * @return
	 */
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
	
	/**
	 * 客户退出登录
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/logOut")
	public String logOut(HttpSession session){
		session.removeAttribute("customer");
		return "client/index";
	}
	
	
	@RequestMapping(value="/cusList")
	@ResponseBody
	public Map<String, Object> allCustomer(Customer customer,@RequestParam(value="page",required=false)String page,@RequestParam(value="rows",required=false)String rows){
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String, Object> map=new HashMap<>();
		map.put("username", StringUtil.formatLike(customer.getUsername()));
		map.put("realname", StringUtil.formatLike(customer.getRealname()));
		map.put("idnumber", StringUtil.formatLike(customer.getIdnumber()));
		map.put("ustate", customer.getUstate());
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Customer> cusList=customerService.queryAll(map);
		Long total=customerService.getTotal(map);
		map.put("rows", cusList);
		map.put("total", total);
		return map;
	}
	
}
