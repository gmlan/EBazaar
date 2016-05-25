package edu.mum.cs425.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value={"/home"})
public class HomeController {

    @RequestMapping
    public String homePage(Model model) {
        return "home";
    }
    
    @RequestMapping("/help")
    public String help() {
        return "help";
    }

    @RequestMapping(value = {"/contactus"}, method = RequestMethod.GET)
    public String contactusPage(Model model) {
        System.out.println("edu.mum.cs545.lms.controller.HomeController.contactusPage()");
        model.addAttribute("address", "Vietnam");
        model.addAttribute("phone", "...");
        model.addAttribute("email", "...");
        return "contactusPage";
    }
}
