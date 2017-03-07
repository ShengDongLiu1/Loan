package com.ht.h.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ht.h.bean.Bank;
import com.ht.h.bean.Customer;
import com.ht.h.dto.PageBean;
import com.ht.h.service.interfaces.BankService;
import com.ht.h.service.interfaces.CapitalService;
import com.ht.h.util.ResponseUtil;
import com.ht.h.util.StringUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/banktion")
public class BankController {

	@Autowired
	private BankService bankService;
	
	@Autowired
	private CapitalService capitalService;
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String bank(){
		return "bank/bankPage";
	}
	
	@RequestMapping(value="/addCard",method=RequestMethod.GET)
	public String addCard(){
		
		return "huifuPage/AddCard";
	}

	
	@RequestMapping(value="/banks",method=RequestMethod.GET)
	public String select(@RequestParam(value="username",required=false)String username,@RequestParam(value="realname",required=false)String realname,@RequestParam(value="btime1",required=false)String btime1,@RequestParam(value="btime",required=false)String btime,@RequestParam(value="bstate",required=false)String bstate,@RequestParam(value="bcardnumber",required=false)String bcardnumber,@RequestParam(value="page",required=false)String page,@RequestParam(value="rows",required=false)String rows,HttpServletResponse response,HttpSession session) throws Exception{
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String, Object> map= new HashMap<>();
		map.put("username", StringUtil.formatLike(username));
		map.put("realname", StringUtil.formatLike(realname));
		map.put("bcardnumber", StringUtil.formatLike(bcardnumber));
		map.put("bstate", StringUtil.formatLike(bstate));
		map.put("btime", btime);
		map.put("btime1", btime1);
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Bank> list=bankService.select(map);//查询所有数据
		System.out.println(map.get("comtype")+"comtype");
		Long total=bankService.queryAllCount(map);	//查询总条数
		System.out.println("总条数:"+total);
		JSONObject result = new JSONObject();
		JSONArray jsonArray = JSONArray.fromObject(list);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		System.out.println("list:"+jsonArray);
		return null;
	}
	
	
	@RequestMapping(value="/selectCard",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectCard(@RequestParam(value="uid",required=false)Integer uid,HttpServletResponse response,HttpSession session) throws Exception{
		System.out.println("uid"+uid);
		List<Bank> list=bankService.selectCard(uid);//查询所有数据
		Map<String, Object> map=new HashMap<>();
		map.put("success", true);
		map.put("list", list);
		return map;
	}
	
	@RequestMapping(value="/addbank",method=RequestMethod.POST)
	public String addbank(@RequestParam(value="cardId",required=false)String cardId,@RequestParam(value="bankId",required=false)String bankId,HttpServletResponse response,HttpSession session,HttpServletRequest request) throws Exception{
		Bank bank=new Bank();
		System.out.println(bankId);
		Customer customer = (Customer) session.getAttribute("customer");
		bank.setUid(customer.getUid());
		bank.setBaccount(bankId);
		bank.setBcardnumber(cardId);
		Date now = new Date(); 
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//可以方便地修改日期格式
		Date time= dateFormat.parse(dateFormat.format(new Date()));
		bank.setBtime(time);
		bank.setBstate("1");
		bankService.addbank(bank);
		List<Bank> list=bankService.selectCard(customer.getUid());//查询所有数据
		request.setAttribute("bankList", list);
		return "client/BankCards";
	}
	
	
}
