package org.lf.admin.db.dao;

import org.lf.admin.db.pojo.Validate;

public interface ValidateMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Validate record);

    int insertSelective(Validate record);

    Validate selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Validate record);

    int updateByPrimaryKey(Validate record);
    
    int countSelect (Validate validate);
}