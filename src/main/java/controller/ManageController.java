package controller;

import DAL.ProductDAO;
import java.io.File;
import javax.servlet.ServletContext;
import model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/admin")
public class ManageController {

    @Autowired
    ServletContext context;

    @PostMapping("/goodreceipt")
    public String GoodReceipt(Model model, @RequestParam int productid, @RequestParam int sign,
            @RequestParam String size, @RequestParam int num) {
        new ProductDAO().updateQuantity(productid, size, sign * num);
        return "redirect:/products/detail/" + productid;
    }

    @GetMapping("/product/edit/{productid}")
    public String ProductEditForm(@PathVariable int productid, Model model) {
        model.addAttribute("sizes", new ProductDAO().getSizeList());
        model.addAttribute("product", new ProductDAO().getProductByProductID(productid));
        
        return "product/product_edit";
    }

    @PostMapping("/product/edit")
    public String ProductEditForm(@ModelAttribute("product") Product product, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "redirect:/";
        }
        new ProductDAO().updateProduct(product, context.getRealPath("/"));
        return "redirect:/products/detail/" + product.getProductID();
    }
}
