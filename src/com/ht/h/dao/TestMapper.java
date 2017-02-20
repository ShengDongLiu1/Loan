package com.ht.h.dao;

import com.ht.h.bean.Test;

public interface TestMapper {
    int deleteByPrimaryKey(Integer tid);

    int insert(Test record);

    int insertSelective(Test record);

    Test selectByPrimaryKey(Integer tid);

    int updateByPrimaryKeySelective(Test record);

    int updateByPrimaryKey(Test record);
}