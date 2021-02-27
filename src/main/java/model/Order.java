/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author hokiduc
 */
public class Order {

    private int OrderID;
    private String Username;
    private int StepID;
    private Timestamp CreatedDate;
    private ArrayList<ProductInOrder> OrderInf;
    private String RecipientName;
    private String RecipientAddress;
    private String RecipientPhone;

    public Order(int OrderID, String Username, int StepID, Timestamp CreatedDate, ArrayList<ProductInOrder> OrderInf) {
        this.OrderID = OrderID;
        this.Username = Username;
        this.StepID = StepID;
        this.CreatedDate = CreatedDate;
        this.OrderInf = OrderInf;
    }

    public Order() {
        OrderInf = new ArrayList<>();
    }
    
    public int calcTotalPrice(){
        int sum = 0;
        for (ProductInOrder inf: OrderInf){
            sum += (inf.getPrice()*inf.getQuantity());
        }
        return sum;
    }

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public int getStepID() {
        return StepID;
    }

    public void setStepID(int StepID) {
        this.StepID = StepID;
    }

    public Timestamp getCreatedDate() {
        return CreatedDate;
    }

    public void setCreatedDate(Timestamp CreatedDate) {
        this.CreatedDate = CreatedDate;
    }

    public ArrayList<ProductInOrder> getOrderInf() {
        return OrderInf;
    }

    public void setOrderInf(ArrayList<ProductInOrder> OrderInf) {
        this.OrderInf = OrderInf;
    }

    public String getRecipientName() {
        return RecipientName;
    }

    public void setRecipientName(String RecipientName) {
        this.RecipientName = RecipientName;
    }

    public String getRecipientAddress() {
        return RecipientAddress;
    }

    public void setRecipientAddress(String RecipientAddress) {
        this.RecipientAddress = RecipientAddress;
    }

    public String getRecipientPhone() {
        return RecipientPhone;
    }

    public void setRecipientPhone(String RecipientPhone) {
        this.RecipientPhone = RecipientPhone;
    }

    

    
    
}
