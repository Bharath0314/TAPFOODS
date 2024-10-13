package com.tapfoods.model;

public class PasswordEncryption {

	public static String encryption(String s) {

		StringBuilder encryptedPassword = new StringBuilder();

		for (int i = 0; i < s.length(); i++) {
			char c = s.charAt(i);
			c = (char) (c + 1);
			encryptedPassword.append(c);
		}
		return encryptedPassword.toString();
	}

	public static String decryption(String s) {
		StringBuilder decryptedPassword = new StringBuilder();
		for (int i = 0; i < s.length(); i++) {
			char c = s.charAt(i);
			c = (char) (c - 1);
			decryptedPassword.append(c);
		}
		return decryptedPassword.toString();
	}

}
