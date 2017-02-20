package com.ht.h.dao;

import com.ht.h.bean.Bank;

public interface BankMapper {
    int deleteByPrimaryKey(Integer bid);

    int insert(Bank record);

    int insertSelective(Bank record);

    Bank selectByPrimaryKey(Integer bid);

    int updateByPrimaryKeySelective(Bank record);

    int updateByPrimaryKey(Bank record);
}