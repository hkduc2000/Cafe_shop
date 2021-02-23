/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

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
    private Date CreatedDate;
    private ArrayList<ProductInOrder> OrderInf;
    private String ReceipientName;
    private String ReceipientAddress;
    private String ReceipientPhone;

    public Order(int OrderID, String Username, int StepID, Date CreatedDate, ArrayList<ProductInOrder> OrderInf) {
        this.OrderID = OrderID;
        this.Username = Username;
        this.StepID = StepID;
        this.CreatedDate = CreatedDate;
        this.OrderInf = OrderInf;
    }

    public Order() {
        OrderInf = new ArrayList<>();
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

    public Date getCreatedDate() {
        return CreatedDate;
    }

    public void setCreatedDate(Date CreatedDate) {
        this.CreatedDate = CreatedDate;
    }

    public ArrayList<ProductInOrder> getOrderInf() {
        return OrderInf;
    }

    public void setOrderInf(ArrayList<ProductInOrder> OrderInf) {
        this.OrderInf = OrderInf;
    }

    public String getReceipientName() {
        return ReceipientName;
    }

    public void setReceipientName(String ReceipientName) {
        this.ReceipientName = ReceipientName;
    }

    public String getReceipientAddress() {
        return ReceipientAddress;
    }

    public void setReceipientAddress(String ReceipientAddress) {
        this.ReceipientAddress = ReceipientAddress;
    }

    public String getReceipientPhone() {
        return ReceipientPhone;
    }

    public void setReceipientPhone(String ReceipientPhone) {
        this.ReceipientPhone = ReceipientPhone;
    }

    @Override
    public String toString() {
        return OrderID + " " + Username + " " + ReceipientName + " " + CreatedDate;
    }

    
    
}
