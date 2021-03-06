package com.ht.h.bean;

import java.util.Date;

public class Loan {
    private Integer lid;

    private Integer uid;

    private String ltitle;

    private Long lmoney;

    private Long lrate;

    private Integer lterm;

    private String lclass;

    private Integer lnums;

    private Long lmoneys;

    private String lmiaoshu;

    private String ltype;

    private String lstate;

    private Date ltime;
    
    private Customer customer;

    public Integer getLid() {
        return lid;
    }

    public void setLid(Integer lid) {
        this.lid = lid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getLtitle() {
        return ltitle;
    }

    public void setLtitle(String ltitle) {
        this.ltitle = ltitle == null ? null : ltitle.trim();
    }

    public Long getLmoney() {
        return lmoney;
    }

    public void setLmoney(Long lmoney) {
        this.lmoney = lmoney;
    }

    public Long getLrate() {
        return lrate;
    }

    public void setLrate(Long lrate) {
        this.lrate = lrate;
    }

    public Integer getLterm() {
        return lterm;
    }

    public void setLterm(Integer lterm) {
        this.lterm = lterm;
    }

    public String getLclass() {
        return lclass;
    }

    public void setLclass(String lclass) {
        this.lclass = lclass == null ? null : lclass.trim();
    }

    public Integer getLnums() {
        return lnums;
    }

    public void setLnums(Integer lnums) {
        this.lnums = lnums;
    }

    public Long getLmoneys() {
        return lmoneys;
    }

    public void setLmoneys(Long lmoneys) {
        this.lmoneys = lmoneys;
    }

    public String getLmiaoshu() {
        return lmiaoshu;
    }

    public void setLmiaoshu(String lmiaoshu) {
        this.lmiaoshu = lmiaoshu == null ? null : lmiaoshu.trim();
    }

    public String getLtype() {
        return ltype;
    }

    public void setLtype(String ltype) {
        this.ltype = ltype == null ? null : ltype.trim();
    }

    public String getLstate() {
        return lstate;
    }

    public void setLstate(String lstate) {
        this.lstate = lstate == null ? null : lstate.trim();
    }

    public Date getLtime() {
        return ltime;
    }

    public void setLtime(Date ltime) {
        this.ltime = ltime;
    }

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
    
}