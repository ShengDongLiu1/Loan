package com.ht.h.service.interfaces;

import com.ht.h.bean.Withdrawals;

public interface WithdrawalsService {
	int deleteByPrimaryKey(Integer wid);

    int insert(Withdrawals record);

    int insertSelective(Withdrawals record);

    Withdrawals selectByPrimaryKey(Integer wid);

    int updateByPrimaryKeySelective(Withdrawals record);

    int updateByPrimaryKey(Withdrawals record);
}
