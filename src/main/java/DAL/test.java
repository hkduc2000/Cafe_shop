/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import model.Product;
import model.User;

/**
 *
 * @author HKDUC
 */
public class test {

    public static void main(String[] args) {
//        User user = new User("Hoàng Kim Đức","hkduc","20001998","107 Châu Thị Vĩnh Tế", 
//                "0948692350","hoangkimduclqd@gmail.com", true);
//        new UserDAO().createUser(user);
          new OrderDAO().createEmptyCart("khanhvy");
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss");
//        System.out.println(sdf.format(new OrderDAO().getAll().get(0).getCreatedDate()));
    }
}
