package org.lf.admin.db.dao;

import org.lf.admin.db.pojo.RoleAuthory;

public interface RoleAuthoryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(RoleAuthory record);

    int insertSelective(RoleAuthory record);

    RoleAuthory selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(RoleAuthory record);

    int updateByPrimaryKey(RoleAuthory record);
}