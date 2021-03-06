/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interceptor;

import DAL.OrderDAO;
import controller.cookieProcess;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Order;
import model.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author hokiduc
 */
public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        
        cookieProcess.welcomeLoginUser(request, response);
        request.setAttribute("newInfo", new User());
        //check cart
        HttpSession session = request.getSession();
        if (session.getAttribute("role") != null && session.getAttribute("role").equals("admin")){
            return true;
        }
        Order cart = (Order) session.getAttribute("cart");
        if (cart == null && session.getAttribute("user") != null){
            String username = ((User)session.getAttribute("user")).getUsername();
            cart = new OrderDAO().getCart(username);
            session.setAttribute("cart", cart);
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
        
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
    }
}
