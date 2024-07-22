package com.ken.wms.domain;

import java.util.Date;

/**
 * Created by wenka on 2021/5/30.
 */
public class RepoTempHumDO {

    private Integer logID;

    private Integer repoID;

    private Float temp;

    private Float hum;

    private Integer repoAdminID;

    private Date createTime;

    private String remark;

    public Integer getLogID() {
        return logID;
    }

    public void setLogID(Integer logID) {
        this.logID = logID;
    }

    public Integer getRepoID() {
        return repoID;
    }

    public void setRepoID(Integer repoID) {
        this.repoID = repoID;
    }

    public Float getTemp() {
        return temp;
    }

    public void setTemp(Float temp) {
        this.temp = temp;
    }

    public Float getHum() {
        return hum;
    }

    public void setHum(Float hum) {
        this.hum = hum;
    }

    public Integer getRepoAdminID() {
        return repoAdminID;
    }

    public void setRepoAdminID(Integer repoAdminID) {
        this.repoAdminID = repoAdminID;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
