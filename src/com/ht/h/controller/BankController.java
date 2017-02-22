package com.ht.h.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ht.h.bean.Bank;
import com.ht.h.dto.PageBean;
import com.ht.h.service.interfaces.BankService;
import com.ht.h.util.ResponseUtil;
import com.ht.h.util.StringUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/banktion")
public class BankController {

	@Autowired
	private BankService bankService;
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String bank(){
		return "bank/bankPage";
	}

	
	@RequestMapping(value="/banks",method=RequestMethod.GET)
	public String select(@RequestParam(value="btime1",required=false)String btime1,@RequestParam(value="btime",required=false)String btime,@RequestParam(value="bstate",required=false)String bstate,@RequestParam(value="bcardnumber",required=false)String bcardnumber,@RequestParam(value="page",required=false)String page,@RequestParam(value="rows",required=false)String rows,HttpServletResponse response,HttpSession session) throws Exception{
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String, Object> map= new HashMap<>();
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
}