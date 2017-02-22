package com.ht.h.service.interfaces;

import java.util.List;
import java.util.Map;

import com.ht.h.bean.Loan;

public interface LoanService {
	int deleteByPrimaryKey(Integer lid);

    int insert(Loan record);

    int insertSelective(Loan record);

    Loan selectByPrimaryKey(Integer lid);

    int updateByPrimaryKeySelective(Loan record);

    int updateByPrimaryKey(Loan record);
    
    List<Loan> queryAll(Map<String, Object> map);
    
    Long getTotal(Map<String, Object> map);
}
