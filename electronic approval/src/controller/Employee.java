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
import javax.servlet.http.HttpSession;

import model.*;


@WebServlet(value={"/home","/emp/list","/emp/list.json","/emp/read","/emp/insert","/emp/update","/emp/delete"})
public class Employee extends HttpServlet {
	private static final long serialVersionUID = 1L;
	EmployeeDAO dao=new EmployeeDAO();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		String path=request.getServletPath();
		RequestDispatcher dis=null;
		
		
		switch(path) {
		case "/emp/delete":
			dao.delete(request.getParameter("ecode"));
			response.sendRedirect("/home");
			break;
		case "/emp/insert":
			request.setAttribute("ecode", dao.getCode());
			request.setAttribute("pageName", "/emp/insert.jsp");
			dis=request.getRequestDispatcher("/home.jsp");
			dis.forward(request, response);
			break;
		case "/emp/read":
			request.setAttribute("vo", dao.read(request.getParameter("ecode")));
			request.setAttribute("pageName", "/emp/read.jsp");
			dis=request.getRequestDispatcher("/home.jsp");
			dis.forward(request, response);
			break;
		case "/emp/list":
			request.setAttribute("pageName", "/emp/list.jsp");
			dis=request.getRequestDispatcher("/home.jsp");
			dis.forward(request, response);
			break;
		case "/emp/list.json":
			SqlVO svo=new SqlVO();
			svo.setKey(request.getParameter("key"));
			svo.setWord(request.getParameter("word"));
			svo.setPage(Integer.parseInt(request.getParameter("page")));
			svo.setPerpage(Integer.parseInt(request.getParameter("perpage")));
			svo.setOrder(request.getParameter("order"));
			svo.setDesc(request.getParameter("desc"));
			out.println(dao.list(svo));
			break;
		case "/home":
			request.setAttribute("pageName", "/emp/home.jsp");
			dis=request.getRequestDispatcher("/home.jsp");
			dis.forward(request, response);
			break;
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String path=request.getServletPath();
		
		
		EmployeeVO vo=new EmployeeVO();
		vo.setEcode(request.getParameter("ecode"));
		vo.setEid(request.getParameter("eid"));
		vo.setEpass(request.getParameter("epass"));
		vo.setEname(request.getParameter("ename"));
		vo.setEdep(request.getParameter("edep"));
		vo.setEjobtitle(request.getParameter("ejobtitle"));
		vo.setEtel(request.getParameter("etel"));
		vo.setEemail(request.getParameter("eemail"));

		switch(path) {	
		case "/emp/update":
			dao.update(vo);
			break;
		case "/emp/insert":
			dao.insert(vo);
			break;
		}
		response.sendRedirect("/home");
	}
}
