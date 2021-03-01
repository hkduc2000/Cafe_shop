package controller;

import DAL.OrderDAO;
import DAL.ProductDAO;
import java.sql.Timestamp;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import model.Order;
import model.ProductInOrder;
import model.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
        return "order/cart_view";
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
        return "order/checkout";
    }
    
    @PostMapping("/checkout")
    public String Checkout(@ModelAttribute("cart") Order order, Model model, @SessionAttribute("cart") Order cart, HttpSession session){
        order.setCreatedDate(new Timestamp(System.currentTimeMillis()));
        order.setOrderID(cart.getOrderID());
        order.setUsername(cart.getUsername());
        order.setStepID(2);
        OrderDAO orderDAO = new OrderDAO();
        orderDAO.updateOrder(order);
        User user = ((User)session.getAttribute("user"));
        updateCart(session);
        ArrayList<ProductInOrder> infs = cart.getOrderInf(); 
        ProductDAO DB = new ProductDAO();
        for (ProductInOrder inf: infs){
            inf.setPrice(DB.getPrice(inf.getProductID(), inf.getSize()));
            orderDAO.updatePriceProductInOrder(inf);
            //update quantity in stock 
            DB.updateQuantity(inf.getProductID(), inf.getSize(), -1 * inf.getQuantity());
        }
        model.addAttribute("title", "Đặt hàng thành công");
        model.addAttribute("msg", "Đơn hàng của bạn đã được gửi đến The Cafe Shop<br>"
                + "Bạn có thể theo dõi trạng thái đơn hàng trong mục \"Đơn hàng của tôi\"");
        return "message_page";
    }
    
    @GetMapping("/list")
    public String OrderList(Model model, @SessionAttribute User user){
        String username = user.getUsername();
        model.addAttribute("orders", new OrderDAO().getOrdersByUsername(username));
        model.addAttribute("steps", new OrderDAO().loadStepTable());
        return "order/order_list";
    }
    
    @PostMapping("/detail")
    public String OrderDetail(Model model, @RequestParam int OrderID){
        model.addAttribute("order", new OrderDAO().getOrderByOrderID(OrderID));
        model.addAttribute("steps", new OrderDAO().loadStepTable());
        return "order/order_detail";
    }
    
    @PostMapping("/cancel")
    public String OrderCancel(Model model, @RequestParam int OrderID){
        new OrderDAO().cancelOrder(OrderID);
        model.addAttribute("title", "Hủy đơn hàng");
        model.addAttribute("msg", "Đơn hàng đã được hủy thành công");
        return "message_page";
    }
    
    @GetMapping("/manage/list")
    public String OrderManageList(Model model){
        model.addAttribute("orders", new OrderDAO().getAll());
        model.addAttribute("steps", new OrderDAO().loadStepTable());
        return "order/order_manage_list";
    }
    
    @PostMapping("/manage/detail")
    public String OrderManageDetail(Model model, @RequestParam int OrderID){
        model.addAttribute("order", new OrderDAO().getOrderByOrderID(OrderID));
        model.addAttribute("steps", new OrderDAO().loadStepTable());
        return "order/order_manage_detail";
    }
    
    @PostMapping("/next_step")
    public String MoveOrderToNextStep(@RequestParam int OrderID){
        new OrderDAO().moveOrderToNextOrPreviousStep(OrderID, 1);
        return "redirect:/order/manage/list";
    }
    
    @PostMapping("/previous_step")
    public String MoveOrderToPreviousStep(@RequestParam int OrderID){
        new OrderDAO().moveOrderToNextOrPreviousStep(OrderID, -1);
        return "redirect:/order/manage/list";
    }
}
