package usercrud.dao;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

import com.mongodb.BasicDBObject;

import usercrud.model.User;

@Repository
public class UserDao implements IUserDao{
	
	@Autowired 
	MongoTemplate mongoTemplate;
	
	private static final String COLLECTION_NAME="user";
	
	public List<User> list() {

		return mongoTemplate.findAll(User.class,COLLECTION_NAME);
	}

	public void add(User user) {
		if(!mongoTemplate.collectionExists(User.class)) {
			mongoTemplate.createCollection(User.class);
		}
		user.setId(UUID.randomUUID().toString());
		System.out.println(user.getName());
		mongoTemplate.insert(user,COLLECTION_NAME);
	}

	public void delete(User user) {
		mongoTemplate.remove(user,COLLECTION_NAME);	
	}

	public void update(User user) {
		System.out.println("guncelleme 2");
		Query query = new Query(Criteria.where("_id").is(user.getId()));
		Update update = new Update().set("name", user.getName()).set("phoneNumber", user.getPhoneNumber());
		mongoTemplate.upsert(query, update, COLLECTION_NAME);
	}

	public User findById(String id) {
		// TODO Auto-generated method stub
		return mongoTemplate.findById(id, User.class);
	}

}
