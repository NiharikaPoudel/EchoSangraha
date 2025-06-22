package com.EcoSangraha.Util;

import java.time.LocalDate;
import java.time.Period;
import java.util.regex.Pattern;

import jakarta.servlet.http.Part;

public class ValidationUtil {

	// 1. Check if string is null or empty
	public static boolean isNullOrEmpty(String value) {
		return value == null || value.trim().isEmpty();
	}

	// 2. Check if string is alphabetic only
	public static boolean isAlphabetic(String value) {
		return value != null && value.matches("^[a-zA-Z]+$");
	}

	// 3. Check if string starts with a letter and has letters/numbers
	public static boolean isAlphanumericStartingWithLetter(String value) {
		return value != null && value.matches("^[a-zA-Z][a-zA-Z0-9]*$");
	}

	// 4. Check if gender is either male or female (case-insensitive)
	public static boolean isValidGender(String value) {
		return value != null && (value.equalsIgnoreCase("male") || value.equalsIgnoreCase("female"));
	}

	// 5. Validate email format
	public static boolean isValidEmail(String email) {
		String emailRegex = "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$";
		return email != null && Pattern.matches(emailRegex, email);
	}

	// 6. Validate Nepali phone number (starts with 98 and 10 digits)
	public static boolean isValidPhoneNumber(String number) {
		return number != null && number.matches("^98\\d{8}$");
	}

	// 7. Validate strong password (min 8 chars, 1 capital, 1 number, 1 symbol)
	public static boolean isValidPassword(String password) {
		String passwordRegex = "^(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$";
		return password != null && password.matches(passwordRegex);
	}

	// 8. Validate image file extension
	public static boolean isValidImageExtension(Part imagePart) {
		if (imagePart == null || isNullOrEmpty(imagePart.getSubmittedFileName())) {
			return false;
		}
		String fileName = imagePart.getSubmittedFileName().toLowerCase();
		return fileName.endsWith(".jpg") || fileName.endsWith(".jpeg") || fileName.endsWith(".png")
				|| fileName.endsWith(".gif");
	}

	// 9. Check if two passwords match
	public static boolean doPasswordsMatch(String password, String retypePassword) {
		return password != null && password.equals(retypePassword);
	}

	// 10. Check if user is at least 16 years old
	public static boolean isAgeAtLeast16(LocalDate dob) {
		if (dob == null) {
			return false;
		}
		return Period.between(dob, LocalDate.now()).getYears() >= 16;
	}
}
