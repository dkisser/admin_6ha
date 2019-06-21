package org.lf.admin.db.dao;
/** * @author  wenchen 
 * @date 创建时间：2017年8月22日 下午1:00:06 
 * @version 1.0 
 * @parameter */
public class PagedPojo {
	
	private Integer start;
	
	private Integer offset;

	public Integer getStart() {
		return start;
	}

	public void setStart(Integer start) {
		this.start = start;
	}

	public Integer getOffset() {
		return offset;
	}

	public void setOffset(Integer offset) {
		this.offset = offset;
	}

}
