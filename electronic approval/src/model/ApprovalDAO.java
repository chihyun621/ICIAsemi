package model;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class ApprovalDAO {
	//기안삭제
	public void delete(String acode) {
		try {
			String sql="delete from approval where acode=?";
			PreparedStatement ps=DB.con.prepareStatement(sql);
			ps.setString(1, acode);
			ps.execute();
		}catch(Exception e) {
			
		}
	}
	//기안수정
	public void update(ApprovalVO vo) {
		try {
			String sql="update approval set aecode=?,atitle=?,astate=?,acontent=?,afile=? where acode=?";
			PreparedStatement ps=DB.con.prepareStatement(sql);
			ps.setString(1, vo.getAecode());
			ps.setString(2, vo.getAtitle());
			ps.setString(3, vo.getAstate());
			ps.setString(4, vo.getAcontent());
			ps.setString(5, vo.getAfile());
			ps.setString(6, vo.getAcode());
			ps.execute();
		}catch(Exception e) {
			System.out.println("기안수정오류:" + e.toString());
		}
	}
	
	//기안등록
	public void insert(ApprovalVO vo) {
		try {
			String sql="insert into approval(acode,aecode,atitle,acontent,afile) values(?,?,?,?,?)";
			PreparedStatement ps=DB.con.prepareStatement(sql);
			ps.setString(1, vo.getAcode());
			ps.setString(2, vo.getAecode());
			ps.setString(3, vo.getAtitle());
			ps.setString(4, vo.getAcontent());
			ps.setString(5, vo.getAfile());
			ps.execute();
		}catch(Exception e) {
			System.out.println("기안등록오류:" + e.toString());
		}
	}
	//자동 코드
	public String getCode() {
		String acode="A100";
		try {
			String sql="select max(acode) from approval";
			PreparedStatement ps=DB.con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				String lastId=rs.getString("max(acode)");
				acode="A" + (Integer.parseInt(lastId.substring(1))+1);
			}
		}catch(Exception e) {
			System.out.println("자동코드오류:" + e.toString());
		}
		return acode;
	}
	//기안읽기
	public ApprovalVO read(String acode) {
		ApprovalVO vo=new ApprovalVO ();
		try {
			String sql="select * from eapproval where acode=?";
			PreparedStatement ps=DB.con.prepareStatement(sql);
			ps.setString(1, acode);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				vo.setAcode(rs.getString("acode"));
				vo.setAecode(rs.getString("aecode"));
				vo.setAtitle(rs.getString("atitle"));
				vo.setAcontent(rs.getString("acontent"));
				vo.setAfile(rs.getString("afile"));
				vo.setAstate(rs.getString("astate"));
				vo.setEname(rs.getString("ename"));
				vo.setEdep(rs.getString("edep"));
				vo.setEjobtitle(rs.getString("ejobtitle"));
			}
		}catch(Exception e) {
			System.out.println("기안읽기오류:" + e.toString());
		}
		return vo;
	}
	//기안목록
	public JSONObject list(SqlVO vo) {
		JSONObject jObject=new JSONObject();
		try {
			String sql="{call list(?,?,?,?,?,?,?,?,?)}";
			CallableStatement cs=DB.con.prepareCall(sql);
			cs.setString(1, "eapproval");
			cs.setString(2, vo.getKey());
			cs.setString(3, vo.getWord());
			cs.setInt(4, vo.getPage());
			cs.setInt(5, vo.getPerpage());
			cs.setString(6, vo.getOrder());
			cs.setString(7, vo.getDesc());
			cs.registerOutParameter(8, oracle.jdbc.OracleTypes.CURSOR);
			cs.registerOutParameter(9, oracle.jdbc.OracleTypes.INTEGER);
			cs.execute();
			
			ResultSet rs=(ResultSet)cs.getObject(8);
			JSONArray array=new JSONArray();
			while(rs.next()) {
				JSONObject obj=new JSONObject();
				obj.put("acode", rs.getString("acode"));
				obj.put("aecode", rs.getString("aecode"));
				obj.put("atitle", rs.getString("atitle"));
				obj.put("acontent", rs.getString("acontent"));
				obj.put("afile", rs.getString("afile"));
				obj.put("astate", rs.getString("astate"));
				obj.put("ename", rs.getString("ename"));
				obj.put("edep", rs.getString("edep"));
				obj.put("ejobtitle", rs.getString("ejobtitle"));
				array.add(obj);
			}
			jObject.put("array", array);
			
			int count=cs.getInt(9);
			jObject.put("count", count);
		}catch(Exception e) {
			System.out.println("기안목록오류:" + e.toString());
		}
		return jObject;
	}
}
