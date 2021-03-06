package controller;

import DAL.OrderDAO;
import DAL.ProductDAO;
import DAL.SaleDAO;
import java.io.File;
import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
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
    
    @GetMapping("/order/list")
    public String OrderManageList(Model model){
        model.addAttribute("orders", new OrderDAO().getAll());
        model.addAttribute("steps", new OrderDAO().loadStepTable());
        return "order/order_manage_list";
    }
    
    @PostMapping("/order/detail")
    public String OrderManageDetail(Model model, @RequestParam int OrderID){
        model.addAttribute("order", new OrderDAO().getOrderByOrderID(OrderID));
        model.addAttribute("steps", new OrderDAO().loadStepTable());
        return "order/order_manage_detail";
    }
    
    @PostMapping("/order/next_step")
    public String MoveOrderToNextStep(@RequestParam int OrderID){
        new OrderDAO().moveOrderToNextOrPreviousStep(OrderID, 1);
        return "redirect:/admin/order/list";
    }
    
    @PostMapping("/order/previous_step")
    public String MoveOrderToPreviousStep(@RequestParam int OrderID){
        new OrderDAO().moveOrderToNextOrPreviousStep(OrderID, -1);
        return "redirect:/admin/order/list";
    }
    
    @GetMapping("/products/add")
    public String AddForm(@ModelAttribute("product") Product product, Model model) {
        model.addAttribute("sizes", new ProductDAO().getSizeList());
        return "product/product_add";
    }

    @PostMapping("/products/add")
    public String AddProduct(@Valid @ModelAttribute("product") Product product,
            BindingResult result, HttpServletRequest request, Model model) throws IOException, Exception {
        if (result.hasErrors()) {
            return "product/product_add";
        }
        int newProductID = new ProductDAO().addProduct(product, context.getRealPath("/"));
        if (newProductID==0){
            model.addAttribute("title", "Không thành công");
            model.addAttribute("msg", "Xảy ra lỗi trong quá trình thêm sản phẩm");
            return "message_page";
        }
        //newProductID=0 => lỗi
        return "redirect:/products/detail/" + newProductID;
    }
    
    @PostMapping("/products/delete")
    public String ProductEdit(@RequestParam int ProductID, @RequestParam int CategoryID){
        new ProductDAO().deleteProduct(ProductID);
        return "redirect:/products/list/"+ CategoryID;
    }
    
    @GetMapping("/chart")
    public String ChartView(Model model){
        SaleDAO db = new SaleDAO();
        model.addAttribute("revenueInfDay", db.getRevenueByDay());
        model.addAttribute("revenueInfMonth", db.getRevenueByMonth());
        model.addAttribute("revenueInfYear", db.getRevenueByYear());    
        model.addAttribute("revenueInfCategory", db.getRevenueByCategory());
        return "chart";
    }
}
