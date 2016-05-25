package edu.mum.cs425.service.impl;

import java.io.Serializable;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sun.org.apache.xml.internal.security.Init;

import edu.mum.core.service.impl.BaseServiceImpl;
import edu.mum.cs425.dao.UserDao;
import edu.mum.cs425.domain.Role;
import edu.mum.cs425.domain.User;
import edu.mum.cs425.domain.UserRole;
import edu.mum.cs425.domain.UserRoleId;
import edu.mum.cs425.service.UserService;

@Service("userService")
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService {
	
	@Autowired
	private UserDao userDao;
	 
	@PostConstruct
	public void init(){		
		super.setBaseDao(userDao);
	}

	@Override
	@Transactional
	public void delete(Serializable id) {
		userDao.delete(id);
		userDao.deleteUserRoleByUserId(id);
	}
 

	@Override
	@Transactional
	public List<User> findUserByAccountAndId(String id, String account) {
		return userDao.findUserByAccountAndId(id, account);
	}

	@Override
	@Transactional
	public void saveUserAndRole(User user, String... roleIds) {
		save(user);
		if(roleIds != null){
			for(String roleId: roleIds){
				userDao.saveUserRole(new UserRole(new UserRoleId(new Role(roleId), user.getId())));
			}
		}
	}

	@Override
	@Transactional
	public void updateUserAndRole(User user, String... roleIds) {
		userDao.deleteUserRoleByUserId(user.getId());
		update(user);
		if(roleIds != null){
			for(String roleId: roleIds){
				userDao.saveUserRole(new UserRole(new UserRoleId(new Role(roleId), user.getId())));
			}
		}
	}

	@Override
	@Transactional
	public List<UserRole> getUserRolesByUserId(String id) {
		return userDao.getUserRolesByUserId(id);
	}

	@Override
	@Transactional
	public List<User> findUserByAccountAndPass(String account, String password) {
		return userDao.findUsersByAcccountAndPass(account, password);
	}

}
