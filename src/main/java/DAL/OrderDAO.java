/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
                s.setCreatedDate(rs.getDate(4));
                s.setOrderInf(loadOrderInf(s.getOrderID()));
                return s;
            }
        } catch (SQLException ex) {
            Logger.getLogger(SizeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public ArrayList<ProductInOrder> loadOrderInf(int OrderID){
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
            Logger.getLogger(SizeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return infs;
    }
    
    public void createEmptyCart(String Username){
        try {
            String sql = "INSERT INTO [Order](Username, StepID) VALUES(?,1)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, Username);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SizeDAO.class.getName()).log(Level.SEVERE, null, ex);
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
            } catch (Exception ex1){
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
    
    public void deleteProductFromCart(ProductInOrder inf){
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
}
