package usercrud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import usercrud.dao.UserDao;
import usercrud.model.User;

@Service
public class UserService implements IUserService {

	@Autowired
	UserDao userDao;
	
	public List<User> list() {
		// TODO Auto-generated method stub
		return userDao.list();
	}

	public void add(User user) {
		// TODO Auto-generated method stub
		userDao.add(user);
	}

	public void delete(User user) {
		// TODO Auto-generated method stub
		userDao.delete(user);
	}

	public void update(User user) {
		// TODO Auto-generated method stub
		userDao.update(user);
	}

	public User findById(String id) {
		// TODO Auto-generated method stub
		return userDao.findById(id);
	}

}
