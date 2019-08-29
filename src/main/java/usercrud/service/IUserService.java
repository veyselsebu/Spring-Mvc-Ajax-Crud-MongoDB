package usercrud.service;

import java.util.List;

import usercrud.model.User;

public interface IUserService {
	public List<User> list();
	
	public void add(User user);
	
	public void delete(User user);
	
	public void update (User user);
	
	public User findById(String id);
}
