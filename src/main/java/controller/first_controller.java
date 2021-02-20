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
    @RequestMapping("/")
    public ModelAndView homepage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        ModelAndView mv = new ModelAndView("homepage");
        return mv;
    }
}
