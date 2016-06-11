/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.mum.cs425.presentation.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.mum.cs425.business.customer.UserService;
import edu.mum.cs425.domain.User;
import edu.mum.cs425.presentation.util.Constants;

/**
 *
 * @author gmlan
 */
@Controller
public class LoginController {
	
    @Autowired
    private UserService userService;
 
    @RequestMapping(value = "/login", method = {RequestMethod.GET})
    public String login(HttpServletRequest request, Model model) {
        User user = new User();
      /*  // try to get from cookie
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals("rememberMe")) {
                    user.setRememberme(true);
                } else if (cookies[i].getName().equals("userId")) {
                    user.setUserId(cookies[i].getValue());
                } else if (cookies[i].getName().equals("password")) {
                    user.setPassword(cookies[i].getValue());
                }
            }
        }*/
        model.addAttribute("user", user);
        return "login";
    }

    @RequestMapping(value = "/login", method = {RequestMethod.POST})
    public String authenticate(HttpSession session, HttpServletResponse response, @ModelAttribute("user") User user, Model model, BindingResult result) {
        if (("root".equals(user.getName()) &&  session.getServletContext().getInitParameter("root_password").equals(user.getPassword())) //||
     //        userService.authentication(user) 
            ){
                        
          /*  user.setLoggedIn(true);
            
            session.setAttribute(Constants.CURRENT_USER, user);
            
            if (user.isRememberme()) {
                response.addCookie(new Cookie("userId", user.getUserId()));
                response.addCookie(new Cookie("password", user.getPassword()));
                response.addCookie(new Cookie("rememberMe", user.isRememberme()? "Y" : "N"));
            } else {//try to clear exists cookie if user uncheck rememberMe
                response.addCookie(new Cookie("userId", ""));
                response.addCookie(new Cookie("password", ""));
                response.addCookie(new Cookie("rememberMe", "N"));
            }*/

            return "redirect:/";
        } else {
            result.addError(new ObjectError("*", "username/password error"));
        }
        return "login";
    }

    @RequestMapping(value = "/logout")
    public String logout(HttpSession session) {
        User user = (User) session.getAttribute(Constants.CURRENT_USER);                
     //   if (user != null)
     //       user.setLoggedIn(false);
        return "redirect:/login";
    }
}
