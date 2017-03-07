package com.ht.h.bean;

import java.util.Date;

/**
 * 提现表
 * @author LiuShengDong
 *
 */

public class Withdrawals {
    private Integer wid;

    private Integer uid;

    private String wnumber;

    private String wbank;

    private double wmoney;

    private double wcounterfee;

    private double wactual;

    private String wstate;

    private Date wtime;

    private Customer customer;
    
    private Capital capital;

    public Capital getCapital() {
		return capital;
	}

	public void setCapital(Capital capital) {
		this.capital = capital;
	}

    public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Integer getWid() {
        return wid;
    }

    public void setWid(Integer wid) {
        this.wid = wid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getWnumber() {
        return wnumber;
    }

    public void setWnumber(String wnumber) {
        this.wnumber = wnumber == null ? null : wnumber.trim();
    }

    public String getWbank() {
        return wbank;
    }

    public void setWbank(String wbank) {
        this.wbank = wbank == null ? null : wbank.trim();
    }

    public double getWmoney() {
        return wmoney;
    }

    public void setWmoney(double wmoney) {
        this.wmoney = wmoney;
    }

    public double getWcounterfee() {
        return wcounterfee;
    }

    public void setWcounterfee(double wcounterfee) {
        this.wcounterfee = wcounterfee;
    }

    public double getWactual() {
        return wactual;
    }

    public void setWactual(double wactual) {
        this.wactual = wactual;
    }

    public String getWstate() {
        return wstate;
    }

    public void setWstate(String wstate) {
        this.wstate = wstate == null ? null : wstate.trim();
    }

    public Date getWtime() {
        return wtime;
    }

    public void setWtime(Date wtime) {
        this.wtime = wtime;
    }
}