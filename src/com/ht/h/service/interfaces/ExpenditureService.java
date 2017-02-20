package com.ht.h.service.interfaces;

import com.ht.h.bean.Expenditure;

public interface ExpenditureService {
	int deleteByPrimaryKey(Integer eid);

    int insert(Expenditure record);

    int insertSelective(Expenditure record);

    Expenditure selectByPrimaryKey(Integer eid);

    int updateByPrimaryKeySelective(Expenditure record);

    int updateByPrimaryKey(Expenditure record);
}
