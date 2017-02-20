package com.ht.h.dao;

import com.ht.h.bean.Expenditure;

public interface ExpenditureMapper {
    int deleteByPrimaryKey(Integer eid);

    int insert(Expenditure record);

    int insertSelective(Expenditure record);

    Expenditure selectByPrimaryKey(Integer eid);

    int updateByPrimaryKeySelective(Expenditure record);

    int updateByPrimaryKey(Expenditure record);
}