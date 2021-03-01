/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAL.OrderDAO;
import DAL.UserDAO;
import java.io.IOException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import static org.springframework.web.bind.annotation.RequestMethod.POST;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author HKDUC
 */

@Controller
public class AuthenticateController {
    @RequestMapping(value = "/login", method = POST)
    public ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws IOException{
        ModelAndView mv = new ModelAndView("login_register_result");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = new UserDAO().getUser(username, password);
        String type = "Đăng nhập";
        String msg = "Đăng nhập thất bại";
        if (user != null){
            msg = "Đăng nhập thành công";
            cookieProcess.addCookieToResponse(response, "username", 
                    user.getUsername(), 3600 * 24 * 15);
            cookieProcess.addCookieToResponse(response, "password", 
                    user.getPassword(), 3600 * 24 * 15);
        } 
        mv.addObject("msg", msg);
        mv.addObject("type", type);
        return mv;
    }
    
    @RequestMapping("/logout")
    public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws IOException{
        response = cookieProcess.addCookieToResponse(response, "username", "" , 0);
        response = cookieProcess.addCookieToResponse(response, "password", "" , 0);
        HttpSession session = request.getSession();
        session.invalidate();
        return new ModelAndView("redirect:/");
    }
    
    @RequestMapping("/register")
    public ModelAndView register(HttpServletRequest request, HttpServletResponse response) throws IOException{
        request.setCharacterEncoding("UTF-8");
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        User user = new User(name, username, password , address, phone,email, false);
        String msg = "Tạo tài khoản thất bại! Vui lòng chọn tên đăng nhập khác";
        int code = new UserDAO().createUser(user);
        if (code == 1) {
            response = cookieProcess.addCookieToResponse(response, "username", username, 3600 * 24 * 15);
            response = cookieProcess.addCookieToResponse(response, "password", password, 3600 * 24 * 15);
            msg = "Đã tạo tài khoản thành công";
        }
        ModelAndView mv = new ModelAndView("login_register_result");
        mv.addObject("msg",msg);
        mv.addObject("type", "Đăng ký");
        return mv;
    }
}
