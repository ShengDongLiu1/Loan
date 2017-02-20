package com.ht.h.dao;

import com.ht.h.bean.Loan;

public interface LoanMapper {
    int deleteByPrimaryKey(Integer lid);

    int insert(Loan record);

    int insertSelective(Loan record);

    Loan selectByPrimaryKey(Integer lid);

    int updateByPrimaryKeySelective(Loan record);

    int updateByPrimaryKey(Loan record);
}