/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAL.CustomDAO;
import DAL.ProductDAO;
import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import model.Product;
import model.ProductInOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/products")
public class ProductController {

    @Autowired
    ServletContext context;

    @GetMapping("/list/{categoryid}")
    public ModelAndView List(HttpServletRequest request, HttpServletResponse response,
            @PathVariable int categoryid) {
        ModelAndView mv = new ModelAndView("product/product_list");
        mv.addObject("products", new ProductDAO().getProductsByCategoryID(categoryid));
        mv.addObject("categoryID", categoryid);
        return mv;
    }

    @GetMapping("/detail/{productid}")
    public String ProductDetail(Model model, @PathVariable int productid, HttpServletRequest request) {
        Product product = new ProductDAO().getProductByProductID(productid);
        model.addAttribute("sizes", new ProductDAO().getSizeList());
        model.addAttribute("product", product);
        model.addAttribute("productInOrder", new ProductInOrder());
        String role = (String) request.getSession().getAttribute("role");
        if (role != null && role.equals("admin")) {
            return "product/product_detail_admin";
        }
        return "product/product_detail";
    }

}
