package bean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.DBUtil;

public class Youhui {
	DBUtil db=DBUtil.getDB();
	
	private String id;
	private String content;
	private String startTime;
	private String endTime;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	
	/**
	 *功能： 添加优惠<br>
	 * 参数：优惠内容，开始时间，结束时间<br>
	 * 返回值：布尔
	 */
	public boolean saveYouhui(String yContent,String sTime,String eTime){
		String sql="insert into youhui(ytent,ystime,yetime,yflag)values('"+yContent+"','"+sTime+"','"+eTime+"',0)";
		System.out.println("添加优惠："+sql);
		return db.executeUpdate(sql)>0?true:false;
	}
	
	/**
	 * 功能：遍历优惠<br>
	 * 参数：无<br>
	 * 返回值：list
	 */
	public ArrayList<Youhui> getAllYouhui(){
		ArrayList<Youhui> list=new ArrayList<Youhui>();
		String sql="select yid,ytent,ystime,yetime from youhui where yflag=0 ";
		ResultSet rs=db.executeQuery(sql);
		try {
			while(rs.next()){
				Youhui yh=new Youhui();
				
				yh.setId(rs.getString("yid"));
				yh.setContent(rs.getString("ytent"));
				yh.setStartTime(rs.getString("ystime"));
				yh.setEndTime(rs.getString("yetime"));
				
				list.add(yh);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
}
