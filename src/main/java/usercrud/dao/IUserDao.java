package usercrud.dao;

import java.util.List;

import usercrud.model.User;

public interface IUserDao {

	public List<User> list();
	
	public void add(User user);
	
	public void delete(User user);
	
	public void update (User user);
	
	public User findById(String id);
}
