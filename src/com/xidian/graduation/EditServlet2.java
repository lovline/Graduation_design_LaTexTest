package com.xidian.graduation;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

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
		EditBean eb = new EditBean();
		boolean flag = eb.getIsWritten();
		List<EditBean> list = new ArrayList<EditBean>();
		
	    if(contents!="" && contents!=null){
	    	flag = true;
		    session.setAttribute("isWritten", flag);
		    //插入数据到数据库
		    eb.insertData(contents);

/*这段代码不应该出现在这里，破坏了插入和查询的分开功能，会造成混淆的。
 * 将这段代码拿到相应的JSP文件中得到更好一点，目前这是解决方案。
			 //查询当前数据库的edit内容
		    list = eb.getContentsFromDatabase();
		    session.setAttribute("contentsList", list);
*/		    
		    
		    String info = URLEncoder.encode("ok", "utf-8");
			response.sendRedirect(request.getContextPath() + "/edit2.jsp?alert="+info);
	        
		}
		else{
			session.setAttribute("isWritten", flag);
			String info = URLEncoder.encode("编辑内容不能为空，请填入有效信息", "utf-8");
			response.sendRedirect(request.getContextPath() + "/edit2.jsp?alert="+info);
		}
		
	
	}

}
