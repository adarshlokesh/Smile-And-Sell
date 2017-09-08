package dao;

import modal.UserNotFoundException;

public interface UserLoginInterface {
	public boolean validateUser(int userName,String password) throws UserNotFoundException;
	public boolean registration(int usn,String name,String password,long phone)throws Exception;
	public boolean selling(int usn, String book, String category, int cost,
			int edition);
	public boolean deleteBooks(int usn,String[] book);
	public boolean updateMobile(int usn,long phone);
	public boolean updatePassword(int usn, Long phone, String password)throws Exception;
}
