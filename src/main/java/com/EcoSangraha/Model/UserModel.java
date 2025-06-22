package com.EcoSangraha.Model;

import java.time.LocalDate;

public class UserModel {
    private int userId;
    private String username;
    private String phoneNumber;
    private String email;
    private String address;
    private String password;
    private String userPhoto;
    private LocalDate dateJoined;
    private String status;
    private int uploadCount;
    private int purchaseCount;
    private String role;

    // Default constructor
    public UserModel() {}

    // Constructor for login
    public UserModel(String username, String password) {
        this.username = username;
        this.password = password;
    }

    // All getters and setters
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getPhoneNumber() { return phoneNumber; }
    public void setPhoneNumber(String phoneNumber) { this.phoneNumber = phoneNumber; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getUserPhoto() { return userPhoto; }
    public void setUserPhoto(String userPhoto) { this.userPhoto = userPhoto; }

    public LocalDate getDateJoined() { return dateJoined; }
    public void setDateJoined(LocalDate dateJoined) { this.dateJoined = dateJoined; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public int getUploadCount() { return uploadCount; }
    public void setUploadCount(int uploadCount) { this.uploadCount = uploadCount; }

    public int getPurchaseCount() { return purchaseCount; }
    public void setPurchaseCount(int purchaseCount) { this.purchaseCount = purchaseCount; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    @Override
    public String toString() {
        return "UserModel{" +
                "userId=" + userId +
                ", username='" + username + '\'' +
                ", email='" + email + '\'' +
                ", role='" + role + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}