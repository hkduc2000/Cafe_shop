/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAL.OrderDAO;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import model.Order;
import model.ProductInOrder;
import model.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

/**
 *
 * @author hokiduc
 */
@Controller
@RequestMapping("/order")
public class OrderController {

    public void updateCart(HttpSession session){
        User user = (User)session.getAttribute("user");
        session.setAttribute("cart", new OrderDAO().getCart(user.getUsername()));
    }
    
    @PostMapping("/add_to_cart")
    public String AddToCart(@ModelAttribute("productInOrder") ProductInOrder productInOrder,HttpSession session){
        new OrderDAO().addProductToCart(productInOrder);
        updateCart(session);
        return "redirect:/order/cart_view";
    }
    
    @GetMapping("/cart_view")
    public String CartView(@ModelAttribute("deleteProductInOrder") ProductInOrder deleteProductInOrder){
        return "/order/cart_view";
    }

    @PostMapping("/delete_from_cart")
    public String DeleteFromCart(@ModelAttribute("deleteProductInOrder") ProductInOrder deleteProductInOrder, HttpSession session){
        new OrderDAO().deleteProductFromCart(deleteProductInOrder);
        updateCart(session);
        return "redirect:/order/cart_view";
    }
    
    @GetMapping("/checkout")
    public String CheckoutForm(Model model, HttpSession session){
        model.addAttribute("cart", session.getAttribute("cart"));
        return "/order/checkout";
    }
    
    @PostMapping("/checkout")
    public String Checkout(@ModelAttribute("cart") Order order, Model model, @SessionAttribute("cart") Order cart){
        order.setCreatedDate(new java.util.Date());
        order.setOrderID(cart.getOrderID());
        order.setUsername(cart.getUsername());
        order.setStepID(2);
        ArrayList<ProductInOrder> infs = cart.getOrderInf(); 
        for (int i=0;i<order.getOrderInf().size();i++){
            
        }
        return "message_page";
    }
}
