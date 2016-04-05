package com.xidian.graduation;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EditBean {

	private boolean isWritten = false;
	private Integer id;
	private String contents;
	public boolean getIsWritten() {
		return isWritten;
	}
	public void setIsWritten(boolean isWritten) {
		this.isWritten = isWritten;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	public EditBean() {
		super();
	}
	public EditBean(boolean isWritten, Integer id, String contents) {
		super();
		this.isWritten = isWritten;
		this.id = id;
		this.contents = contents;
	}
	public void insertData(String contents) {
	    //插入ckeditor数据到数据库student，表latex。
	    DB db = new DB();
	    /*这里如果不注意单双引号之间的问题，单双引号未成功转义的问题就会很麻烦。。
	     MySQL server version for the right syntax to use near */
	    //String sql = "insert into latex(contents) values(\""+contents+"\")";
	    String sql = "insert into latex(contents) values(\'"+contents+"\')";
	    db.insert(sql);
		
	}
	public List<EditBean> getContentsFromDatabase() {
		List<EditBean> list = new ArrayList<EditBean>();
		DB db = new DB();
		String sql = "select * from latex";
		ResultSet rs = db.select(sql);
		try {
			while(rs.next()){
				EditBean eb = new EditBean();
				int eId = rs.getInt("id");
				String eContents = rs.getString("contents");
				eb.setId(eId);
				eb.setContents(eContents);
				list.add(eb);	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	
	
	
}
