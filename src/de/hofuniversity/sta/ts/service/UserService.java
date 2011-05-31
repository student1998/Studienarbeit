package de.hofuniversity.sta.ts.service;

import java.util.List;

import de.hofuniversity.sta.ts.domain.User;

public interface UserService {
	
	public void addUser(User user);
	
	public List<User> listUser();
	
	public void removeUser(Integer userid);
	
}
