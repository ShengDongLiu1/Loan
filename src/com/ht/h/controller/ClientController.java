package com.ht.h.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.ht.h.bean.Bank;
import com.ht.h.bean.Capital;
import com.ht.h.bean.Customer;
import com.ht.h.bean.Investment;
import com.ht.h.bean.Loan;
import com.ht.h.bean.PageBean;
import com.ht.h.bean.Recharge;
import com.ht.h.dto.DateUtil;
import com.ht.h.dto.Pager;
import com.ht.h.dto.StringUtil;
import com.ht.h.service.interfaces.BankService;
import com.ht.h.service.interfaces.CapitalService;
import com.ht.h.service.interfaces.InvestmentService;
import com.ht.h.service.interfaces.LoanService;
import com.ht.h.service.interfaces.RechargeService;
import com.ht.h.util.ResponseUtil;

@Controller
@RequestMapping(value="client")
public class ClientController {

	@Autowired
	private CapitalService capitalService;
	
	@Autowired
	private BankService bankService;
	
	@Autowired
	private RechargeService rechargeService;
	
	@Autowired
	private InvestmentService investmentService;
	
	
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
	public String left(HttpServletRequest request,HttpSession session){
		Customer kh=(Customer)session.getAttribute("customer");
		Integer uid=kh.getUid();
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
	public String MoneyRecord(HttpServletRequest request,@RequestParam(value="state",required=false)String state,@RequestParam(value="time1",required=false)String time1,@RequestParam(value="time",required=false)String time,@RequestParam(value="page",required=false)Integer page,HttpSession session){
		//if(state == "1" && state.equals("1")){//查询充值表
		PageBean pageBean=null;
		if(page == null){
			pageBean=new PageBean(1,10);
		}else{
			pageBean=new PageBean(page,10);
		}
		Customer customer = (Customer) session.getAttribute("customer");
		Map<String,Object> map=new HashMap<String,Object>();
			
		map.put("uid", customer.getUid());
		map.put("rtime", time);
		map.put("rtime1", time1);
		map.put("uid", customer.getUid());
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Recharge> userList=rechargeService.rechargetQueryAll(map);
		int total = rechargeService.rechargetCount(map);
		pageBean.setTotal(total);
		request.setAttribute("userList", userList);
		request.setAttribute("total", total);//总条数
		request.setAttribute("count",pageBean.getCount());//总页数
		request.setAttribute("page", pageBean.getPage());		//当前页
		request.setAttribute("pageSize", pageBean.getPageSize());//一页显示条数
		return "client/MoneyRecord";
	}
	
	@SuppressWarnings("unused")
	@RequestMapping(value="test")
	public String test(HttpSession session,HttpServletRequest request,@RequestParam(value="page",required=false)Integer page){
		PageBean pageBean=null;
		if (pageBean==null) {
			PageBean pBean=new PageBean(1, 10);
		}else{
			PageBean pageB=new PageBean(page, 10);
		}
		return "test.jsp";
	}
	
	/*
	 * 投资管理
	 * */
	@RequestMapping(value="investment")
	public String investment(@RequestParam(value="page",required=false)String page,@RequestParam(value="rows",required=false)String rows, HttpServletRequest request){
		PageBean pageBean=null;
		if(page == null && rows == null){
			pageBean=new PageBean(1,10);
		}else{
			pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		}
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Investment> list=investmentService.InvestmentSelectAll(map);
		Long total=investmentService.getTotal(map);
		request.setAttribute("rechList", list);
		request.setAttribute("total", total);
		pageBean.setTotal(Integer.parseInt(String.valueOf(total)));
		request.setAttribute("count", pageBean.getCount());
		request.setAttribute("page",pageBean.getPage());
		request.setAttribute("pageSize",pageBean.getPageSize());
		return "client/investment";
		}
	
	/*
	 *借款管理
	 * */
	@RequestMapping(value="BorrowMoney")
	public String BorrowMoney(Loan loan,@RequestParam(value="page",required=false)String page,@RequestParam(value="rows",required=false)String rows,HttpServletRequest request,HttpSession session){
		PageBean pageBean=null;
		if(page == null || rows == null){
			pageBean=new PageBean(1,10);
		}else{
			pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		}
		Map<String, Object> map=new HashMap<>();
		Customer customer=(Customer) session.getAttribute("customer");
		map.put("lstate", loan.getLstate());
		map.put("uid", customer.getUid());
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Loan> loanList=loanService.queryAll(map);
		Long total=loanService.getTotal(map);
		int i=total.intValue();
		pageBean.setTotal(i);
		request.setAttribute("loanList", loanList);//查询出当前已登入的用户下所有的借款
		request.setAttribute("total", total);//总条数
		request.setAttribute("count",pageBean.getCount());//总页数
		request.setAttribute("page", pageBean.getPage());//当前页
		request.setAttribute("pageSize", pageBean.getPageSize());//一页显示条数
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
	 * 跳转到汇付天下
	 * @throws Exception 
	 */
	@RequestMapping(value="pay1")
	@ResponseBody
	public String pay1(String id,HttpServletRequest request,String lid,HttpServletResponse response) throws Exception{
		JSONObject result = new JSONObject();
		if(id!=null){
			String iuid = investmentService.repeatUser(Integer.valueOf(id),Integer.valueOf(lid));
			if(Integer.valueOf(iuid)<1){
				Capital	capital = capitalService.selectByPrimaryKey2(Integer.valueOf(id));
				if(capital!=null){
					result.put("success", true);
				}else{
					result.put("result", "err1");
				}
			}else{
				result.put("result", "err2");
			}
		}
		ResponseUtil.write(response, result);
		return null;
	}
	
	@RequestMapping(value="pay")
	public String pay(HttpServletRequest request,String qian,String id,String lid) throws Exception{
		Capital	capital = capitalService.selectByPrimaryKey2(Integer.valueOf(id));
		request.setAttribute("available", capital.getAvailable());
		request.setAttribute("qian", qian);
		request.setAttribute("lid", lid);
		request.setAttribute("dingdan", "HJ"+DateUtil.getCurrentDateStr());
		request.setAttribute("time1", DateUtil.getCurrentDateStr2());
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
