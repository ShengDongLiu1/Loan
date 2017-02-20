package com.ht.h.dao;

import com.ht.h.bean.Withdrawals;

public interface WithdrawalsMapper {
    int deleteByPrimaryKey(Integer wid);

    int insert(Withdrawals record);

    int insertSelective(Withdrawals record);

    Withdrawals selectByPrimaryKey(Integer wid);

    int updateByPrimaryKeySelective(Withdrawals record);

    int updateByPrimaryKey(Withdrawals record);
}