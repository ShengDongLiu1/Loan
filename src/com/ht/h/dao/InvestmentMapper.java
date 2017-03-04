package com.ht.h.dao;

import com.ht.h.bean.Investment;

public interface InvestmentMapper {
    int deleteByPrimaryKey(Integer iid);

    int insert(Investment record);

    int insertSelective(Investment record);

    Investment selectByPrimaryKey(Integer iid);

    int updateByPrimaryKeySelective(Investment record);

    int updateByPrimaryKey(Investment record);
    
    String repeatUser(Integer iuid);
}