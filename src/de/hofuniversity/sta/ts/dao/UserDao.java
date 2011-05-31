package de.hofuniversity.sta.ts.dao;

import java.util.List;

import de.hofuniversity.sta.ts.domain.User;

public interface UserDao {
	
	public void addUser(User user);
	
	public List<User> listUser();
	
	public void removeUser(Integer userid);
	
}
