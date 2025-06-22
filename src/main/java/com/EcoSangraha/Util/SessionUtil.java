package com.EcoSangraha.Util;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

/**
 * Utility class for managing HTTP session attributes safely.
 * Provides methods to set, get, remove session attributes and invalidate the session.
 */
public class SessionUtil {

    /**
     * Sets a session attribute. Creates a session if none exists.
     *
     * @param request the HttpServletRequest object
     * @param key the name of the session attribute
     * @param value the value to set
     */
    public static void setAttribute(HttpServletRequest request, String key, Object value) {
        HttpSession session = request.getSession(); // creates session if not exists
        session.setAttribute(key, value);
    }

    /**
     * Retrieves a session attribute if the session exists.
     *
     * @param request the HttpServletRequest object
     * @param key the name of the session attribute
     * @return the attribute value or null if session or attribute does not exist
     */
    public static Object getAttribute(HttpServletRequest request, String key) {
        HttpSession session = request.getSession(false); // do NOT create session if missing
        return (session != null) ? session.getAttribute(key) : null;
    }

    /**
     * Removes a session attribute if the session exists.
     *
     * @param request the HttpServletRequest object
     * @param key the name of the session attribute to remove
     */
    public static void removeAttribute(HttpServletRequest request, String key) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.removeAttribute(key);
        }
    }

    /**
     * Invalidates the session if it exists.
     *
     * @param request the HttpServletRequest object
     */
    public static void invalidateSession(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
    }
}
