package com.hackme;
//Java
import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
//Servlet
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;


public class Files {
	//Global Response
	private static HttpServletResponse rsp;
	
	public static HttpServletResponse getRsp() {
		return rsp;
	}
	public static void setRsp(HttpServletResponse rsp) {
		Files.rsp = rsp;
	}
	//Show Files On HomePage(LFI)
	public static void fileShow(HttpServletRequest request, String pageInc, JspWriter out) {
		FileInputStream fistream; 
		BufferedReader br;
		String strLine;
		String currPath = request.getRealPath("pages/posts") + "/";
		
		try{	
			fistream  = new FileInputStream(currPath + pageInc);
			DataInputStream in = new DataInputStream(fistream);
			br = new BufferedReader(new InputStreamReader(in));
			
			 while ((strLine = br.readLine()) != null) {
				  // Print the content on the console
				  out.println (strLine);
			 }
			 
			in.close();
		} catch (IOException e) {
			System.out.println ("Unable to open to file");
		}
	}
}
