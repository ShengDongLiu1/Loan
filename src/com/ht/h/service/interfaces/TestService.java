package com.ht.h.service.interfaces;

import com.ht.h.bean.Test;

public interface TestService {
	int deleteByPrimaryKey(Integer tid);

    int insert(Test record);

    int insertSelective(Test record);

    Test selectByPrimaryKey(Integer tid);

    int updateByPrimaryKeySelective(Test record);

    int updateByPrimaryKey(Test record);
}
