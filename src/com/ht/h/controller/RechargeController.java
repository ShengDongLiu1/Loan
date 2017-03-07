package com.ht.h.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
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
import com.ht.h.bean.Capital;
import com.ht.h.bean.Customer;
import com.ht.h.bean.PageBean;
import com.ht.h.bean.Recharge;
import com.ht.h.service.interfaces.BankService;
import com.ht.h.service.interfaces.CapitalService;
import com.ht.h.service.interfaces.RechargeService;
import com.ht.h.util.ResponseUtil;
import com.ht.h.util.StringUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/recharge")
public class RechargeController {

	private final SimpleDateFormat SDF = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	private final SimpleDateFormat SDFS = new SimpleDateFormat("yyyyMMddHHmmss");
	
	@Resource
	private RechargeService rechargeService;
	
	@Autowired
	private CapitalService capitalService;
	
	@Autowired
	private BankService bankService;
	
	@RequestMapping("/add")
	public String add(Recharge recharge,HttpServletRequest request) throws ParseException{
		HttpSession session=request.getSession();
		Customer customer=(Customer)session.getAttribute("customer");
		recharge.setUid(customer.getUid());
		recharge.setRtype("网银充值");
		recharge.setRcounterfee((long) 0);
		recharge.setRactual(recharge.getRmoney());
		recharge.setRstate("失败");
		recharge.setRserial(SDFS.format(new Date()));
		recharge.setRtime(SDF.parse(SDF.format(new Date())));
		int id=rechargeService.insertSelective(recharge);
		int rid;
		if(id!=0){
			rid=rechargeService.queryByRserial(recharge.getRserial());
			request.setAttribute("id", rid);
		}
		request.setAttribute("money", recharge.getRmoney());
		return "recharge/LastStep";
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public Map<String, Object> upDate(Recharge recharge,HttpServletRequest request) throws ParseException{
		recharge.setRstate("成功");
		int i=rechargeService.updateByPrimaryKeySelective(recharge);
		Map<String, Object> map = new HashMap<String,Object>();
		HttpSession session=request.getSession();
		Customer customer=(Customer)session.getAttribute("customer");
		Capital c=capitalService.selectByPrimaryKey2(customer.getUid());
		if(c!=null && !"".equals(c)){
			Capital capital=new Capital();
			capital.setCid(c.getCid());
			capital.setAllasset(recharge.getRmoney()+c.getAllasset());
			capital.setAvailable(recharge.getRmoney()+c.getAvailable());
			capital.setCtime(SDF.parse(SDF.format(new Date())));
			capitalService.updateRecharge(capital);
		}else{
			Capital capital=new Capital();
			capital.setUid(customer.getUid());
			capital.setAllasset(recharge.getRmoney());
			capital.setAvailable(recharge.getRmoney());
			capital.setCtime(SDF.parse(SDF.format(new Date())));
			capitalService.insertSelective(capital);
		}
		if(i==0){
			map.put("errorMsg", "请先添加银行卡！");
			map.put("result", "fail");
		}else{
			map.put("result","seccuss");
		}
		return map;
	}
	
	@RequestMapping("/queryByBank")
	@ResponseBody
	public Map<String, Object> queryByBank(HttpServletRequest request){
		HttpSession session = request.getSession();
		Customer cus=(Customer)session.getAttribute("customer");
		List<Bank> bank=bankService.queryByUid(cus.getUid());
		Map<String, Object> map = new HashMap<String,Object>();
		if(bank.isEmpty()){
			map.put("errorMsg", "请先添加银行卡！");
			map.put("result", "fail");
		}else{
			map.put("result","seccuss");
		}
		request.setAttribute("bank", bank);
		return map;
	}
	
	@RequestMapping("/queryBank")
	@ResponseBody
	public List<Bank> queryBank(HttpServletRequest request){
		HttpSession session = request.getSession();
		Customer cus=(Customer)session.getAttribute("customer");
		List<Bank> bank=bankService.queryByUid(cus.getUid());
		request.setAttribute("bank", bank);
		return bank;
	}
	
	//分页查询
	@RequestMapping("/queryAll")
	public String queryAll(@RequestParam(value="page",required=false)String page,@RequestParam(value="rows",required=false)String rows,HttpServletResponse response,HttpServletRequest request,String username,String rstate,String rtime,String rtime1) throws Exception{
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String, Object> map = new HashMap<String,Object>();
		System.out.println("rstate:"+rstate+"username:"+username+"rtime:"+rtime+"rtime1:"+rtime1);
		map.put("username", StringUtil.formatLike(username));
		if(rtime != null && !"".equals(rtime) && rtime1 != null && !"".equals(rtime1)){
			map.put("rtime", rtime);
			map.put("rtime1", rtime1);
		}
		map.put("rstate", rstate);
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Recharge> list=rechargeService.queryAll(map);
		Long total=rechargeService.getTotal(map);
		JSONObject result = new JSONObject();
		JSONArray jsonArray = JSONArray.fromObject(list);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}
	
	//客户查询
	@RequestMapping("/queryBy")
	public String queryBy(@RequestParam(value="page",required=false)String page,@RequestParam(value="rows",required=false)String rows,@RequestParam(value="rtime1",required=false)String rtime1,@RequestParam(value="rstate",required=false)String rstate,@RequestParam(value="rtime",required=false)String rtime,@RequestParam(value="username",required=false)String username,HttpServletResponse response,HttpServletRequest request) throws Exception{
		PageBean pageBean=null;
		if(page == null && rows == null){
			pageBean=new PageBean(1,10);
		}else{
			pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		}
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("rstate", rstate);
		map.put("username", StringUtil.formatLike(username));
		if(rtime != null && !"".equals(rtime) && rtime1 != null && !"".equals(rtime1)){
			map.put("rtime", rtime);
			map.put("rtime1", rtime1);
		}
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Recharge> list=rechargeService.queryBy(map);
		System.out.println(list.get(0).getCustomer().getUsername()+":username");
		Long total=rechargeService.getTotalBy(map);
		request.setAttribute("list", list);
		request.setAttribute("total", total);
		pageBean.setTotal(Integer.parseInt(String.valueOf(total)));
		request.setAttribute("count", pageBean.getCount());
		request.setAttribute("page",pageBean.getPage());
		request.setAttribute("pageSize",pageBean.getPageSize());
		return "client/rechargeJl";
	}
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String recharge(){
		return "recharge/wdzh_cz";
	}
	
	@RequestMapping(value="/czadd",method=RequestMethod.GET)
	public String czadd(){
		return "client/recharge";
	}

}
