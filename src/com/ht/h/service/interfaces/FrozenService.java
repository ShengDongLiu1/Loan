package com.ht.h.service.interfaces;

import com.ht.h.bean.Frozen;

public interface FrozenService {
	int deleteByPrimaryKey(Integer fid);

    int insert(Frozen record);

    int insertSelective(Frozen record);

    Frozen selectByPrimaryKey(Integer fid);

    int updateByPrimaryKeySelective(Frozen record);

    int updateByPrimaryKey(Frozen record);
}
