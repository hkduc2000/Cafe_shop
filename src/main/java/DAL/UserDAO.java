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
import model.Product;
import model.User;

/**
 *
 * @author HKDUC
 */
public class UserDAO extends BaseDAO {

    public User getUser(String username, String password) {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [User] WHERE Username=? AND Password=?;";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setName(rs.getString(1));
                user.setUsername(username);
                user.setPassword(password);
                user.setAddress(rs.getString(4));
                user.setPhone(rs.getString(5));
                user.setMail(rs.getString(6));
                user.setAdmin(rs.getBoolean(7));
                return user;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int createUser(User user) {
        try {
            String sql = "INSERT INTO [User] VALUES(?,?,?,?,?,?,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, user.getName());
            statement.setString(2, user.getUsername());
            statement.setString(3, user.getPassword());
            statement.setString(4, user.getAddress());
            statement.setString(5, user.getPhone());
            statement.setString(6, user.getMail());
            statement.setBoolean(7, user.isAdmin());
            statement.executeUpdate();
            return 1;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public void updateUser(User user) {
        try {
            String sql = "UPDATE [User] SET Name=?, Password=?, Address=?, Phone=?, Mail=?"
                    + " WHERE Username=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, user.getName());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getAddress());
            statement.setString(4, user.getPhone());
            statement.setString(5, user.getMail());
            statement.setString(6, user.getUsername());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
