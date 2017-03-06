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

    private Long wmoney;

    private Long wcounterfee;

    private Long wactual;

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

    public Long getWmoney() {
        return wmoney;
    }

    public void setWmoney(Long wmoney) {
        this.wmoney = wmoney;
    }

    public Long getWcounterfee() {
        return wcounterfee;
    }

    public void setWcounterfee(Long wcounterfee) {
        this.wcounterfee = wcounterfee;
    }

    public Long getWactual() {
        return wactual;
    }

    public void setWactual(Long wactual) {
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