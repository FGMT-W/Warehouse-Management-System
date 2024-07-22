package com.ken.wms.domain;

import java.text.SimpleDateFormat;

/**
 * Created by wenka on 2021/5/30.
 */
public class RepoTempHumDTO extends RepoTempHumDO{

    private String repoAdminName;

    private String createTimeStr;

    public String getRepoAdminName() {
        return repoAdminName;
    }

    public void setRepoAdminName(String repoAdminName) {
        this.repoAdminName = repoAdminName;
    }

    public String getCreateTimeStr() {
        SimpleDateFormat sdf =   new SimpleDateFormat( " yyyy-MM-dd HH:mm:ss " );
        if(super.getCreateTime() != null){
            return sdf.format(super.getCreateTime());
        }else{
            return null;
        }
    }
}
