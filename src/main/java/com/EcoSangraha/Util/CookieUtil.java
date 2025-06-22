package com.EcoSangraha.Util;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.Base64;
import java.nio.charset.StandardCharsets;

/**
 * Complete utility class for managing cookies in the EcoSangraha web application.
 * Provides comprehensive methods for cookie management with security and debugging features.
 */
public class CookieUtil {

    // Cookie duration constants
    public static final int ONE_MINUTE = 60;
    public static final int ONE_HOUR = 60 * 60;
    public static final int ONE_DAY = 24 * ONE_HOUR;
    public static final int ONE_WEEK = 7 * ONE_DAY;
    public static final int ONE_MONTH = 30 * ONE_DAY;
    public static final int ONE_YEAR = 365 * ONE_DAY;

    // Common cookie names
    public static final String REMEMBER_USERNAME = "eco_remember_username";
    public static final String REMEMBER_PASSWORD = "eco_remember_password";
    public static final String USER_THEME = "eco_user_theme";
    public static final String USER_LANGUAGE = "eco_user_language";
    public static final String LAST_LOGIN = "eco_last_login";
    public static final String SESSION_TOKEN = "eco_session_token";
    public static final String USER_PREFERENCES = "eco_user_preferences";
    public static final String CART_ITEMS = "eco_cart_items";
    public static final String RECENT_SEARCHES = "eco_recent_searches";

    /**
     * Adds a cookie with the specified name, value, and maximum age.
     */
    public static void addCookie(HttpServletResponse response, String name, String value, int maxAge) {
        try {
            Cookie cookie = new Cookie(name, value);
            cookie.setMaxAge(maxAge);
            cookie.setPath("/");
            cookie.setHttpOnly(true);
            response.addCookie(cookie);
            System.out.println("✅ Cookie added: " + name + " = " + value + " (maxAge: " + maxAge + "s)");
        } catch (Exception e) {
            System.err.println("❌ Error adding cookie '" + name + "': " + e.getMessage());
            e.printStackTrace();
        }
    }

    /**
     * Adds a cookie with JavaScript access enabled (for Remember Me functionality)
     */
    public static void addCookieWithJSAccess(HttpServletResponse response, String name, String value, int maxAge) {
        try {
            Cookie cookie = new Cookie(name, value);
            cookie.setMaxAge(maxAge);
            cookie.setPath("/");
            cookie.setHttpOnly(false); // Allow JavaScript access
            response.addCookie(cookie);
            System.out.println("✅ JS-accessible cookie added: " + name + " = " + value + " (maxAge: " + maxAge + "s)");
        } catch (Exception e) {
            System.err.println("❌ Error adding JS-accessible cookie '" + name + "': " + e.getMessage());
            e.printStackTrace();
        }
    }

    /**
     * Adds a secure cookie with full configuration options.
     */
    public static void addSecureCookie(HttpServletResponse response, String name, String value, 
                                      int maxAge, String path, boolean secure, boolean httpOnly) {
        try {
            Cookie cookie = new Cookie(name, value);
            cookie.setMaxAge(maxAge);
            cookie.setPath(path);
            cookie.setSecure(secure);
            cookie.setHttpOnly(httpOnly);
            response.addCookie(cookie);
            System.out.println("✅ Secure cookie added: " + name + " = " + value);
        } catch (Exception e) {
            System.err.println("❌ Error adding secure cookie '" + name + "': " + e.getMessage());
            e.printStackTrace();
        }
    }

