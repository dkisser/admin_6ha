package org.lf.admin.db.dao;

import java.util.List;
import java.util.Map;

import org.lf.admin.db.pojo.VNews;

public interface VNewsMapper extends BaseMapper<VNews>{
    int insert(VNews record);

    int insertSelective(VNews record);
    
    /**
     * 根据申请人（sqr）、标题（title），初审人（FZR），终审（GLR），ztList来进行模糊查询.而别的条件则是精确查询
     * @param param
     * @return
     */
    List<VNews> getVnewsListFuzzy(Map<String,?> param);
}