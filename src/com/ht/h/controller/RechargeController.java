package com.ht.h.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ht.h.bean.Customer;
import com.ht.h.bean.PageBean;
import com.ht.h.bean.Recharge;
import com.ht.h.service.interfaces.RechargeService;
import com.ht.h.util.IPTimeStamp;

@Controller
@RequestMapping("/rechargeQ")
public class RechargeController {

	private final SimpleDateFormat SDF = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	@Resource
	private RechargeService rechargeService;
	
	@RequestMapping("/add")
	public String add(Recharge recharge,HttpServletRequest request) throws ParseException{
		
		HttpSession session=request.getSession();
		Customer customer=(Customer)session.getAttribute("customer");
		recharge.setUid(customer.getUid());
		recharge.setRtype("汇付充值");
		recharge.setRcounterfee((long) 0);
		recharge.setRactual(recharge.getRmoney());
		recharge.setRstate("失败");
		IPTimeStamp ipt=new IPTimeStamp();
		recharge.setRserial(ipt.getTimeStamp());
		recharge.setRtime(SDF.parse(SDF.format(new Date())));
		int id=rechargeService.insertSelective(recharge);
		request.setAttribute("id", id);
		return null;
	}
	
	@RequestMapping("/update")
	public String upDate(Recharge recharge,HttpServletRequest request){
		recharge.setRstate("成功");
		rechargeService.updateByPrimaryKeySelective(recharge);
		return null;
	}
	
	//分页查询
	@RequestMapping("/queryAll")
	public String queryAll(@RequestParam(value="page",required=false)String page,@RequestParam(value="rows",required=false)String rows,Recharge recharge,HttpServletRequest request){
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("rstate", recharge.getRstate());
		map.put("uid", recharge.getUid());
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Recharge> list=rechargeService.queryAll(map);
		Long total=rechargeService.getTotal(map);
		pageBean.setTotal(Integer.parseInt(String.valueOf(total)));
		return null;
	}
}
