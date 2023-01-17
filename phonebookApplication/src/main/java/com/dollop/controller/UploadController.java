package com.dollop.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.dollop.dao.UserInterfaceDAOImpl;
import com.dollop.model.User;

/**
 * Servlet implementation class UploadController
 */
public class UploadController extends HttpServlet {
	UserInterfaceDAOImpl uidi = new UserInterfaceDAOImpl();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		ServletFileUpload upload = new ServletFileUpload(new DiskFileItemFactory());
		String id = request.getParameter("uid");
		String uimage = request.getParameter("uimage");
		if(uimage!=null)
		{
			File f= new File("C:\\Users\\Hp\\eclipse-workspace\\PhoneBookApp\\src\\main\\webapp\\images\\"+uimage);           //file to be delete  
			if(f.delete())                      //returns Boolean value  
			{  
			System.out.println(f.getName() + " deleted");   //getting and printing the file name  
			}  
		}
		System.out.println("id"+id);
		try {
			List<FileItem> item = upload.parseRequest(request);
			for (FileItem fileItem : item) {
				System.out.println(fileItem.getName());
				fileItem.write(new File("C:\\Users\\Hp\\eclipse-workspace\\PhoneBookApp\\src\\main\\webapp\\images\\"+fileItem.getName()));
				String name = fileItem.getName();
				User user = new User(Integer.parseInt(id), name);
				uidi.updateUserImage(user);
				request.setAttribute("iname", name);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/views/card.jsp");
				dispatcher.forward(request, response);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
