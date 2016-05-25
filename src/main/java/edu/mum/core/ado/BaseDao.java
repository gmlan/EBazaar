package edu.mum.core.ado;

import java.io.Serializable;
import java.util.List;

import edu.mum.core.domain.PageResult;
import edu.mum.core.domain.QueryHelper;
 
public interface BaseDao<T> {
	public void save(T entity);
	public void update(T entity);
	public void delete(Serializable id);
	public T findObjectById(Serializable id);
	public List<T> findObjects();
	public List<T> findObjects(String hql, List<Object> parameters);
	public List<T> findObjects(QueryHelper queryHelper);
	public PageResult getPageResult(QueryHelper queryHelper, int pageNo, int pageSize);

}
