package com.xidian.graduation;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/edit")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//System.out.println("this is edit action.");
		String contents = request.getParameter("ckeditor");
		System.out.println(contents);
		
		if(contents!="" && contents!=null){
			
			File file = new File("d:/ckeditorContent/test.txt");
		    PrintStream ps = new PrintStream(new FileOutputStream(file));
		    ps.println(contents);// 往文件里写入字符串
		    HttpSession session = request.getSession();
		    session.setAttribute("path", "d:/ckeditorContent/test.txt");
		    String info = URLEncoder.encode("ok", "utf-8");
			response.sendRedirect(request.getContextPath() + "/infoCentral.jsp?alert="+info);
	        
		}
		else{
			String info = URLEncoder.encode("编辑内容不能为空，请填入有效信息", "utf-8");
			response.sendRedirect(request.getContextPath() + "/edit.jsp?alert="+info);
		}
		
		
	}

}
