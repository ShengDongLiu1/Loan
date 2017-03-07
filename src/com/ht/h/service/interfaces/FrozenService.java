package com.ht.h.service.interfaces;

import java.util.List;
import java.util.Map;

import com.ht.h.bean.Frozen;

public interface FrozenService {
	int deleteByPrimaryKey(Integer fid);

    int insert(Frozen record);

    int insertSelective(Frozen record);

    Frozen selectByPrimaryKey(Integer fid);

    int updateByPrimaryKeySelective(Frozen record);

    int updateByPrimaryKey(Frozen record);

	int frozenCount(Map<String, Object> map);

	List<Frozen> frozenQueryAll(Map<String, Object> map);
}
