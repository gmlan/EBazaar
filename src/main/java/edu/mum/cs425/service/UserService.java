package edu.mum.cs425.service;

import java.util.List;

import edu.mum.core.service.BaseService;
import edu.mum.cs425.domain.User;
import edu.mum.cs425.domain.UserRole;

public interface UserService extends BaseService<User>{
	
	public List<User> findUserByAccountAndId(String id, String account);
	public void saveUserAndRole(User user, String... roleIds);
	public void updateUserAndRole(User user, String... roleIds);
	public List<UserRole> getUserRolesByUserId(String id);
	public List<User> findUserByAccountAndPass(String account, String password);

}
