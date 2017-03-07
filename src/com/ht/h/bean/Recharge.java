package com.ht.h.bean;

import java.util.Date;

public class Recharge {
    private Integer rid;

    private Integer uid;

    private String rtype;

    private String rbank;

    private Long rmoney;

    private Long rcounterfee;

    private Long ractual;
    
    private String rserial;

	private String rstate;

    private Date rtime;
    
    private String username;
    
    private Capital capital;
    
    private Customer customer;

    public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

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

    public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getRserial() {
		return rserial;
	}

	public void setRserial(String rserial) {
		this.rserial = rserial;
	}

    public String getRtype() {
        return rtype;
    }

    public void setRtype(String rtype) {
        this.rtype = rtype == null ? null : rtype.trim();
    }

    public String getRbank() {
        return rbank;
    }

    public void setRbank(String rbank) {
        this.rbank = rbank == null ? null : rbank.trim();
    }

    public Long getRmoney() {
        return rmoney;
    }

    public void setRmoney(Long rmoney) {
        this.rmoney = rmoney;
    }

    public Long getRcounterfee() {
        return rcounterfee;
    }

    public void setRcounterfee(Long rcounterfee) {
        this.rcounterfee = rcounterfee;
    }

    public Long getRactual() {
        return ractual;
    }

    public void setRactual(Long ractual) {
        this.ractual = ractual;
    }

    public String getRstate() {
        return rstate;
    }

    public void setRstate(String rstate) {
        this.rstate = rstate == null ? null : rstate.trim();
    }

    public Date getRtime() {
        return rtime;
    }

    public void setRtime(Date rtime) {
        this.rtime = rtime;
    }
}