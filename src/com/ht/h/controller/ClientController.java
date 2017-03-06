package com.ht.h.controller;

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
import com.ht.h.bean.Customer;
import com.ht.h.bean.Loan;
import com.ht.h.dto.DateUtil;
import com.ht.h.dto.PageBean;
import com.ht.h.dto.StringUtil;
import com.ht.h.service.interfaces.CapitalService;
import com.ht.h.service.interfaces.LoanService;

@Controller
@RequestMapping(value="client")
public class ClientController {
	
	@Autowired
	private CapitalService capitalService;
	
	@Autowired
	private LoanService loanService;
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
	public String invest(Loan loan,@RequestParam(value="page",required=false)String page,@RequestParam(value="rows",required=false)String rows,String username,HttpServletRequest req){
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String, Object> map=new HashMap<>();
		map.put("lid", loan.getLid());
		map.put("username", StringUtil.formatLike(username));
		map.put("ltitle", StringUtil.formatLike(loan.getLtitle()));
		map.put("ltype", loan.getLtype());
		map.put("lterm", loan.getLterm());
		map.put("lstate", loan.getLstate());
		map.put("lclass", loan.getLclass());
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Loan> loanList=loanService.queryAll(map);
		Long total=loanService.getTotal(map);
		req.setAttribute("loan1", loanList);
		req.setAttribute("page", pageBean.getPage());
		req.setAttribute("count", total);
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
	
	
	//跳转到我要投资页面
	@RequestMapping(value="detail1")
	public String detail(HttpSession session,String lid,HttpServletRequest request){
		Customer customer = (Customer) session.getAttribute("customer");
		if(customer!=null){
			request.setAttribute("lid", lid);
			return "client/detail";
		}else{
			return "client/login";
		}
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
	public String investment(Loan loan,@RequestParam(value="page",required=false)String page,@RequestParam(value="rows",required=false)String rows,String username,HttpServletRequest req){
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
	 * 跳转到汇付天下
	 * @throws Exception 
	 */
	@RequestMapping(value="pay")
	public String pay(String qian,String id,HttpServletRequest request,String lid) throws Exception{
		request.setAttribute("qian", qian);
		request.setAttribute("lid", lid);
		request.setAttribute("dingdan", "HJ"+DateUtil.getCurrentDateStr());
		request.setAttribute("time1", DateUtil.getCurrentDateStr2());
		if(id!=null){
			Capital	capital = capitalService.selectByPrimaryKey2(Integer.valueOf(id));
			if(capital!=null){
				request.setAttribute("available", capital.getAvailable());
			}else{
				return "client/BankCard";
			}
		}
		return "client/pay";
	}
	
}
