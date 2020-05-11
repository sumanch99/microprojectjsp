package user_pkg;
public class User
{
	private String name,email,password,username;
	
	public User(){}

	public String getName(){return name;}
	public String getUsername(){return username;}
	public String getEmail(){return email;}
	public String getPassword(){return password;}

	public void setName(String a){name=a;}
	public void setUsername(String a){username=a;}
	public void setEmail(String a){email=a;}
	public void setPassword(String a){password=a;}

}