package com.ht.h.dao;

import com.ht.h.bean.Capital;

public interface CapitalMapper {
    int deleteByPrimaryKey(Integer cid);

    int insert(Capital record);

    int insertSelective(Capital record);

    Capital selectByPrimaryKey(Integer cid);

    int updateByPrimaryKeySelective(Capital record);

    int updateByPrimaryKey(Capital record);
}