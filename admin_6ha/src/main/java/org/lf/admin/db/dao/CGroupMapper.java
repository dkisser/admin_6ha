package org.lf.admin.db.dao;

import org.lf.admin.db.pojo.CGroup;

public interface CGroupMapper extends BaseMapper<CGroup>{
    int deleteByPrimaryKey(Integer id);

    int insert(CGroup record);

    int insertSelective(CGroup record);

    CGroup selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CGroup record);

    int updateByPrimaryKey(CGroup record);
}