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
public class User {
    private String Name;
    private String Username;
    private String Password;
    private String Address;
    private String Phone;
    private String Mail;
    private boolean Admin;

    public User(String Name, String Username, String Password, String Address, String Phone, String Mail, boolean isAdmin) {
        this.Name = Name;
        this.Username = Username;
        this.Password = Password;
        this.Address = Address;
        this.Phone = Phone;
        this.Mail = Mail;
        this.Admin = isAdmin;
    }


    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }
  
    public User() {
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getMail() {
        return Mail;
    }

    public void setMail(String Mail) {
        this.Mail = Mail;
    }

    public boolean isAdmin() {
        return Admin;
    }

    public void setAdmin(boolean isAdmin) {
        this.Admin = isAdmin;
    }
    
    
}
