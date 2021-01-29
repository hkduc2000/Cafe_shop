/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author HKDUC
 */
public class Product {
    private int ProductID;
    private String ProductName;
    private String ProductImage;
    private String Description;
    private int CategoryID;
    private ArrayList<SizeOfProduct> Sizes;
    private MultipartFile ImageFile;

    public Product(String ProductName, String ProductImage, String Description, int CategoryID) {
        this.ProductName = ProductName;
        this.ProductImage = ProductImage;
        this.Description = Description;
        this.CategoryID = CategoryID;
    }   

    public MultipartFile getImageFile() {
        return ImageFile;
    }

    public void setImageFile(MultipartFile ImageFile) {
        this.ImageFile = ImageFile;
    }

    public Product(int ProductID, String ProductName, String ProductImage, String Description, int CategoryID, ArrayList<SizeOfProduct> Sizes) {
        this.ProductID = ProductID;
        this.ProductName = ProductName;
        this.ProductImage = ProductImage;
        this.Description = Description;
        this.CategoryID = CategoryID;
        this.Sizes = Sizes;
    }

    public Product(String ProductName, String ProductImage, String Description, int CategoryID, ArrayList<SizeOfProduct> Sizes) {
        this.ProductName = ProductName;
        this.ProductImage = ProductImage;
        this.Description = Description;
        this.CategoryID = CategoryID;
        this.Sizes = Sizes;
    }

    public ArrayList<SizeOfProduct> getSizes() {
        return Sizes;
    }

    public void setSizes(ArrayList<SizeOfProduct> Sizes) {
        this.Sizes = Sizes;
    }

    public Product() {
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String ProductName) {
        this.ProductName = ProductName;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
    }

    public String getProductImage() {
        return ProductImage;
    }

    public void setProductImage(String ProductImage) {
        this.ProductImage = ProductImage;
    }
}
