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

/**
 *
 * @author hokiduc
 */
public class SaleDAO extends BaseDAO {

    public void updateSales() {
        new CustomDAO().executeSQL("drop table Sales;\n"
                + "with t as(\n"
                + "SELECT ProductID ,SUM(Quantity) AS Quantity \n"
                + "FROM ProductInOrder\n"
                + "GROUP BY (ProductID))\n"
                + "SELECT a.*, Quantity\n"
                + "INTO [Sales]\n"
                + "FROM Product a left join t on a.ProductID = t.ProductID");
    }
}
