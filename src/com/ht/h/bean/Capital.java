package com.ht.h.bean;

import java.util.Date;

public class Capital {
    private Integer cid;

    private Integer uid;

    private Long allasset;

    private Long income;

    private Long expenditure;

    private Long collect;

    private Long available;

    private Long frozen;

    private Long still;

    private Date ctime;
    
    private String username;
    
    private Customer customer;

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Long getAllasset() {
        return allasset;
    }

    public void setAllasset(Long allasset) {
        this.allasset = allasset;
    }

    public Long getIncome() {
        return income;
    }

    public void setIncome(Long income) {
        this.income = income;
    }

    public Long getExpenditure() {
        return expenditure;
    }

    public void setExpenditure(Long expenditure) {
        this.expenditure = expenditure;
    }

    public Long getCollect() {
        return collect;
    }

    public void setCollect(Long collect) {
        this.collect = collect;
    }

    public Long getAvailable() {
        return available;
    }

    public void setAvailable(Long available) {
        this.available = available;
    }

    public Long getFrozen() {
        return frozen;
    }

    public void setFrozen(Long frozen) {
        this.frozen = frozen;
    }

    public Long getStill() {
        return still;
    }

    public void setStill(Long still) {
        this.still = still;
    }

    public Date getCtime() {
        return ctime;
    }

    @Override
	public String toString() {
		return "Capital [cid=" + cid + ", uid=" + uid + ", allasset=" + allasset + ", income=" + income
				+ ", expenditure=" + expenditure + ", collect=" + collect + ", available=" + available + ", frozen="
				+ frozen + ", still=" + still + ", ctime=" + ctime + "]";
	}

	public void setCtime(Date ctime) {
        this.ctime = ctime;
    }

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
}