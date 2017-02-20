package com.ht.h.bean;

import java.util.Date;

public class Frozen {
    private Integer fid;

    private Integer uid;

    private Long fmoney;

    private Date ftime;

    private String fstate;

    private String fremarks;

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Long getFmoney() {
        return fmoney;
    }

    public void setFmoney(Long fmoney) {
        this.fmoney = fmoney;
    }

    public Date getFtime() {
        return ftime;
    }

    public void setFtime(Date ftime) {
        this.ftime = ftime;
    }

    public String getFstate() {
        return fstate;
    }

    public void setFstate(String fstate) {
        this.fstate = fstate == null ? null : fstate.trim();
    }

    public String getFremarks() {
        return fremarks;
    }

    public void setFremarks(String fremarks) {
        this.fremarks = fremarks == null ? null : fremarks.trim();
    }
}