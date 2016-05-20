package com.rainbow.web.admin;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

public class AdminMain {

	public static void main(String[] args) throws IOException {
		Properties p = new Properties();
		try {
			FileInputStream file = new FileInputStream("../rainbow/src/main/resources/config/fileUpload.properties");
			p.load(file);
			System.out.println(p.getProperty("fileUpload.vodPath"));
			System.out.println(p.getProperty("fileUpload.moviePath"));
			file.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

	}

}
