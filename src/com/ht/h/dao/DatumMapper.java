package com.ht.h.dao;

import com.ht.h.bean.Datum;

public interface DatumMapper {
    int deleteByPrimaryKey(Integer did);

    int insert(Datum record);

    int insertSelective(Datum record);

    Datum selectByPrimaryKey(Integer did);

    int updateByPrimaryKeySelective(Datum record);

    int updateByPrimaryKey(Datum record);
    
    Datum selectByDlid(Integer dlid);
}