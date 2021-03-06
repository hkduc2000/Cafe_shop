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
import model.RevenueInf;

/**
 *
 * @author hokiduc
 */
public class SaleDAO extends BaseDAO {

    public void updateSales() {
        new CustomDAO().executeSQL("drop table Sales;\n"
                + "with t as(\n"
                + "SELECT ProductID ,SUM(Quantity) AS Quantity, SUM(Quantity*Price) as Revenue\n"
                + "FROM ProductInOrder\n"
                + "GROUP BY (ProductID))\n"
                + "SELECT a.*, Quantity, Revenue\n"
                + "INTO [Sales]\n"
                + "FROM Product a left join t on a.ProductID = t.ProductID;");
    }

    public ArrayList<RevenueInf> getRevenueByDay() {
        ArrayList<RevenueInf> infs = new ArrayList<>();
        try {
            String sql = "select sum(Quantity*Price) as revenue,  CONVERT(date, CreatedDate) as day\n"
                    + "from [order] a join [ProductInOrder] b on a.orderid = b.orderid\n"
                    + "group by CONVERT(date, CreatedDate)";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                RevenueInf inf = new RevenueInf();
                inf.setRevenue(rs.getInt(1));
                inf.setDay(rs.getDate(2));
                infs.add(inf);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SaleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return infs;
    }

    public ArrayList<RevenueInf> getRevenueByMonth() {
        ArrayList<RevenueInf> infs = new ArrayList<>();
        try {
            String sql = "select sum(Quantity*Price) as revenue, month(CreatedDate) as month, \n"
                    + "year(CreatedDate) as year\n"
                    + "from [order] a join [ProductInOrder] b on a.orderid = b.orderid\n"
                    + "group by month(CreatedDate), year(CreatedDate)";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                RevenueInf inf = new RevenueInf();
                inf.setRevenue(rs.getInt(1));
                inf.setMonth(rs.getInt(2));
                inf.setYear(rs.getInt(3));
                infs.add(inf);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SaleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return infs;
    }

    public ArrayList<RevenueInf> getRevenueByYear() {
        ArrayList<RevenueInf> infs = new ArrayList<>();
        try {
            String sql = "select sum(Quantity*Price) as revenue, year(CreatedDate) as year\n"
                    + "from [order] a join [ProductInOrder] b on a.orderid = b.orderid\n"
                    + "group by year(CreatedDate)";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                RevenueInf inf = new RevenueInf();
                inf.setRevenue(rs.getInt(1));
                inf.setYear(rs.getInt(2));
                infs.add(inf);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SaleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return infs;
    }

    public ArrayList<RevenueInf> getRevenueByCategory() {
        ArrayList<RevenueInf> infs = new ArrayList<>();
        try {
            String sql = "select CategoryName, SUM(Revenue) as Revenue \n"
                    + "from Sales a join Category b on a.CategoryID = b.CategoryID \n"
                    + "GROUP BY (CategoryName)";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                RevenueInf inf = new RevenueInf();
                inf.setRevenue(rs.getInt(2));
                inf.setCategory(rs.getString(1));
                infs.add(inf);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SaleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return infs;
    }
}
