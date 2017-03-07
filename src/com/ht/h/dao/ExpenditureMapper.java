package com.ht.h.dao;

import java.util.List;
import java.util.Map;

import com.ht.h.bean.Expenditure;
import com.ht.h.bean.Income;

public interface ExpenditureMapper {
    int deleteByPrimaryKey(Integer eid);

    int insert(Expenditure record);

    int insertSelective(Expenditure record);

    Expenditure selectByPrimaryKey(Integer eid);

    int updateByPrimaryKeySelective(Expenditure record);

    int updateByPrimaryKey(Expenditure record);
    
    List<Expenditure> queryAll(Map<String, Object> map);
    
    Long getTotal(Map<String, Object> map);
    
    List<Expenditure> expendAll();
}