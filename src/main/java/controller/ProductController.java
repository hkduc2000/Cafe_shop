/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAL.ProductDAO;
import java.io.File;
import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author HKDUC
 */
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
        return mv;
    }

    @GetMapping("/add")
    //@RequestMapping(value = "/add", method = GET)
    public String AddForm(@ModelAttribute("product") Product product, Model model) {
        model.addAttribute("sizes", new ProductDAO().getSizeList());
        return "product/product_add";
    }

    @PostMapping("add")
    //@RequestMapping(value = "/add", method = POST)
    public String Add(@Valid @ModelAttribute("product") Product product,
            BindingResult result, RedirectAttributes redirectAttributes) throws IOException {
        if (result.hasErrors()) {
            return "product/product_add";
        }

        MultipartFile multipartFile = product.getImageFile();
        if (multipartFile != null || !multipartFile.isEmpty()) {
            String suffix = new String(multipartFile.getOriginalFilename().getBytes("ISO-8859-1"), "UTF-8");
            String fileName = context.getRealPath("/") + "static/img/" + suffix;
            try {
                multipartFile.transferTo(new File(fileName));
                product.setProductImage(suffix);
                new ProductDAO().addProduct(product);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return "homepage";
    }

//    public ModelAndView Add(@Valid @ModelAttribute("product") Product product, 
//    BindingResult result, RedirectAttributes redirectAttributes){
//        
//        return new ModelAndView("homepage");
//    }
}
