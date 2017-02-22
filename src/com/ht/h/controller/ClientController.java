package com.ht.h.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping(value="client")
public class ClientController {
	
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
	 * 跳转到常见问题
	 * */
	@RequestMapping(value="problem")
	public String problem(){
		return "client/problem";
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
	public String left(){
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
	public String MoneyRecord(){
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
	public String BankCard(){
		return "client/BankCard";
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
	
}
