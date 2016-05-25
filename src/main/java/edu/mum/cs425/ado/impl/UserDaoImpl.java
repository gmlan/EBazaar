package edu.mum.cs425.ado.impl;

import java.io.Serializable;
import java.util.List;

import org.hamcrest.core.Is;
import org.hibernate.Query;

import edu.mum.core.ado.impl.BaseDaoImpl;
import edu.mum.cs425.ado.UserDao;
import edu.mum.cs425.domain.User;
import edu.mum.cs425.domain.UserRole; 

public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao {

	@Override
	public List<User> findUserByAccountAndId(String id, String account) {
		String hql = "FROM User WHERE account = ? AND id==?";
		
		Query query = getSession().createQuery(hql);
		query.setParameter(0, account);	
		query.setParameter(1, id);
		
		return query.list();
	}

	@Override
	public void saveUserRole(UserRole userRole) {
		getHibernateTemplate().save(userRole);
	}

	@Override
	public void deleteUserRoleByUserId(Serializable id) {
		Query query = getSession().createQuery("DELETE FROM UserRole WHERE id.userId=?");
		query.setParameter(0, id);
		query.executeUpdate();
	}

	@Override
	public List<UserRole> getUserRolesByUserId(String id) {
		Query query = getSession().createQuery("FROM UserRole WHERE id.userId=?");
		query.setParameter(0, id);
		return query.list();
	}

	@Override
	public List<User> findUsersByAcccountAndPass(String account, String password) {
		Query query = getSession().createQuery("FROM User WHERE account=? AND password=?");
		query.setParameter(0, account);
		query.setParameter(1, password);
		return query.list();
	}

}
