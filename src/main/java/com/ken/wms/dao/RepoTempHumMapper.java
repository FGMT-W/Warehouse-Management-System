package com.ken.wms.dao;

import com.ken.wms.domain.RepoTempHumDO;
import com.ken.wms.domain.RepoTempHumDTO;
import com.ken.wms.domain.Repository;

import java.util.List;


@org.springframework.stereotype.Repository
public interface RepoTempHumMapper {


	List<RepoTempHumDTO> selectAll();

	List<RepoTempHumDTO> selectByID(Integer repositoryID);

	void insert(RepoTempHumDO repoTempHumDO);

}
