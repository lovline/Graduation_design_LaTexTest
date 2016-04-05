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

@WebServlet("/edit2database")
public class EditServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public EditServlet2() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String contents = request.getParameter("ckeditor");
		System.out.println(contents);
		HttpSession session = request.getSession();
		
	    if(contents!="" && contents!=null){
			
			File file = new File("d:/ckeditorContent/test.txt");
		    PrintStream ps = new PrintStream(new FileOutputStream(file));
		    ps.println(contents);// 往文件里写入字符串
		    session.setAttribute("isWritten", true);
		    
		    //插入ckeditor数据到数据库student，表latex。
		    DB db = new DB();
		    /*这里如果不注意单双引号之间的问题，单双引号未成功转义的问题就会很麻烦。。
		     MySQL server version for the right syntax to use near */
		    //String sql = "insert into latex(contents) values(\""+contents+"\")";
		    String sql = "insert into latex(contents) values(\'"+contents+"\')";
		    db.insert(sql);
		   
		    
		    String info = URLEncoder.encode("ok", "utf-8");
			response.sendRedirect(request.getContextPath() + "/edit2.jsp?alert="+info);
	        
		}
		else{
			String info = URLEncoder.encode("编辑内容不能为空，请填入有效信息", "utf-8");
			response.sendRedirect(request.getContextPath() + "/edit2.jsp?alert="+info);
		}
		
	
	}

}
