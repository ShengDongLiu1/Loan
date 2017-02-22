package com.ht.h.bean;

import java.util.Date;

public class Expenditure {
    private Integer eid;

    private Integer uid;

    private String etype;

    private Long emoney;

    private Date etime;

    private String eremarks;
    
    private Customer customer;

    public Integer getEid() {
        return eid;
    }

    public void setEid(Integer eid) {
        this.eid = eid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getEtype() {
        return etype;
    }

    public void setEtype(String etype) {
        this.etype = etype == null ? null : etype.trim();
    }

    public Long getEmoney() {
        return emoney;
    }

    public void setEmoney(Long emoney) {
        this.emoney = emoney;
    }

    public Date getEtime() {
        return etime;
    }

    public void setEtime(Date etime) {
        this.etime = etime;
    }

    public String getEremarks() {
        return eremarks;
    }

    public void setEremarks(String eremarks) {
        this.eremarks = eremarks == null ? null : eremarks.trim();
    }

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
    
}