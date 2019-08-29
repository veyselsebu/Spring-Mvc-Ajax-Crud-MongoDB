package usercrud.controller;

import static org.junit.Assert.assertEquals;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import jdk.net.SocketFlow.Status;
import junit.framework.Assert;
import usercrud.config.WebConfig;
import usercrud.model.User;


public class UserControllerTest {
/////////////////////////////////////////////////////////////////////////////////////////
	/*Mockmvc configurasyon dosyalarýný ayarlýyamadým bu yüzden testleri yazmadým . Daha Spring Mvc kullanmadýðýðm için 
	 * Mockmvc ye aþina degilim... */
///////////////////////////////////////////////////////////////////////////////////////	

	private MockMvc mockMvc;
	@Autowired
	private WebApplicationContext context;
	
	private UserController userController =new UserController();
	@Before
	public void setUp() {
		mockMvc = MockMvcBuilders.standaloneSetup(userController).build();
	}
	
	@Test
	public void getUser() throws Exception {
		/*
			MvcResult result= mockMvc.perform(MockMvcRequestBuilders.get("/list")).andExpect(status().isOk()).andReturn();
			*/
	}
	@Test
	public void saveValidationTest() throws Exception {
		/* User a=new User(null,null,"sebu",null,null);
		 String result=userController.save(a, null,null);
		 assertEquals(result, "name column cannot be empty !");*/
	}
}
