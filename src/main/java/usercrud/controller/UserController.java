package usercrud.controller;

import java.util.ArrayList;
import java.util.List;

import javax.imageio.spi.ServiceRegistry;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.mongodb.BasicDBObject;

import captcha.servlet.CaptchaGenServlet;
import usercrud.model.User;
import usercrud.model.UserDto;
import usercrud.service.UserService;

@Controller
@RequestMapping(value="/user")
public class UserController {

	@Autowired
	UserService userService;
	
	private static final String CAPTCHA2 = "CAPTCHA";
	
	@RequestMapping(value="/list" , method = RequestMethod.GET)
	public ModelAndView list() {
	ModelAndView model =new ModelAndView("user/list");
	CaptchaGenServlet cgs=new CaptchaGenServlet();
	model.addObject("listuser",userService.list()); 
	return model;
	}
	@RequestMapping(value="/" , method = RequestMethod.GET)
	public String index() {

	return "veysel";
	}
	
	@RequestMapping(value="/list1" , method = RequestMethod.GET)
	public @ResponseBody Object  list1() {
		Gson gson = new Gson();
		String jsonString = gson.toJson(userService.list());
		return jsonString;
	}
	
	@RequestMapping(value="/save" , method = RequestMethod.POST)
	public @ResponseBody String save(@ModelAttribute User user, BindingResult result , HttpSession session ) {
		String captcha = (String) session.getAttribute(CAPTCHA2);
		if(user.getName()==null||user.getName().equals(""))
			return "name column cannot be empty !";
		if(user.getSurName()==null||user.getSurName().equals(""))
			return "surname column cannot be empty !";
		if(!user.getCaptcha().equals(captcha))
			return "You entered the captcha code incorrectly !";
		if(user.getId() == null ||user.getId().equals(""))
			userService.add(user);
		else {
			
			userService.update(user);
		}
	return "success";
	}
	
	@RequestMapping(value="/findById" , method = RequestMethod.GET)
	public @ResponseBody Object  findById(@RequestParam(name = "id") String id) {
		Gson gson = new Gson();
		String jsonString = gson.toJson(userService.findById(id));
		return jsonString;
	}
	
	@RequestMapping(value="/delete" , method = RequestMethod.GET)
	public @ResponseBody String delete(@RequestParam(name = "id") String id) {
		System.out.println("delette");
		userService.delete(userService.findById(id));
		return "success";
	}
	}
