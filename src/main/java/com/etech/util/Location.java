package com.etech.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletResponse;

public class Location {
	public static void uri(ServletResponse response,String uri) throws IOException {
		StringBuilder script=new StringBuilder();
		script.append("<script>").append("top.location.href='"+uri+"'").append("</script>");
		PrintWriter pw = new PrintWriter(response.getOutputStream());
		pw.write(script.toString());
		pw.close();
	}
}
