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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.context.event.ContextStartedEvent;
import org.springframework.context.event.EventListener;
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
    public ModelAndView homepage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ModelAndView mv = new ModelAndView("homepage");
        return mv;
    }

    @Autowired
    ServletContext sc;

    @EventListener(ContextRefreshedEvent.class)
    public void givenUsingTimer_whenSchedulingTaskOnce_thenCorrect() {
        ArrayList<Category> categories = new ProductDAO().getCategories();
        sc.setAttribute("categories", categories);
        TimerTask task = new TimerTask() {
            public void run() {
                ArrayList<ArrayList<Product>> bestSeller = new ArrayList<>();
                int n = new ProductDAO().getCategories().size();
                for (int i=0;i<n;i++){
                    bestSeller.add(new ProductDAO().getBestSellerByCategoryID(i+1));
                }
                sc.setAttribute("bestSeller", bestSeller);
                new SaleDAO().updateSales();
                System.out.println("Task performed on: " + new Date() + "n"
                        + "Thread's name: " + Thread.currentThread().getName());
            }
        };
        Timer timer = new Timer("Timer");
        timer.schedule(task, 0L, 10000L);
    }
}
