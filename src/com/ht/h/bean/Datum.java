package com.ht.h.bean;

public class Datum {
    private Integer did;

    private Integer dlid;

    private String dcard;

    private String household;

    private String dcensus;

    private String dcredit;

    private String dapply;

    private String dother1;

    private String dother2;

    private String dother3;

    public Integer getDid() {
        return did;
    }

    public void setDid(Integer did) {
        this.did = did;
    }

    public Integer getDlid() {
        return dlid;
    }

    public void setDlid(Integer dlid) {
        this.dlid = dlid;
    }

    public String getDcard() {
        return dcard;
    }

    public void setDcard(String dcard) {
        this.dcard = dcard == null ? null : dcard.trim();
    }

    public String getHousehold() {
        return household;
    }

    public void setHousehold(String household) {
        this.household = household == null ? null : household.trim();
    }

    public String getDcensus() {
        return dcensus;
    }

    public void setDcensus(String dcensus) {
        this.dcensus = dcensus == null ? null : dcensus.trim();
    }

    public String getDcredit() {
        return dcredit;
    }

    public void setDcredit(String dcredit) {
        this.dcredit = dcredit == null ? null : dcredit.trim();
    }

    public String getDapply() {
        return dapply;
    }

    public void setDapply(String dapply) {
        this.dapply = dapply == null ? null : dapply.trim();
    }

    public String getDother1() {
        return dother1;
    }

    public void setDother1(String dother1) {
        this.dother1 = dother1 == null ? null : dother1.trim();
    }

    public String getDother2() {
        return dother2;
    }

    public void setDother2(String dother2) {
        this.dother2 = dother2 == null ? null : dother2.trim();
    }

    public String getDother3() {
        return dother3;
    }

    public void setDother3(String dother3) {
        this.dother3 = dother3 == null ? null : dother3.trim();
    }
}