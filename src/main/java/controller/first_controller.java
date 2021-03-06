/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAL.ProductDAO;
import DAL.SaleDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;
import model.Product;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author HKDUC
 */
@ControllerAdvice
@Controller
public class first_controller {

    @ExceptionHandler(Throwable.class)
    public String handleError405(Model model, Exception e) {
        model.addAttribute("title", "Không thể truy cập");
        model.addAttribute("msg", "Trang không tồn tại!<br> Hoặc chỉ admin có quyền truy cập trang này");
        model.addAttribute("newInfo", new User());
        return "message_page";
    }

    @RequestMapping("/")
    public ModelAndView homepage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ModelAndView mv = new ModelAndView("homepage");
        return mv;
    }
    

    @Autowired
    ServletContext sc;

    public void updateBestSeller() {
        ArrayList<ArrayList<Product>> bestSeller = new ArrayList<>();
        int n = new ProductDAO().getCategories().size();
        for (int i = 0; i < n; i++) {
            bestSeller.add(new ProductDAO().getBestSellerByCategoryID(i + 1));
        }
        sc.setAttribute("bestSeller", bestSeller);
        new SaleDAO().updateSales();
        System.out.println("Updated sales on: " + new Date());
    }

    @EventListener(ContextRefreshedEvent.class)
    public void ApplicationInit() {
        ArrayList<Category> categories = new ProductDAO().getCategories();
        sc.setAttribute("categories", categories);
        TimerTask task = new TimerTask() {
            public void run() {
                updateBestSeller();
            }
        };
        Timer timer = new Timer("Timer");
        timer.schedule(task, 0L, 10000L);
    }
}
