package com.EcoSangraha.Model;

public class AdminStats {
    private int totalUsers;
    private int newListings;
    private double revenue;
    private int pendingApprovals;
    private int totalListings;
    private int activeUsers;
    private int completedTransactions;
    
    // Default constructor
    public AdminStats() {}
    
    // Constructor with main stats
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
    
    public int getTotalListings() {
        return totalListings;
    }
    
    public void setTotalListings(int totalListings) {
        this.totalListings = totalListings;
    }
    
    public int getActiveUsers() {
        return activeUsers;
    }
    
    public void setActiveUsers(int activeUsers) {
        this.activeUsers = activeUsers;
    }
    
    public int getCompletedTransactions() {
        return completedTransactions;
    }
    
    public void setCompletedTransactions(int completedTransactions) {
        this.completedTransactions = completedTransactions;
    }
    
    // Utility methods
    public String getFormattedRevenue() {
        return String.format("Rs. %.2f", revenue);
    }
    
    public double getRevenueInThousands() {
        return revenue / 1000.0;
    }
    
    @Override
    public String toString() {
        return "AdminStats{" +
                "totalUsers=" + totalUsers +
                ", newListings=" + newListings +
                ", revenue=" + revenue +
                ", pendingApprovals=" + pendingApprovals +
                ", totalListings=" + totalListings +
                ", activeUsers=" + activeUsers +
                ", completedTransactions=" + completedTransactions +
                '}';
    }
}