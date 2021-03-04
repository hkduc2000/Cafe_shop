/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import java.io.File;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.Product;
import model.SizeOfProduct;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author HKDUC
 */
public class ProductDAO extends BaseDAO {

    public ArrayList<Product> getByCondition(String condition) {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Product " + condition;
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Product s = new Product();
                s.setProductID(rs.getInt(1));
                s.setProductName(rs.getString(2));
                s.setProductImage(rs.getString(3));
                s.setDescription(rs.getString(4));
                s.setCategoryID(rs.getInt(5));
                s.setSizes(getProductInf(s.getProductID()));
                products.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public Product getProductByProductID(int ProductID) {
        ArrayList<Product> rs = getByCondition("where ProductID=" + ProductID);
        if (rs.size() > 0) {
            return rs.get(0);
        }
        return null;
    }

    public ArrayList<Product> getAll() {
        return getByCondition("");
    }

    public ArrayList<Product> getProductsByCategoryID(int categoryID) {
        return getByCondition("where CategoryID=" + categoryID);
    }

    public int addProduct(Product product, String rootPath) throws Exception {
        int newProductID = 0;
        try {
            MultipartFile multipartFile = product.getImageFile();
            if (multipartFile.getSize() != 0) {
                String suffix = new String(multipartFile.getOriginalFilename().getBytes("ISO-8859-1"), "UTF-8");
                String fileName = rootPath + "static/img/" + suffix;
                multipartFile.transferTo(new File(fileName));
                product.setProductImage(suffix);
            } 
            //save to DB
            String sql = "INSERT INTO Product VALUES(?,?,?,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, product.getProductName());
            statement.setString(2, product.getProductImage());
            statement.setString(3, product.getDescription());
            statement.setInt(4, product.getCategoryID());
            statement.executeUpdate();
            newProductID = getIdentCur();
            //save size
            for (SizeOfProduct s : product.getSizes()) {
                s.setProductID(newProductID);
                saveProductInf(s);
            }
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return newProductID;
    }

    public void updateProduct(Product product, String rootPath){
        try {
            MultipartFile multipartFile = product.getImageFile();
            if (multipartFile.getSize() != 0) {
                String suffix = new String(multipartFile.getOriginalFilename().getBytes("ISO-8859-1"), "UTF-8");
                String fileName = rootPath + "static/img/" + suffix;
                multipartFile.transferTo(new File(fileName));
                product.setProductImage(suffix);
            } 
            //save to DB
            String sql = "update Product set ProductName=?, ProductImage=?, Description=?, CategoryID=? where ProductID=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, product.getProductName());
            statement.setString(2, product.getProductImage());
            statement.setString(3, product.getDescription());
            statement.setInt(4, product.getCategoryID());
            statement.setInt(5, product.getProductID());
            statement.executeUpdate();
            //save size
            System.out.println("checkpoint2");
            for (SizeOfProduct s : product.getSizes()) {
                s.setProductID(product.getProductID());
                updateProductInf(s);
            }
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ArrayList<Category> getCategories() {
        ArrayList<Category> categories = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Category";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Category s = new Category();
                s.setCategoryID(rs.getInt("CategoryID"));
                s.setCategoryName(rs.getString("CategoryName"));
                categories.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return categories;
    }

    public ArrayList<SizeOfProduct> getProductInf(int ProductID) {
        ArrayList<SizeOfProduct> infs = new ArrayList<>();
        try {
            String sql = "SELECT * FROM SizeOfProduct WHERE ProductID=? ORDER BY Price ASC";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, ProductID);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                SizeOfProduct inf = new SizeOfProduct();
                inf.setSize(rs.getString(2));
                inf.setPrice(rs.getInt(3));
                inf.setQuantity(rs.getInt(4));
                infs.add(inf);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return infs;
    }

    public ArrayList<String> getSizeList() {
        ArrayList<String> sizes = new ArrayList<>();
        try {
            String sql = "SELECT * FROM SizeTable ORDER BY Stt ASC";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                sizes.add(rs.getString(2));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sizes;
    }

    public int getIdentCur() {
        try {
            String sql = "SELECT IDENT_CURRENT('Product')";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            rs.next();
            return rs.getInt("");
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public void saveProductInf(SizeOfProduct inf) {
        try {
            String sql = "insert into SizeOfProduct values(?,?,?,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, inf.getProductID());
            statement.setString(2, inf.getSize());
            statement.setInt(3, inf.getPrice());
            statement.setInt(4, inf.getQuantity());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void updateProductInf(SizeOfProduct inf){
        try {
            String sql = "update SizeOfProduct set Quantity=?, Price=? where ProductID=? and Size=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, inf.getQuantity());
            statement.setInt(2, inf.getPrice());
            statement.setInt(3, inf.getProductID());
            statement.setString(4, inf.getSize());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateQuantity(int ProductID, String Size, int Quantity) {
        try {
            String sql = "update SizeOfProduct set Quantity=Quantity+? where ProductID=? and Size=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, Quantity);
            statement.setInt(2, ProductID);
            statement.setString(3, Size);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void deleteProduct(int ProductID){
        new CustomDAO().executeSQL("DELETE FROM SizeOfProduct WHERE ProductID=" + ProductID);
        new CustomDAO().executeSQL("DELETE FROM ProductInOrder WHERE ProductID=" + ProductID);
        new CustomDAO().executeSQL("DELETE FROM Product WHERE ProductID=" + ProductID);
    }
    
    public int getPrice(int ProductID, String Size){
        try {
            String sql = "SELECT Price FROM SizeOfProduct WHERE ProductID=? AND Size=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, ProductID);
            statement.setString(2, Size);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt("Price");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    
    public ArrayList<Product> getBestSellerByCategoryID(int CategoryID) {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "SELECT TOP 4 * FROM Sales WHERE CategoryID=?;";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, CategoryID);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Product s = new Product();
                s.setProductID(rs.getInt(1));
                s.setProductName(rs.getString(2));
                s.setProductImage(rs.getString(3));
                s.setDescription(rs.getString(4));
                s.setCategoryID(rs.getInt(5));
                s.setSizes(getProductInf(s.getProductID()));
                products.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SaleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }
}
