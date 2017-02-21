package com.ht.h.bean;

import java.util.Date;

public class Income {
    private Integer iid;

    private Integer uid;

    private String itype;

    private Long imoney;

    private Date itime;

    private String iremarks;
    
    private Customer customer;

    public Integer getIid() {
        return iid;
    }

    public void setIid(Integer iid) {
        this.iid = iid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getItype() {
        return itype;
    }

    public void setItype(String itype) {
        this.itype = itype == null ? null : itype.trim();
    }

    public Long getImoney() {
        return imoney;
    }

    public void setImoney(Long imoney) {
        this.imoney = imoney;
    }

    public Date getItime() {
        return itime;
    }

    public void setItime(Date itime) {
        this.itime = itime;
    }

    public String getIremarks() {
        return iremarks;
    }

    public void setIremarks(String iremarks) {
        this.iremarks = iremarks == null ? null : iremarks.trim();
    }

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
    
}