package edu.mum.cs425.presentation.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.mum.cs425.business.customer.UserService;
import edu.mum.cs425.domain.User;

@Controller
@RequestMapping(value={"/"})
public class HomeController {
	@Autowired
	private UserService userService;
	    
    @RequestMapping
    public String homePage(Model model) {
    	
    	//TODO:test only
    	User user = new User();
        user.setName("test");
        user.setEmail("gmlan@126.com");
        
        userService.save(user);
        
        return "home";
    }
    
    @RequestMapping("/help")
    public String help() {
        return "help";
    }

    @RequestMapping(value = {"/contactus"}, method = RequestMethod.GET)
    public String contactusPage(Model model) {
        return "contactusPage";
    }
}
