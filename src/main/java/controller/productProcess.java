/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAL.ProductDAO;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author HKDUC
 */
@Controller
@RequestMapping("/products")
public class productProcess {

    @Autowired
    ServletContext context;

    @RequestMapping("/list/{categoryid}")
    public ModelAndView List(HttpServletRequest request, HttpServletResponse response,
            @PathVariable int categoryid) {
        ModelAndView mv = new ModelAndView("/jsp/product/product_list.jsp");
        mv.addObject("products", new ProductDAO().getProductsByCategoryID(categoryid));
        return mv;
    }

    @RequestMapping(value = "/add", method = GET)
    public ModelAndView AddForm(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView("/jsp/product/product_add.jsp");
        mv.addObject("sizes", new ProductDAO().getSizeList());
        return mv;
    }
    
    private void saveImage(Part imgPart, int i, int ProductID) throws IOException{
        String rootPath = context.getRealPath("/");
        String imgPath = "static/img/product" + ProductID + "_" +i;
        InputStream is = imgPart.getInputStream();
        Files.copy(is, Paths.get(rootPath + imgPath),
                StandardCopyOption.REPLACE_EXISTING);
        new ProductDAO().addImg(imgPath, i);
    }

    @RequestMapping(value = "/add", method = POST)
    public ModelAndView Add(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        String ProductName = request.getParameter("ProductName");
        String Description = request.getParameter("Description");
        int CategoryID = Integer.parseInt(request.getParameter("CategoryID"));
        Product product = new Product(ProductName, Description, CategoryID);
        new ProductDAO().addProduct(product);
        int ProductID = new ProductDAO().getIdentCur();
        //Download thumbnail
        Part thumbnailPart = request.getPart("ProductThubnail");
        saveImage(thumbnailPart, 0, ProductID);
        //Download images
        ArrayList<Part> fileParts = (ArrayList<Part>) request.getParts();
        int cnt = 1;
        for (Part imgPart : fileParts) {
            if (imgPart.getName().equals("ProductImages")) {
                saveImage(imgPart, cnt, ProductID);
                cnt++;
            }
        }
        ModelAndView mv = new ModelAndView("/jsp/product/product_add.jsp");
        mv.addObject("sizes", new ProductDAO().getSizeList());
        return mv;
    }
}