    /**
     * Retrieves a cookie by its name from the HttpServletRequest.
     */
    public static Cookie getCookie(HttpServletRequest request, String name) {
        try {
            if (request.getCookies() != null) {
                Cookie foundCookie = Arrays.stream(request.getCookies())
                        .filter(cookie -> name.equals(cookie.getName()))
                        .findFirst()
                        .orElse(null);
                
                if (foundCookie != null) {
                    System.out.println("🔍 Cookie found: " + name + " = " + foundCookie.getValue());
                } else {
                    System.out.println("🔍 Cookie not found: " + name);
                }
                return foundCookie;
            }
            System.out.println("🔍 No cookies found in request");
        } catch (Exception e) {
            System.err.println("❌ Error getting cookie '" + name + "': " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Gets cookie value as string.
     */
    public static String getCookieValue(HttpServletRequest request, String name) {
        Cookie cookie = getCookie(request, name);
        return cookie != null ? cookie.getValue() : null;
    }

    /**
     * Gets cookie value with default fallback.
     */
    public static String getCookieValue(HttpServletRequest request, String name, String defaultValue) {
        String value = getCookieValue(request, name);
        return value != null ? value : defaultValue;
    }

    /**
     * Checks if a cookie exists.
     */
    public static boolean cookieExists(HttpServletRequest request, String name) {
        return getCookie(request, name) != null;
    }

    /**
     * Deletes a cookie by setting its max age to 0.
     */
    public static void deleteCookie(HttpServletResponse response, String name) {
        try {
            Cookie cookie = new Cookie(name, "");
            cookie.setMaxAge(0);
            cookie.setPath("/");
            response.addCookie(cookie);
            System.out.println("🗑️ Cookie deleted: " + name);
        } catch (Exception e) {
            System.err.println("❌ Error deleting cookie '" + name + "': " + e.getMessage());
            e.printStackTrace();
        }
    }

    /**
     * Deletes multiple cookies at once.
     */
    public static void deleteCookies(HttpServletResponse response, String... cookieNames) {
        for (String cookieName : cookieNames) {
            deleteCookie(response, cookieName);
        }
    }

    /**
     * Updates an existing cookie with new value.
     */
    public static void updateCookie(HttpServletResponse response, String name, String newValue, int maxAge) {
        addCookie(response, name, newValue, maxAge);
        System.out.println("🔄 Cookie updated: " + name + " = " + newValue);
    }

    /**
     * Gets all cookies as a Map.
     */
    public static Map<String, String> getAllCookies(HttpServletRequest request) {
        Map<String, String> cookieMap = new HashMap<>();
        
        try {
            if (request.getCookies() != null) {
                Arrays.stream(request.getCookies())
                      .forEach(cookie -> cookieMap.put(cookie.getName(), cookie.getValue()));
                
                System.out.println("📋 Retrieved " + cookieMap.size() + " cookies");
            }
        } catch (Exception e) {
            System.err.println("❌ Error getting all cookies: " + e.getMessage());
            e.printStackTrace();
        }
        
        return cookieMap;
    }

    // ==================== REMEMBER ME FUNCTIONALITY ====================

    /**
     * Sets remember me cookies for login with enhanced functionality.
     */
    public static void setRememberMeCookies(HttpServletResponse response, String username, String password) {
        try {
            // Use JS-accessible cookies for Remember Me functionality
            addCookieWithJSAccess(response, REMEMBER_USERNAME, username, ONE_MONTH);
            addCookieWithJSAccess(response, REMEMBER_PASSWORD, password, ONE_MONTH);
            
            // Also set a flag cookie to indicate remember me is active
            addCookie(response, "eco_remember_active", "true", ONE_MONTH);
            
            System.out.println("🔐 Remember me cookies set for user: " + username);
            System.out.println("   - Username cookie: " + REMEMBER_USERNAME + " = " + username);
            System.out.println("   - Password cookie: " + REMEMBER_PASSWORD + " = ***set***");
            System.out.println("   - Remember active flag: eco_remember_active = true");
        } catch (Exception e) {
            System.err.println("❌ Error setting remember me cookies: " + e.getMessage());
            e.printStackTrace();
        }
    }

    /**
     * Sets remember me cookies with encryption (more secure).
     */
    public static void setRememberMeCookiesEncrypted(HttpServletResponse response, String username, String password) {
        try {
            // Base64 encode for basic obfuscation (not real encryption, but better than plain text)
            String encodedUsername = Base64.getEncoder().encodeToString(username.getBytes(StandardCharsets.UTF_8));
            String encodedPassword = Base64.getEncoder().encodeToString(password.getBytes(StandardCharsets.UTF_8));
            
            addCookieWithJSAccess(response, REMEMBER_USERNAME, encodedUsername, ONE_MONTH);
            addCookieWithJSAccess(response, REMEMBER_PASSWORD, encodedPassword, ONE_MONTH);
            addCookie(response, "eco_remember_encoded", "true", ONE_MONTH);
            
            System.out.println("🔐 Encrypted remember me cookies set for user: " + username);
        } catch (Exception e) {
            System.err.println("❌ Error setting encrypted remember me cookies: " + e.getMessage());
            e.printStackTrace();
        }
    }

    /**
     * Clears remember me cookies.
     */
    public static void clearRememberMeCookies(HttpServletResponse response) {
        deleteCookie(response, REMEMBER_USERNAME);
        deleteCookie(response, REMEMBER_PASSWORD);
        deleteCookie(response, "eco_remember_active");
        deleteCookie(response, "eco_remember_encoded");
        System.out.println("🔐 Remember me cookies cleared");
    }

    /**
     * Gets remembered login credentials with enhanced error handling.
     */
    public static Map<String, String> getRememberedCredentials(HttpServletRequest request) {
        Map<String, String> credentials = new HashMap<>();
        
        try {
            String username = getCookieValue(request, REMEMBER_USERNAME);
            String password = getCookieValue(request, REMEMBER_PASSWORD);
            boolean isEncoded = "true".equals(getCookieValue(request, "eco_remember_encoded"));
            
            System.out.println("🔍 Checking for remembered credentials:");
            System.out.println("   - Username cookie: " + (username != null ? "found" : "not found"));
            System.out.println("   - Password cookie: " + (password != null ? "found" : "not found"));
            System.out.println("   - Is encoded: " + isEncoded);
            
            if (username != null && password != null && !username.trim().isEmpty() && !password.trim().isEmpty()) {
                if (isEncoded) {
                    // Decode Base64 encoded values
                    try {
                        username = new String(Base64.getDecoder().decode(username), StandardCharsets.UTF_8);
                        password = new String(Base64.getDecoder().decode(password), StandardCharsets.UTF_8);
                        System.out.println("✅ Decoded remembered credentials");
                    } catch (Exception e) {
                        System.err.println("❌ Error decoding credentials: " + e.getMessage());
                        return credentials; // Return empty map on decode error
                    }
                }
                
                credentials.put("username", username);
                credentials.put("password", password);
                System.out.println("✅ Valid remembered credentials found for: " + username);
            } else {
                System.out.println("ℹ️ No valid remembered credentials found");
            }
            
        } catch (Exception e) {
            System.err.println("❌ Error getting remembered credentials: " + e.getMessage());
            e.printStackTrace();
        }
        
        return credentials;
    }

    /**
     * Checks if remember me cookies exist.
     */
    public static boolean hasRememberedCredentials(HttpServletRequest request) {
        boolean hasUsername = cookieExists(request, REMEMBER_USERNAME);
        boolean hasPassword = cookieExists(request, REMEMBER_PASSWORD);
        boolean isActive = "true".equals(getCookieValue(request, "eco_remember_active"));
        
        System.out.println("🔍 Remember me status:");
        System.out.println("   - Has username: " + hasUsername);
        System.out.println("   - Has password: " + hasPassword);
        System.out.println("   - Is active: " + isActive);
        
        return hasUsername && hasPassword;
    }

    // ==================== USER PREFERENCES ====================

    /**
     * Sets user theme preference.
     */
    public static void setTheme(HttpServletResponse response, String theme) {
        addCookie(response, USER_THEME, theme, ONE_YEAR);
        System.out.println("🎨 Theme preference set: " + theme);
    }

    /**
     * Gets user theme preference.
     */
    public static String getTheme(HttpServletRequest request) {
        return getCookieValue(request, USER_THEME, "light");
    }

    /**
     * Sets user language preference.
     */
    public static void setLanguage(HttpServletResponse response, String language) {
        addCookie(response, USER_LANGUAGE, language, ONE_YEAR);
        System.out.println("🌐 Language preference set: " + language);
    }

    /**
     * Gets user language preference.
     */
    public static String getLanguage(HttpServletRequest request) {
        return getCookieValue(request, USER_LANGUAGE, "en");
    }

    /**
     * Sets a custom user preference.
     */
    public static void setUserPreference(HttpServletResponse response, String key, String value) {
        addCookie(response, "eco_pref_" + key, value, ONE_YEAR);
        System.out.println("⚙️ User preference set: " + key + " = " + value);
    }

    /**
     * Gets a custom user preference.
     */
    public static String getUserPreference(HttpServletRequest request, String key, String defaultValue) {
        return getCookieValue(request, "eco_pref_" + key, defaultValue);
    }

    // ==================== SESSION MANAGEMENT ====================

    /**
     * Sets last login timestamp.
     */
    public static void setLastLogin(HttpServletResponse response) {
        String timestamp = String.valueOf(System.currentTimeMillis());
        addCookie(response, LAST_LOGIN, timestamp, ONE_YEAR);
        System.out.println("⏰ Last login timestamp set: " + timestamp);
    }

    /**
     * Gets last login timestamp.
     */
    public static Long getLastLogin(HttpServletRequest request) {
        String timestamp = getCookieValue(request, LAST_LOGIN);
        try {
            return timestamp != null ? Long.parseLong(timestamp) : null;
        } catch (NumberFormatException e) {
            System.err.println("❌ Invalid last login timestamp: " + timestamp);
            return null;
        }
    }

    /**
     * Sets session token cookie.
     */
    public static void setSessionToken(HttpServletResponse response, String token) {
        addSecureCookie(response, SESSION_TOKEN, token, ONE_DAY, "/", false, true);
        System.out.println("🔑 Session token set");
    }

    /**
     * Gets session token.
     */
    public static String getSessionToken(HttpServletRequest request) {
        return getCookieValue(request, SESSION_TOKEN);
    }

    // ==================== SHOPPING CART FUNCTIONALITY ====================

    /**
     * Sets cart items as JSON string.
     */
    public static void setCartItems(HttpServletResponse response, String cartJson) {
        addCookie(response, CART_ITEMS, cartJson, ONE_WEEK);
        System.out.println("🛒 Cart items saved to cookie");
    }

    /**
     * Gets cart items JSON string.
     */
    public static String getCartItems(HttpServletRequest request) {
        return getCookieValue(request, CART_ITEMS, "[]");
    }

    /**
     * Clears cart items.
     */
    public static void clearCart(HttpServletResponse response) {
        deleteCookie(response, CART_ITEMS);
        System.out.println("🛒 Cart cleared");
    }

    // ==================== SEARCH FUNCTIONALITY ====================

    /**
     * Sets recent searches.
     */
    public static void setRecentSearches(HttpServletResponse response, String searchesJson) {
        addCookie(response, RECENT_SEARCHES, searchesJson, ONE_MONTH);
        System.out.println("🔍 Recent searches saved");
    }

    /**
     * Gets recent searches.
     */
    public static String getRecentSearches(HttpServletRequest request) {
        return getCookieValue(request, RECENT_SEARCHES, "[]");
    }

    // ==================== DEBUGGING UTILITIES ====================

    /**
     * Debug method to print all cookies with detailed information.
     */
    public static void debugPrintAllCookies(HttpServletRequest request) {
        System.out.println("\n🍪 === DETAILED COOKIE DEBUG INFO ===");
        
        if (request.getCookies() != null) {
            System.out.println("Total cookies found: " + request.getCookies().length);
            Arrays.stream(request.getCookies())
                  .forEach(cookie -> {
                      System.out.println("Cookie Details:");
                      System.out.println("  Name: " + cookie.getName());
                      System.out.println("  Value: " + cookie.getValue());
                      System.out.println("  MaxAge: " + cookie.getMaxAge());
                      System.out.println("  Path: " + cookie.getPath());
                      System.out.println("  Domain: " + cookie.getDomain());
                      System.out.println("  Secure: " + cookie.getSecure());
                      System.out.println("  HttpOnly: " + cookie.isHttpOnly());
                      System.out.println("  ---");
                  });
        } else {
            System.out.println("No cookies found in request");
        }
        
        System.out.println("=== END DETAILED COOKIE DEBUG ===\n");
    }

    /**
     * Debug specific cookie functionality.
     */
    public static void debugRememberMeFunctionality(HttpServletRequest request) {
        System.out.println("\n🔐 === REMEMBER ME DEBUG ===");
        
        boolean hasUsername = cookieExists(request, REMEMBER_USERNAME);
        boolean hasPassword = cookieExists(request, REMEMBER_PASSWORD);
        String username = getCookieValue(request, REMEMBER_USERNAME);
        String password = getCookieValue(request, REMEMBER_PASSWORD);
        
        System.out.println("Remember Me Status:");
        System.out.println("  Username cookie exists: " + hasUsername);
        System.out.println("  Password cookie exists: " + hasPassword);
        System.out.println("  Username value: " + (username != null ? username : "null"));
        System.out.println("  Password value: " + (password != null ? "***found***" : "null"));
        System.out.println("  Both valid: " + (hasUsername && hasPassword && username != null && password != null));
        
        Map<String, String> credentials = getRememberedCredentials(request);
        System.out.println("  Credentials retrieved: " + !credentials.isEmpty());
        
        System.out.println("=== END REMEMBER ME DEBUG ===\n");
    }

    /**
     * Validates cookie name format.
     */
    public static boolean isValidCookieName(String name) {
        return name != null && name.matches("^[a-zA-Z0-9_-]+$");
    }

    /**
     * Safely adds cookie with name validation.
     */
    public static boolean safeAddCookie(HttpServletResponse response, String name, String value, int maxAge) {
        if (!isValidCookieName(name)) {
            System.err.println("❌ Invalid cookie name: " + name);
            return false;
        }
        
        addCookie(response, name, value, maxAge);
        return true;
    }

    /**
     * Clears all application cookies.
     */
    public static void clearAllEcoCookies(HttpServletResponse response) {
        System.out.println("🧹 Clearing all EcoSangraha cookies...");
        
        deleteCookies(response, 
            REMEMBER_USERNAME, REMEMBER_PASSWORD, "eco_remember_active", "eco_remember_encoded",
            USER_THEME, USER_LANGUAGE, LAST_LOGIN, SESSION_TOKEN, 
            CART_ITEMS, RECENT_SEARCHES, USER_PREFERENCES
        );
        
        System.out.println("🧹 All EcoSangraha cookies cleared");
    }

    /**
     * Cookie health check - validates all important cookies.
     */
    public static Map<String, Boolean> cookieHealthCheck(HttpServletRequest request) {
        Map<String, Boolean> healthStatus = new HashMap<>();
        
        healthStatus.put("remember_username", cookieExists(request, REMEMBER_USERNAME));
        healthStatus.put("remember_password", cookieExists(request, REMEMBER_PASSWORD));
        healthStatus.put("user_theme", cookieExists(request, USER_THEME));
        healthStatus.put("user_language", cookieExists(request, USER_LANGUAGE));
        healthStatus.put("session_token", cookieExists(request, SESSION_TOKEN));
        
        System.out.println("🏥 Cookie health check completed");
        healthStatus.forEach((key, value) -> 
            System.out.println("  " + key + ": " + (value ? "✅ OK" : "❌ Missing"))
        );
        
        return healthStatus;
    }
}