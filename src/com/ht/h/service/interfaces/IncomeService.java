package com.ht.h.service.interfaces;

import java.util.List;
import java.util.Map;

import com.ht.h.bean.Income;

public interface IncomeService {
	int deleteByPrimaryKey(Integer iid);

    int insert(Income record);

    int insertSelective(Income record);

    Income selectByPrimaryKey(Integer iid);

    int updateByPrimaryKeySelective(Income record);

    int updateByPrimaryKey(Income record);
    
    List<Income> queryAll(Map<String, Object> map);
    
    Long getTotal(Map<String, Object> map);
    
    List<Income> statementAll();
}
