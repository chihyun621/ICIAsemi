package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.*;

@WebServlet(value={"/apr/list","/apr/list.json","/apr/read","/apr/insert","/apr/update","/apr/delete","/apr/done"})
public class Approval extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ApprovalDAO dao=new ApprovalDAO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		String path=request.getServletPath();
		RequestDispatcher dis=null;
		
		switch(path) {
		case "/apr/done":
			request.setAttribute("pageName", "/apr/done.jsp");
			dis=request.getRequestDispatcher("/home.jsp");
			dis.forward(request, response);
			break;
		case "/apr/delete":
			dao.delete(request.getParameter("acode"));
			response.sendRedirect("/home");
			break;
			
		case "/apr/insert":
			request.setAttribute("acode", dao.getCode());
			request.setAttribute("pageName", "/apr/insert.jsp");
			dis=request.getRequestDispatcher("/home.jsp");
			dis.forward(request, response);
			break;
			
		case "/apr/read":
			request.setAttribute("vo", dao.read(request.getParameter("acode")));
			request.setAttribute("pageName", "/apr/read.jsp");
			dis=request.getRequestDispatcher("/home.jsp");
			dis.forward(request, response);
			break;
			
		case "/apr/list":
			request.setAttribute("pageName", "/apr/list.jsp");
			dis=request.getRequestDispatcher("/home.jsp");
			dis.forward(request, response);
			break;
			
		case "/apr/list.json":
			SqlVO svo=new SqlVO();
			svo.setKey(request.getParameter("key"));
			svo.setWord(request.getParameter("word"));
			svo.setPage(Integer.parseInt(request.getParameter("page")));
			svo.setPerpage(Integer.parseInt(request.getParameter("perpage")));
			svo.setOrder(request.getParameter("order"));
			svo.setDesc(request.getParameter("desc"));
			out.println(dao.list(svo));
			break;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String path=request.getServletPath();
		
		MultipartRequest multi=new MultipartRequest(request, 
				"c:/Download", 1024*1024*100, "UTF-8", new DefaultFileRenamePolicy());
		
		ApprovalVO vo=new ApprovalVO();
		vo.setAcode(multi.getParameter("acode"));
		vo.setAecode(multi.getParameter("aecode"));
		vo.setAtitle(multi.getParameter("atitle"));
		vo.setAcontent(multi.getParameter("acontent"));
		vo.setAfile(multi.getFilesystemName("afile"));
		vo.setEname(multi.getParameter("ename"));
		vo.setEdep(multi.getParameter("edep"));
		vo.setEjobtitle(multi.getParameter("ejobtitle"));
		vo.setAstate(multi.getParameter("astate"));
		
		switch(path) {	
		case "/apr/update":
			ApprovalVO oldVO=dao.read(vo.getAcode());
			if(multi.getFilesystemName("afile")==null) { //새로 업로한 이미지 파일경우
				vo.setAfile(oldVO.getAfile());
			}else { //새로 업로드한 파일 있는경우
				if(oldVO.getAfile() != null) { //예전 파일이 있는경우
					File file=new File("c:/Download/" + oldVO.getAfile());
					file.delete();
				}
			}
			dao.update(vo);
			break;
		case "/apr/insert":
			dao.insert(vo);
			break;
		}
		response.sendRedirect("/home");
	}

}
