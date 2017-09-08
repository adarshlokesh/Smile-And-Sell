package modal;

public class MobileException extends Exception{
String message;
	
	public MobileException(String message) {
		
		this.message = message;
	}
	public String toString() {
		
		return message;
	}

}
