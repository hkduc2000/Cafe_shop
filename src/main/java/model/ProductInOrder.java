/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author hokiduc
 */
public class ProductInOrder {
    private int OrderID;
    private int ProductID;
    private Product Product;
    private String Size;
    private int Quantity;
    private int Price;

    public ProductInOrder(int OrderID, int ProductID, String Size, int Quantity, int Price) {
        this.OrderID = OrderID;
        this.ProductID = ProductID;
        this.Size = Size;
        this.Quantity = Quantity;
        this.Price = Price;
    }

    public ProductInOrder() {
    }

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public int getPrice() {
        return Price;
    }

    public void setPrice(int Price) {
        this.Price = Price;
    }

    public String getSize() {
        return Size;
    }

    public void setSize(String Size) {
        this.Size = Size;
    }

    public Product getProduct() {
        return Product;
    }

    public void setProduct(Product Product) {
        this.Product = Product;
    }
    
    
}
