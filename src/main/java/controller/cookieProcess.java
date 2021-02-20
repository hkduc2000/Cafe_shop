/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAL.UserDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author HKDUC
 */
public class cookieProcess {

    public static HttpServletResponse addCookieToResponse(HttpServletResponse response, String key, String value, int maxAge) {
        Cookie cookie = new Cookie(key, value);
        cookie.setMaxAge(maxAge);
        response.addCookie(cookie);
        return response;
    }

    public static void welcomeLoginUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Cookie[] cookies = request.getCookies();
        HttpSession session = request.getSession();
        if (session.getAttribute("user") != null) {
            return;
        }
        if (cookies == null) {
            return;
        }
        String username = "", password = "";
        for (Cookie coo : cookies) {
            if (coo.getName().equals("username")) {
                username = coo.getValue();
            }
            if (coo.getName().equals("password")) {
                password = coo.getValue();
            }
        }
        if (!username.equals("")  && !password.equals("")) {
            User user = new UserDAO().getUser(username, password);
            if (user != null) {
                session.setAttribute("user", user);
                if (user.isAdmin()) {
                    session.setAttribute("role", "admin");
                } else {
                    session.setAttribute("role", "user");
                }
            }
        } 
        
    }

    public void checkUserLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        if (((String) session.getAttribute("username")) == null) {
            response.getWriter().print("Access denied");
            return;
        }
    }
}
