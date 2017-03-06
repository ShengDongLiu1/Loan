package com.ht.h.controller;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ht.h.bean.Capital;
import com.ht.h.service.interfaces.CapitalService;


import com.ht.h.bean.Bank;
import com.ht.h.bean.Customer;
import com.ht.h.bean.Recharge;
import com.ht.h.dto.Pager;
import com.ht.h.service.interfaces.BankService;
import com.ht.h.service.interfaces.RechargeService;


@Controller
@RequestMapping(value="client")
public class ClientController {

	@Autowired
	private CapitalService capitalService;
	
	@Autowired
	private BankService bankService;
	
	@Autowired
	private RechargeService rechargeService;
	
	/*
	 * 跳转到首页
	 * */
	@RequestMapping(value="index")
	public String index(){
		return "client/index";
	}
	
	/*
	 * 跳转到登录页面
	 * */
	@RequestMapping(value="login")
	public String login(){
		return "client/login";
	}
	
	
	/*
	 * 跳转到常见问题1
	 * */
	@RequestMapping(value="problem")
	public String problem(){
		return "client/problem";
	}
	
	/*
	 * 跳转到常见问题2
	 * */
	@RequestMapping(value="problem2")
	public String problem2(){
		return "client/problem2";
	}
	
	/*
	 * 跳转到常见问题3
	 * */
	@RequestMapping(value="problem3")
	public String problem3(){
		return "client/problem3";
	}
	
	/*
	 * 跳转到常见问题4
	 * */
	@RequestMapping(value="problem4")
	public String problem4(){
		return "client/problem4";
	}
	
	/*
	 * 跳转到常见问题5
	 * */
	@RequestMapping(value="problem5")
	public String problem5(){
		return "client/problem5";
	}
	
	
	/*
	 * 跳转到注册页面
	 * */
	@RequestMapping(value="register")
	public String register(){
		return "client/register";
	}
	
	/*
	 * 跳转到我要投资页面
	 * */
	@RequestMapping(value="invest")
	public String invest(){
		return "client/invest";
	}
	
	
	/*
	 * 跳转到我要借款页面
	 * */
	@RequestMapping(value="borrow")
	public String borrow(){
		return "client/borrow";
	}
	
	/*
	 * 跳转到新手引导页面
	 * */
	@RequestMapping(value="noticelist")
	public String noticelist(){
		return "client/noticelist";
	}

	
	/*
	 * 跳转到公司公告页面
	 * */
	@RequestMapping(value="article")
	public String article(){
		return "client/article";
	}
	
	@RequestMapping(value="detail")
	public String detail(){
		return "client/detail";
	}
	
	/*
	 * 跳转到我的账户
	 * */
	@RequestMapping(value="left")
	public String left(@RequestParam("uid") Integer uid,HttpServletRequest request){
		Capital capital=new Capital();
		capital=capitalService.selectByFund(uid);
		request.setAttribute("fund", capital);
		return "client/left";
	}
	
	/*
	 * 跳转到充值
	 * */
	@RequestMapping(value="recharge")
	public String recharge(){
		return "client/recharge";
	}
	/*
	 * 跳转到提现
	 * */
	@RequestMapping(value="funds")
	public String funds(){
		return "client/funds";
	}
	
	/*
	 * 资金记录
	 * */
	@RequestMapping(value="MoneyRecord")
	public String MoneyRecord(HttpServletRequest request,@RequestParam(value="state",required=false)String state,@RequestParam(value="time1",required=false)String time1,@RequestParam(value="time",required=false)String time,@RequestParam(value="page",required=false)int page){
		//if(state == "1" && state.equals("1")){//查询充值表
			Pager<Recharge> pager = new Pager<Recharge>();
			pager.setPageSize(10);
			int count = rechargeService.rechargetCount();
			int total = count % pager.getPageSize() == 0 ? count / pager.getPageSize() : count / pager.getPageSize() +1;
			pager.setTotal(total);
			if(page >= 1 && page <= pager.getTotal()){
				pager.setPageNo(page);
			} else if (page < 1) {
				pager.setPageNo(1);
			} else if(pager.getTotal() == 0){
				pager.setPageNo(1);
			}else{
				pager.setPageNo(pager.getTotal());
			}
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("start", pager.getBeginIndex());
			map.put("size", pager.getPageSize());
			List<Recharge> userList=rechargeService.rechargetQueryAll(map);
			pager.setRows(userList);
			request.setAttribute("rechList", pager);
			request.setAttribute("count", count);
			return "client/MoneyRecord";
	}
	
	
	/*
	 * 投资管理
	 * */
	@RequestMapping(value="investment")
	public String investment(){
		return "client/investment";
	}
	
	/*
	 *借款管理
	 * */
	@RequestMapping(value="BorrowMoney")
	public String BorrowMoney(){
		return "client/BorrowMoney";
	}
	
	/*
	 *银行卡管理
	 * */
	@RequestMapping(value="BankCard")
	public String BankCard(HttpServletRequest request,HttpSession session){
		Customer customer=(Customer) session.getAttribute("customer");
		List<Bank> list=bankService.selectCard(customer.getUid());//查询所有数据
		request.setAttribute("bankList", list);
		return "client/BankCards";
	}
	
	/*
	 *添加银行卡
	 * */
	@RequestMapping(value="AddCard")
	public String AddCard(){
		return "huifuPage/AddCard";
	}
	
	/**
	 * 
	 * 跳转到安全设置
	 */
	@RequestMapping(value="security")
	public String security(){
		return "client/security";
	}
	
	/**
	 * 
	 * 跳转到消息中心
	 */
	@RequestMapping(value="MessageCenter")
	public String MessageCenter(){
		return "client/MessageCenter";
	}
	
	/**
	 * 
	 * 跳转到消息中心
	 */
	@RequestMapping(value="pay")
	public String pay(){
		return "client/pay";
	}
	
	/*
	 * 关于我们
	 */
	@RequestMapping(value="AboutUs")
	public String AboutUs(){
		return "client/AboutUs";
	}
	
}
