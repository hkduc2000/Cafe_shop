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

/**
 *
 * @author HKDUC
 */
public class SizeDAO extends BaseDAO {
    public ArrayList<String> getAll(){
        ArrayList<String> s = new ArrayList<>();
        try {
            String sql = "SELECT * FROM SizeTable";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while(rs.next())
            {
                s.add(rs.getString(1));
            }
        } catch (SQLException ex) {
            Logger.getLogger(SizeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return s;
    }
}
