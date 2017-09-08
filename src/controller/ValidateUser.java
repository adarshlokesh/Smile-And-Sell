package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modal.MobileException;
import modal.UserNotFoundException;
import modal.UserValidate;

/**
 * Servlet implementation class ValidateUser
 */
public class ValidateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ValidateUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher rd;
		HttpSession session = request.getSession();

		String from=request.getParameter("fromwhere");
		UserValidate uv = new UserValidate();
		
		
		if(from.equalsIgnoreCase("loginpage")){
		Integer usn = Integer.parseInt(request.getParameter("USN"));
		String password = request.getParameter("password");
		session.setAttribute("user", usn);
		
		try
		{
			
			if(uv.validateUser(usn, password))
			{
				
				rd = request.getRequestDispatcher("/welcome.jsp");
				rd.forward(request, response);
			}
		}
		catch(UserNotFoundException une){
			
			request.setAttribute("message", une);
			rd = request.getRequestDispatcher("/loginpage.jsp");
			rd.forward(request, response);
			
		}

	}
		if(from.equalsIgnoreCase("register")){
			 try{int usn = Integer.parseInt(request.getParameter("USN"));
			 String name = request.getParameter("name");
			 String password = request.getParameter("password");
			 long phone = Long.parseLong(request.getParameter("mobile"));
			 int us=usn;
			 int dig1=0;
			 while(us!=0){
				 dig1++;
				 us/=10;
			 }
			 if(dig1!=6){
				 String e=null;
				 throw new Exception(e);
			 }
			 long ph=phone;
			 int dig = 0;
			 while(ph!=0){
				 dig++;
				 ph/=10;
			 }
			 if(dig!=10){
				 String e = "Invalid Mobile No";
				throw new MobileException(e);
			 }
			 session.setAttribute("user", usn);

			boolean valid=uv.registration(usn, name,password,phone);
			if(valid){
				rd = request.getRequestDispatcher("/welcome.jsp");
				rd.forward(request, response);

			}
			 }
			 catch(MobileException e){
					request.setAttribute("message", e);
					rd = request.getRequestDispatcher("/register.jsp");
					rd.forward(request, response);

				}
			catch(Exception e){
				request.setAttribute("message", "Invalid Details");
				rd = request.getRequestDispatcher("/register.jsp");
				rd.forward(request, response);

			}
		}
		if(from.equalsIgnoreCase("sell")){
			try{int usn=(int)session.getAttribute("user");
			String book=request.getParameter("book");
			String category=request.getParameter("category");
			int cost=Integer.parseInt(request.getParameter("cost"));
			int edition=Integer.parseInt(request.getParameter("edition"));
			boolean valid=uv.selling(usn, book,category,cost,edition);
			if(valid){
				rd = request.getRequestDispatcher("/success.jsp");
				rd.forward(request, response);

			}
			else{
				rd = request.getRequestDispatcher("/failure.jsp");
				rd.forward(request, response);

			}
			}
			catch(Exception e){
				request.setAttribute("message", "Enter the cost and edition in numbers only");
				rd = request.getRequestDispatcher("/sell.jsp");
				rd.forward(request, response);
			}
		}
		if(from.equalsIgnoreCase("remove")){
			int usn=(int)session.getAttribute("user");
			String book[]= request.getParameterValues("book");
			boolean valid=uv.deleteBooks(usn, book);
			if(valid){
				rd = request.getRequestDispatcher("/success.jsp");
				rd.forward(request, response);

			}
			else{
				rd = request.getRequestDispatcher("/failure.jsp");
				rd.forward(request, response);

			}
		}
		if(from.equalsIgnoreCase("mobile")){
			try{int usn=(int)session.getAttribute("user");
			
			 long phone = Long.parseLong(request.getParameter("mobile"));
			 long ph=phone;
			 int dig = 0;
			 while(ph!=0){
				 dig++;
				 ph/=10;
			 }
			 if(dig!=10){
				 String e = "Invalid Mobile No";
				throw new MobileException(e);
			 }

			boolean valid= uv.updateMobile(usn,phone);
			if(valid){
				rd = request.getRequestDispatcher("/success.jsp");
				rd.forward(request, response);

			}
			 }
		
			 catch(MobileException e){
					request.setAttribute("message", e);
					rd = request.getRequestDispatcher("/mobile.jsp");
					rd.forward(request, response);

				}
			catch(Exception e){
				request.setAttribute("message", "Invalid Details");
				rd = request.getRequestDispatcher("/mobile.jsp");
				rd.forward(request, response);

			}
		}
		
		if(from.equalsIgnoreCase("forgot")){
			 try{int usn = Integer.parseInt(request.getParameter("USN"));
			 String password = request.getParameter("password");
			 long phone = Long.parseLong(request.getParameter("mobile"));
			 long ph=phone;
			 int dig = 0;
			 while(ph!=0){
				 dig++;
				 ph/=10;
			 }
			 if(dig!=10){
				 String e = "Invalid Mobile No";
				throw new MobileException(e);
			 }
			 session.setAttribute("user", usn);

			boolean valid=uv.updatePassword(usn,phone,password);
			if(valid){
				rd = request.getRequestDispatcher("/success.jsp");
				rd.forward(request, response);

			}
			else{
				rd = request.getRequestDispatcher("/failure.jsp");
				rd.forward(request, response);
			}
			 }
			 catch(MobileException e){
					request.setAttribute("message", e);
					rd = request.getRequestDispatcher("/forgot.jsp");
					rd.forward(request, response);

				}
			catch(Exception e){
				request.setAttribute("message", "Invalid Details");
				rd = request.getRequestDispatcher("/forgot.jsp");
				rd.forward(request, response);

			}
		}
	}

}
