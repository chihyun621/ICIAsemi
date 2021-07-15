package model;

public class EmployeeVO {
	private String ecode;
	private String eid;
	private String epass;
	private String ename;
	private String edep;
	private String ejobtitle;
	private String etel;
	private String eemail;
	public String getEcode() {
		return ecode;
	}
	public void setEcode(String ecode) {
		this.ecode = ecode;
	}
	public String getEid() {
		return eid;
	}
	public void setEid(String eid) {
		this.eid = eid;
	}
	public String getEpass() {
		return epass;
	}
	public void setEpass(String epass) {
		this.epass = epass;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getEdep() {
		return edep;
	}
	public void setEdep(String edep) {
		this.edep = edep;
	}
	public String getEjobtitle() {
		return ejobtitle;
	}
	public void setEjobtitle(String ejobtitle) {
		this.ejobtitle = ejobtitle;
	}
	public String getEtel() {
		return etel;
	}
	public void setEtel(String etel) {
		this.etel = etel;
	}
	public String getEemail() {
		return eemail;
	}
	public void setEemail(String eemail) {
		this.eemail = eemail;
	}
	@Override
	public String toString() {
		return "EmployeeVO [ecode=" + ecode + ", eid=" + eid + ", epass=" + epass + ", ename=" + ename + ", edep="
				+ edep + ", ejobtitle=" + ejobtitle + ", etel=" + etel + ", eemail=" + eemail + "]";
	}
	
}
