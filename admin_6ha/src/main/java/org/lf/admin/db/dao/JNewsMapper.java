package org.lf.admin.db.dao;

import org.apache.poi.ss.formula.functions.T;
import org.lf.admin.db.pojo.JNews;

import java.util.List;

public interface JNewsMapper extends BaseMapper<JNews>{
    int deleteByPrimaryKey(Integer id);

    int insert(JNews record);

    int insertSelective(JNews record);

    JNews selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(JNews record);
    
    int updateByPrimaryKeyWithBLOBs(JNews record);
    
    int updateByPrimaryKeyWithBLOBsSelective(JNews record);

    int updateByPrimaryKey(JNews record);

}