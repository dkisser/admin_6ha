package org.lf.admin.db.dao;

import org.lf.admin.db.pojo.Province;

public interface ProvinceMapper extends BaseMapper<Province>{
    int deleteByPrimaryKey(Integer provinceId);

    int insert(Province record);

    int insertSelective(Province record);

    Province selectByPrimaryKey(Integer provinceId);

    int updateByPrimaryKeySelective(Province record);

    int updateByPrimaryKey(Province record);
}