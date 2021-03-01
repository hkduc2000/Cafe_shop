/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Order;
import model.Product;
import model.ProductInOrder;

/**
 *
 * @author hokiduc
 */
public class OrderDAO extends BaseDAO {

    public ArrayList<Order> getOrderByCondition(String condition){
        ArrayList<Order> orders = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Order] WHERE " + condition;
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Order s = new Order();
                s.setOrderID(rs.getInt(1));
                s.setUsername(rs.getString(2));
                s.setStepID(rs.getInt(3));
                s.setCreatedDate(rs.getTimestamp(4));
                s.setOrderInf(loadOrderInf(s.getOrderID()));
                orders.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }
    
    public ArrayList<Order> getAll() {
        return getOrderByCondition("NOT StepID=1 ORDER BY OrderID ASC");
    }
    
    public ArrayList<Order> getOrdersByUsername(String username){
        return getOrderByCondition("NOT StepID=1 AND Username='"+ username +
                "' ORDER BY OrderID DESC");
    }

    public Order getCart(String Username) {
        try {
            String sql = "SELECT * FROM [Order] WHERE StepID=1 AND Username=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, Username);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                Order s = new Order();
                s.setOrderID(rs.getInt(1));
                s.setUsername(rs.getString(2));
                s.setStepID(rs.getInt(3));
                s.setOrderInf(loadOrderInf(s.getOrderID()));
                return s;
            } else {
                createEmptyCart(Username);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public Order getOrderByOrderID(int OrderID){
        try {
            String sql = "SELECT * FROM [Order] WHERE OrderID=" + OrderID;
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                Order s = new Order();
                s.setOrderID(rs.getInt(1));
                s.setUsername(rs.getString(2));
                s.setStepID(rs.getInt(3));
                s.setOrderInf(loadOrderInf(s.getOrderID()));
                s.setCreatedDate(rs.getTimestamp(4));
                s.setRecipientName(rs.getString(5));
                s.setRecipientAddress(rs.getString(6));
                s.setRecipientPhone(rs.getString(7));
                return s;
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<ProductInOrder> loadOrderInf(int OrderID) {
        ArrayList<ProductInOrder> infs = new ArrayList<>();
        try {
            String sql = "SELECT * FROM ProductInOrder WHERE OrderID=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, OrderID);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                ProductInOrder s = new ProductInOrder();
                s.setOrderID(rs.getInt(1));
                s.setProductID(rs.getInt(2));
                s.setSize(rs.getString(3));
                s.setQuantity(rs.getInt(4));
                s.setPrice(rs.getInt(5));
                s.setProduct(new ProductDAO().getProductByProductID(s.getProductID()));
                infs.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return infs;
    }

    public void createEmptyCart(String Username) {
        try {
            String sql = "INSERT INTO [Order](Username, StepID) VALUES(?,1)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, Username);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addProductToCart(ProductInOrder inf) {
        try {
            String sql = "INSERT INTO ProductInOrder VALUES(?,?,?,?,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, inf.getOrderID());
            statement.setInt(2, inf.getProductID());
            statement.setString(3, inf.getSize());
            statement.setInt(4, inf.getQuantity());
            statement.setInt(5, 0);
            statement.executeUpdate();
        } catch (SQLException ex) {
            try {
                addDuplicateProductToCart(inf);
            } catch (Exception ex1) {
                Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void addDuplicateProductToCart(ProductInOrder inf) {
        try {
            String sql = "UPDATE ProductInOrder SET Quantity=Quantity+?"
                    + " WHERE OrderID=? AND ProductID=? AND Size=?;";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, inf.getQuantity());
            statement.setInt(2, inf.getOrderID());
            statement.setInt(3, inf.getProductID());
            statement.setString(4, inf.getSize());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteProductFromCart(ProductInOrder inf) {
        try {
            String sql = "DELETE FROM ProductInOrder WHERE OrderID=? AND ProductID=? AND Size=?;";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, inf.getOrderID());
            statement.setInt(2, inf.getProductID());
            statement.setString(3, inf.getSize());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateOrder(Order order) {
        try {
            String sql = "UPDATE [Order] SET StepID=?, CreatedDate=?, RecipientName=?,RecipientAddress=?,RecipientPhone=? "
                    + "WHERE OrderID=?;";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, order.getStepID());
            statement.setTimestamp(2, order.getCreatedDate());
            statement.setString(3, order.getRecipientName());
            statement.setString(4, order.getRecipientAddress());
            statement.setString(5, order.getRecipientPhone());
            statement.setInt(6, order.getOrderID());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updatePriceProductInOrder(ProductInOrder inf) {
        try {
            String sql = "UPDATE ProductInOrder SET Price=?"
                    + " WHERE OrderID=? AND ProductID=? AND Size=?;";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, inf.getPrice());
            statement.setInt(2, inf.getOrderID());
            statement.setInt(3, inf.getProductID());
            statement.setString(4, inf.getSize());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<String> loadStepTable() {
        ArrayList<String> steps = new ArrayList<>();
        try {
            String sql = "select * from OrderStepTable";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                steps.add(rs.getString(2));
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return steps;
    }

    public void cancelOrder(int OrderID) {
        try {
            String sql = "UPDATE [Order] SET StepID=? WHERE OrderID=?;";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(2, OrderID);
            statement.setInt(1, 6);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void moveOrderToNextOrPreviousStep(int OrderID, int sign){
        try {
            String sql = "UPDATE [Order] SET StepID=StepID+? WHERE OrderID=?;";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, sign);
            statement.setInt(2, OrderID);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
