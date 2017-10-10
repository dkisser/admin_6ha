package org.lf.admin.db.dao;

import org.lf.admin.db.pojo.City;

public interface CityMapper extends BaseMapper<City>{
    int deleteByPrimaryKey(Integer cityId);

    int insert(City record);

    int insertSelective(City record);

    City selectByPrimaryKey(Integer cityId);

    int updateByPrimaryKeySelective(City record);

    int updateByPrimaryKey(City record);
}