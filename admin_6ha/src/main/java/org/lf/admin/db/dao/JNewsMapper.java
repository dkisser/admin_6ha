package org.lf.admin.db.dao;

import org.lf.admin.db.pojo.JNews;

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