package com.EcoSangraha.Util;

public class AdminStats {
    private int totalUsers;
    private int newListings;
    private double revenue;
    private int pendingApprovals;
    
    // Constructors
    public AdminStats() {}
    
    public AdminStats(int totalUsers, int newListings, double revenue, int pendingApprovals) {
        this.totalUsers = totalUsers;
        this.newListings = newListings;
        this.revenue = revenue;
        this.pendingApprovals = pendingApprovals;
    }
    
    // Getters and Setters
    public int getTotalUsers() {
        return totalUsers;
    }
    
    public void setTotalUsers(int totalUsers) {
        this.totalUsers = totalUsers;
    }
    
    public int getNewListings() {
        return newListings;
    }
    
    public void setNewListings(int newListings) {
        this.newListings = newListings;
    }
    
    public double getRevenue() {
        return revenue;
    }
    
    public void setRevenue(double revenue) {
        this.revenue = revenue;
    }
    
    public int getPendingApprovals() {
        return pendingApprovals;
    }
    
    public void setPendingApprovals(int pendingApprovals) {
        this.pendingApprovals = pendingApprovals;
    }
    
    @Override
    public String toString() {
        return "AdminStats{" +
                "totalUsers=" + totalUsers +
                ", newListings=" + newListings +
                ", revenue=" + revenue +
                ", pendingApprovals=" + pendingApprovals +
                '}';
    }
}