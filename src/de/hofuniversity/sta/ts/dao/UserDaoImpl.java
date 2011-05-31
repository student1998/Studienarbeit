package de.hofuniversity.sta.ts.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import de.hofuniversity.sta.ts.domain.User;

//Indicates that an annotated class is a "Repository" (or "DAO").
@Repository
public class UserDaoImpl implements UserDao{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void addUser(User user) {
		sessionFactory.getCurrentSession().save(user);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> listUser() {
		
		return sessionFactory.getCurrentSession().createQuery("from User").list();
	}

	@Override
	public void removeUser(Integer userid) {
		
		User user = (User) sessionFactory.getCurrentSession().load(User.class, userid);
		
		if ( user != null){
			sessionFactory.getCurrentSession().delete(user);
		}
		
	}

}
