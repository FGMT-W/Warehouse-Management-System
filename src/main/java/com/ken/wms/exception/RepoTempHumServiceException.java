package com.ken.wms.exception;

/**
 * RepositoryManageService异常
 *
 * @author Ken
 * @since 2017/3/8.
 */
public class RepoTempHumServiceException extends BusinessException {

    RepoTempHumServiceException(){
        super();
    }

    public RepoTempHumServiceException(Exception e){
        super(e);
    }

    RepoTempHumServiceException(Exception e, String exceptionDesc){
        super(e, exceptionDesc);
    }

}
