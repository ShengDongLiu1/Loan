package com.ht.h.dao;

<<<<<<< HEAD
import java.util.List;
import java.util.Map;

=======
>>>>>>> master
import com.ht.h.bean.Investment;

public interface InvestmentMapper {
    int deleteByPrimaryKey(Integer iid);

    int insert(Investment record);

    int insertSelective(Investment record);

    Investment selectByPrimaryKey(Integer iid);

    int updateByPrimaryKeySelective(Investment record);

    int updateByPrimaryKey(Investment record);
    
<<<<<<< HEAD
    List<Investment> InvestmentSelectAll(Map<String, Object> map);
    
    Long getTotal(Map<String, Object> map);
=======
    String repeatUser(Integer iuid);
>>>>>>> master
}