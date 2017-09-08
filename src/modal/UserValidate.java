package modal;

import dao.UserLoginInterface;
import dao.daoimp;

public class UserValidate {
	public boolean validateUser(int userName,String password) throws UserNotFoundException{
		
		UserLoginInterface uli = new daoimp();
		return uli.validateUser(userName, password);
		
		
	}
	public boolean registration(int usn,String name,String password,long phone) throws Exception{
		UserLoginInterface uli=new daoimp();
		return uli.registration(usn, name, password, phone);
	}
	public boolean selling(int usn,String book,String category,int cost,int edition){
		UserLoginInterface uli=new daoimp();
		return uli.selling(usn, book, category, cost,edition);
	}
	public boolean deleteBooks(int usn,String[] book){
		UserLoginInterface uli=new daoimp();
		return uli.deleteBooks(usn, book);
	}
	public boolean updateMobile(int usn,Long phone){
		UserLoginInterface uli=new daoimp();
		return uli.updateMobile(usn, phone);
	}
	public boolean updatePassword(int usn,Long phone,String password)throws Exception{
		UserLoginInterface uli=new daoimp();
		return uli.updatePassword(usn, phone,password);
	}
}
