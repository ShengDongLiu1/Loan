package com.ht.h.service.interfaces;

import com.ht.h.bean.Income;

public interface IncomeService {
	int deleteByPrimaryKey(Integer iid);

    int insert(Income record);

    int insertSelective(Income record);

    Income selectByPrimaryKey(Integer iid);

    int updateByPrimaryKeySelective(Income record);

    int updateByPrimaryKey(Income record);
}
