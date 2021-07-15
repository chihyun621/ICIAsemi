package model;

public class ApprovalVO extends EmployeeVO{
	private String acode;
	private String aecode;
	private String atitle;
	private String acontent;
	private String afile;
	private String astate;
	public String getAcode() {
		return acode;
	}
	public void setAcode(String acode) {
		this.acode = acode;
	}
	public String getAecode() {
		return aecode;
	}
	public void setAecode(String aecode) {
		this.aecode = aecode;
	}
	public String getAtitle() {
		return atitle;
	}
	public void setAtitle(String atitle) {
		this.atitle = atitle;
	}
	public String getAcontent() {
		return acontent;
	}
	public void setAcontent(String acontent) {
		this.acontent = acontent;
	}
	public String getAfile() {
		return afile;
	}
	public void setAfile(String afile) {
		this.afile = afile;
	}
	public String getAstate() {
		return astate;
	}
	public void setAstate(String astate) {
		this.astate = astate;
	}
	@Override
	public String toString() {
		return "ApprovalVO [acode=" + acode + ", aecode=" + aecode + ", atitle=" + atitle + ", acontent=" + acontent
				+ ", afile=" + afile + ", astate=" + astate + "]";
	}
}
