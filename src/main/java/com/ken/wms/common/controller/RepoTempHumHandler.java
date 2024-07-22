package com.ken.wms.common.controller;

import com.ken.wms.common.service.Interface.RepoTempHumService;
import com.ken.wms.common.service.Interface.RepositoryAdminManageService;
import com.ken.wms.common.util.Response;
import com.ken.wms.common.util.ResponseUtil;
import com.ken.wms.domain.*;
import com.ken.wms.exception.RepoTempHumServiceException;
import com.ken.wms.exception.RepositoryAdminManageServiceException;
import com.ken.wms.exception.RepositoryManageServiceException;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by wenka on 2021/5/30.
 */
@Controller
@RequestMapping(value = "/**/repoTempHum")
public class RepoTempHumHandler {

    private static final String SEARCH_BY_ID = "searchByID";
    private static final String SEARCH_ALL = "searchAll";

    @Autowired
    RepoTempHumService repoTempHumService;
    @Autowired
    RepositoryAdminManageService repositoryAdminManageService;
    @Autowired
    private ResponseUtil responseUtil;

    @SuppressWarnings("unchecked")
    @RequestMapping(value = "getRepoTempHumList", method = RequestMethod.GET)
    public
    @ResponseBody
    Map<String, Object> getRepoTempHumList(@RequestParam("operID") String operIDStr,
                                          @RequestParam("offset") int offset, @RequestParam("limit") int limit) throws RepoTempHumServiceException {

        // 创建 Response 对象
        Response responseContent = responseUtil.newResponseInstance();
        List<RepoTempHumDTO> rows = null;
        long total = 0;

        //查询
        Map<String, Object> queryResult = null;
        if(StringUtils.isBlank(operIDStr)){
            queryResult = query(SEARCH_ALL, null, offset, limit);
        }else{
            queryResult = query(SEARCH_BY_ID, operIDStr, offset, limit);
        }

        if (queryResult != null) {
            rows = (List<RepoTempHumDTO>) queryResult.get("data");
            total = (long) queryResult.get("total");
        }

        // 设置 Response
        responseContent.setCustomerInfo("rows", rows);
        responseContent.setResponseTotal(total);
        return responseContent.generateResponse();
    }

    /**
     * 通用的记录查询
     *
     * @param searchType 查询方式
     * @param keyword    查询关键字
     * @param offset     分页偏移值
     * @param limit      分页大小
     * @return 返回所有符合条件的查询结果
     */
    private Map<String, Object> query(String searchType, String keyword, int offset, int limit) throws RepoTempHumServiceException {
        Map<String, Object> queryResult = null;

        switch (searchType) {
            case SEARCH_BY_ID:
                if (StringUtils.isNumeric(keyword)) {
                    queryResult = repoTempHumService.selectById(Integer.valueOf(keyword), offset, limit);
                }
                break;
            case SEARCH_ALL:
                queryResult = repoTempHumService.selectAll(offset, limit);
                break;
            default:
                // do other thing
                break;
        }
        return queryResult;
    }

    @RequestMapping(value = "addRepoTempHumRecord", method = RequestMethod.POST)
    public
    @ResponseBody
    Map<String, Object> addRepoTempHumRecord(@RequestBody RepoTempHumInsert repoTempHumInsert) throws RepoTempHumServiceException, RepositoryAdminManageServiceException, ParseException {
        RepoTempHumDO repoTempHumDO = new RepoTempHumDO();
        BeanUtils.copyProperties(repoTempHumInsert, repoTempHumDO);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        repoTempHumDO.setCreateTime(formatter.parse(repoTempHumInsert.getCreateTimeStr()));

        // 初始化 Response
        Response responseContent = responseUtil.newResponseInstance();
        //查询该仓库管理员信息
        Subject currentSubject = SecurityUtils.getSubject();
        Session session = currentSubject.getSession();
        Integer userID = (Integer)session.getAttribute("userID");
        Map<String, Object> repoMap = repositoryAdminManageService.selectByID(userID);
        Object a = repoMap.get("total");
        Long total = (Long) repoMap.get("total");
        if(total != null && total > 0){
            List<RepositoryAdmin> repositoryAdmins = (List<RepositoryAdmin>) repoMap.get("data");
            if(repositoryAdmins != null && repositoryAdmins.size() > 0){
                RepositoryAdmin repositoryAdmin = repositoryAdmins.get(0);
                Integer repoID = repositoryAdmin.getRepositoryBelongID();
                repoTempHumDO.setRepoID(repoID);
                repoTempHumDO.setRepoAdminID(userID);
                //添加记录
                String result = repoTempHumService.addRepoTempHumRecord(repoTempHumDO) ? Response.RESPONSE_RESULT_SUCCESS : Response.RESPONSE_RESULT_ERROR;

                // 设置 Response
                responseContent.setResponseResult(result);
                return responseContent.generateResponse();
            }else{
                // 设置 Response
                responseContent.setResponseResult(Response.RESPONSE_RESULT_ERROR);
                return responseContent.generateResponse();
            }
        }else{
            // 设置 Response
            responseContent.setResponseResult(Response.RESPONSE_RESULT_ERROR);
            return responseContent.generateResponse();
        }
    }


    @SuppressWarnings("unchecked")
    @RequestMapping(value = "exportRecord", method = RequestMethod.GET)
    public void exportRecord(@RequestParam("operID") String operIDStr, HttpServletResponse response) throws RepoTempHumServiceException, IOException {

        // 导出文件名
        String fileName = "repoTemHumInfo.xlsx";

        // 查询
        List<RepoTempHumDTO> rows = null;
        Map<String, Object> queryResult = null;
        if(StringUtils.isBlank(operIDStr)){
            queryResult = query(SEARCH_ALL, null, -1, -1);
        }else{
            queryResult = query(SEARCH_BY_ID, operIDStr, -1, -1);
        }

        if (queryResult != null)
            rows = (List<RepoTempHumDTO>) queryResult.get("data");
        else
            rows = new ArrayList<>();

        // 生成文件
        File file = repoTempHumService.exportRecord(rows);

        // 输出文件
        if (file != null) {
            // 设置响应头
            response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
            FileInputStream inputStream = new FileInputStream(file);
            OutputStream outputStream = response.getOutputStream();
            byte[] buffer = new byte[8192];

            int len;
            while ((len = inputStream.read(buffer, 0, buffer.length)) > 0) {
                outputStream.write(buffer, 0, len);
                outputStream.flush();
            }

            inputStream.close();
            outputStream.close();
        }
    }
}
