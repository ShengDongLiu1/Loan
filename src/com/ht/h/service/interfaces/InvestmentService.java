package com.ht.h.service.interfaces;

import com.ht.h.bean.Investment;

public interface InvestmentService {
	int deleteByPrimaryKey(Integer iid);

    int insert(Investment record);

    int insertSelective(Investment record);

    Investment selectByPrimaryKey(Integer iid);

    int updateByPrimaryKeySelective(Investment record);

    int updateByPrimaryKey(Investment record);
}
