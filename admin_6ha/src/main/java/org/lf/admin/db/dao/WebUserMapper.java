package org.lf.admin.db.dao;

import org.lf.admin.db.pojo.WebUser;


public interface WebUserMapper extends BaseMapper<WebUser>{
    int deleteByPrimaryKey(Integer id);

    int insert(WebUser record);

    int insertSelective(WebUser record);

    WebUser selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(WebUser record);

    int updateByPrimaryKey(WebUser record);
}