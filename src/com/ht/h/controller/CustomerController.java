package com.ht.h.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
	 * 跳转到正常客户列表
	 * @return
	 */
	@RequestMapping(value="/toList1")
	public String toList1(HttpServletRequest request){
		request.setAttribute("ustate", 1);
		return "customer/cusList";
	}
	
	/**
	 * 跳转到冻结客户列表
	 * @return
	 */
	@RequestMapping(value="/toList2")
	public String toList2(HttpServletRequest request){
		request.setAttribute("ustate", 2);
		return "customer/cusList";
	}
	
	/**
	 * 客户登录
	 * @param customer
	 * @param session
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/cusLogin",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> cusLogin(Customer customer,HttpSession session) throws Exception{
		Map<String, Object> map=new HashMap<>();
		map.put("phone", customer.getUsername());
		map.put("username", customer.getUsername());
		map.put("userpwd", customer.getUserpwd());
		/*map.put("userpwd", (AES.getInstance().encrypt(customer.getUserpwd())));*/
		customer=customerService.cusLogin(map);
		String name=null,idex=null,end = null;
		if(!"".equals(customer.getIdnumber())&&!"".equals(customer.getRealname())&&customer.getIdnumber()!=null&&customer.getRealname()!=null){
			idex = customer.getIdnumber().substring(0, 3);
			end = customer.getIdnumber().substring(14, 18);
			name = customer.getRealname().substring(1, customer.getRealname().length());
			customer.setRealname("*"+name);
			customer.setIdnumber(idex+"**************"+end);
		}
		if(customer != null){
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
	
	/**
	 * 客户列表
	 * @param customer
	 * @param page
	 * @param rows
	 * @return
	 */
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
	
	@RequestMapping(value="/upState")
	@ResponseBody
	public Map<String, Object> upState(Customer customer){
		Map<String, Object> map=new HashMap<>();
		int resultCount=customerService.updateByPrimaryKeySelective(customer);
		if(resultCount > 0){
			if("2".equals(customer.getUstate())){
				map.put("result", "冻结成功");
			}else if("1".equals(customer.getUstate())){
				map.put("result", "解冻成功");
			}
		}else{
			if("2".equals(customer.getUstate())){
				map.put("result", "冻结失败");
			}else if("1".equals(customer.getUstate())){
				map.put("result", "解冻失败");
			}
		}
		return map;
	}
	
	/**
	 * 修改客户登录密码
	 * @param uid
	 * @param newPassword
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/UpdatePassword")
	public String UpdatePassword(@RequestParam("uid") String uid,@RequestParam("newPassword") String newPassword) throws Exception{
		Customer customer=new Customer();
		customer.setUid(Integer.valueOf(uid));
		/*customer.setUserpwd(AES.getInstance().encrypt(newPassword));*/
		customer.setUserpwd(newPassword);
		int ret=customerService.updateByPrimaryKeySelective(customer);
		return "client/login";
		
	}
	
	/**
	 * 用户添加认证身份证号码
	 * 
	 */
	@RequestMapping(value="/addIdcard")
	public String addIdcard(HttpSession session,@RequestParam("uid") String uid,@RequestParam("realname") String realname,@RequestParam("idnumber") String idnumber) throws Exception{
		Customer customer=new Customer();
		customer.setUid(Integer.valueOf(uid));
		customer.setRealname(realname);
		customer.setIdnumber(idnumber);
		int ret=customerService.updateByPrimaryKeySelective(customer);
		Customer c=new Customer();
		c = customerService.selectByPrimaryKey(Integer.valueOf(uid));
		String idex = c.getIdnumber().substring(0, 3);
		String end = c.getIdnumber().substring(14, 18);
		String name = c.getRealname().substring(1, c.getRealname().length());
		c.setRealname("*"+name);
		c.setIdnumber(idex+"**************"+end);
		session.setAttribute("customer", c);
		return "client/security";
	}
	
}
