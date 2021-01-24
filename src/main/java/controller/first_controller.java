/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAL.ProductDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


/**
 *
 * @author HKDUC
 */
@Controller
public class first_controller {
    @RequestMapping("/list")
    public ModelAndView list(HttpServletRequest request, HttpServletResponse response){
        ModelAndView mv = new ModelAndView("drink_list.jsp");
        mv.addObject("products", new ProductDAO().getAll());
        return mv;
    }
    
    @RequestMapping("/")
    public ModelAndView homepage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        cookieProcess.welcomeLoginUser(request, response);
        ModelAndView mv = new ModelAndView("test.jsp");
        return mv;
    }
    
}
