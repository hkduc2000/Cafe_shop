/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAL.ProductDAO;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import model.Product;
import model.SizeOfProduct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
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

    @GetMapping("/list/{categoryid}")
    public ModelAndView List(HttpServletRequest request, HttpServletResponse response,
            @PathVariable int categoryid) {
        ModelAndView mv = new ModelAndView("product/product_list");
        mv.addObject("products", new ProductDAO().getProductsByCategoryID(categoryid));
        return mv;
    }

    @GetMapping("/add")
    public String AddForm(@ModelAttribute("product") Product product, Model model) {
        model.addAttribute("sizes", new ProductDAO().getSizeList());
        return "product/product_add";
    }

    @PostMapping("/add")
    public String AddProduct(@Valid @ModelAttribute("product") Product product,
            BindingResult result, HttpServletRequest request) throws IOException {
        if (result.hasErrors()) {
            return "product/product_add";
        }
        int newProductID = 0;
        MultipartFile multipartFile = product.getImageFile();
        if (multipartFile != null || !multipartFile.isEmpty()) {
            String suffix = new String(multipartFile.getOriginalFilename().getBytes("ISO-8859-1"), "UTF-8");
            String fileName = context.getRealPath("/") + "static/img/" + suffix;
            try {
                multipartFile.transferTo(new File(fileName));
                product.setProductImage(suffix);
                ProductDAO DB = new ProductDAO();
                DB.addProduct(product);
                newProductID = DB.getIdentCur();
                //save size
                ArrayList<String> sizes = DB.getSizeList();
                ArrayList<SizeOfProduct> infs = new ArrayList<>();
                for (String size : sizes){
                    int price = Integer.parseInt(request.getParameter("price" + size));
                    int quantity = Integer.parseInt(request.getParameter("quantity" + size));
                    DB.saveProductInf(new SizeOfProduct(newProductID, size, price, quantity));
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        //newProductID=0 => lỗi
        return "redirect:/products/detail/" + newProductID;
    }
  
    @GetMapping("/detail/{productid}")
    public String ProductDetail(Model model, @PathVariable int productid, HttpServletRequest request){
        Product product = new ProductDAO().getProductByProductID(productid);
        model.addAttribute("sizes", new ProductDAO().getSizeList());
        model.addAttribute("product", product);
        String role = (String)request.getSession().getAttribute("role");
        if ( role != null && role.equals("admin")){
            return "product/product_detail_admin";
        }
        return "product/product_detail";
    }
    
//    @GetMapping("/edit/{productid}")
//    public String ProductEdit(){
//        
//    }
}
