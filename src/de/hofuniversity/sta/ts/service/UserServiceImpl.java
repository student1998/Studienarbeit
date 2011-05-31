package de.hofuniversity.sta.ts.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import de.hofuniversity.sta.ts.dao.UserDao;
import de.hofuniversity.sta.ts.domain.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	@Transactional
	public void addUser(User user) {
		userDao.addUser(user);

	}

	@Transactional
	public List<User> listUser() {
		return userDao.listUser();
	}

	@Transactional
	public void removeUser(Integer userid) {
		userDao.removeUser(userid);

	}

}
