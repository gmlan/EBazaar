package edu.mum.cs425.ado;

import java.io.Serializable;
import java.util.List;

import edu.mum.core.ado.BaseDao;
import edu.mum.cs425.domain.User;
import edu.mum.cs425.domain.UserRole;

public interface UserDao extends BaseDao<User> {

	public List<User> findUserByAccountAndId(String id, String account);

	public void saveUserRole(UserRole userRole);

	public void deleteUserRoleByUserId(Serializable id);
	public List<UserRole> getUserRolesByUserId(String id);
	public List<User> findUsersByAcccountAndPass(String account, String password);

}
