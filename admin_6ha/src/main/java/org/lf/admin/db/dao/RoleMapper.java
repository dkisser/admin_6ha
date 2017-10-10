package org.lf.admin.db.dao;

import org.lf.admin.db.pojo.Role;

public interface RoleMapper extends BaseMapper<Role>{
    int deleteByPrimaryKey(Integer id);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);
    

}