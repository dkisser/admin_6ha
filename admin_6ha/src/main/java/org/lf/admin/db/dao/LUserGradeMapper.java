package org.lf.admin.db.dao;

import java.util.List;

import org.lf.admin.db.pojo.LUserGrade;
import org.lf.admin.service.model.Recharge;

public interface LUserGradeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(LUserGrade record);

    int insertSelective(LUserGrade record);

    LUserGrade selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LUserGrade record);

    int updateByPrimaryKey(LUserGrade record);
    
    List<Recharge> getRechargeInfo (Recharge recharge);
    
    List<Recharge> getRechargeYearInfo (String uname);
}