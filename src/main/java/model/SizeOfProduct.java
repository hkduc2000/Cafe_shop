/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author HKDUC
 */
public class SizeOfProduct {
    private int ProductID;
    private String size;
    private int price;
    private int Quantity;   

    public SizeOfProduct(int ProductID, String size, int price, int Quantity) {
        this.ProductID = ProductID;
        this.size = size;
        this.price = price;
        this.Quantity = Quantity;
    }

    public SizeOfProduct() {
    }

    

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }
}
