/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAL.ProductDAO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author HKDUC
 */
@Controller
@RequestMapping("/products")
public class ProductController {

    @Autowired
    ServletContext context;

    @RequestMapping("/list/{categoryid}")
    public ModelAndView List(HttpServletRequest request, HttpServletResponse response,
            @PathVariable int categoryid) {
        ModelAndView mv = new ModelAndView("product/product_list");
        mv.addObject("products", new ProductDAO().getProductsByCategoryID(categoryid));
        return mv;
    }

    @RequestMapping(value = "/add", method = GET)
    public ModelAndView AddForm() {
        ModelAndView mv = new ModelAndView("product/product_add");
        mv.addObject("sizes", new ProductDAO().getSizeList());
        mv.addObject("product", new Product());
        return mv;
    }
    
    @RequestMapping(value = "/add", method = POST)
    public ModelAndView Add(@ModelAttribute("") Product product){
    }
}
