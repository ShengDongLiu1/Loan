package com.ht.h.bean;

import java.util.Date;

public class Repayment {
    private Integer rid;

    private Integer uid;

    private Integer lid;

    private Integer reperiods;

    private Date rexpiretime;

    private Long rmoney;

    private Date rtime;

    private String rtype;

    private String rstate;
    
    private Customer customer;
    
    private Loan loan;

    private Capital capital;

    public Capital getCapital() {
		return capital;
	}

	public void setCapital(Capital capital) {
		this.capital = capital;
	}

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getLid() {
        return lid;
    }

    public void setLid(Integer lid) {
        this.lid = lid;
    }

    public Integer getReperiods() {
        return reperiods;
    }

    public void setReperiods(Integer reperiods) {
        this.reperiods = reperiods;
    }

    public Date getRexpiretime() {
        return rexpiretime;
    }

    public void setRexpiretime(Date rexpiretime) {
        this.rexpiretime = rexpiretime;
    }

    public Long getRmoney() {
        return rmoney;
    }

    public void setRmoney(Long rmoney) {
        this.rmoney = rmoney;
    }

    public Date getRtime() {
        return rtime;
    }

    public void setRtime(Date rtime) {
        this.rtime = rtime;
    }

    public String getRtype() {
        return rtype;
    }

    public void setRtype(String rtype) {
        this.rtype = rtype == null ? null : rtype.trim();
    }

    public String getRstate() {
        return rstate;
    }

    public void setRstate(String rstate) {
        this.rstate = rstate == null ? null : rstate.trim();
    }

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Loan getLoan() {
		return loan;
	}

	public void setLoan(Loan loan) {
		this.loan = loan;
	}
    
}