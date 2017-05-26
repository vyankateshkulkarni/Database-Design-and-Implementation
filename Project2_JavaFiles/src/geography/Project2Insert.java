package geography;

import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.regex.Pattern;

public class Project2Insert {
	
	

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try{
			
		
		Connection conn=null;
		Pattern COMMA_PATTERN = Pattern.compile(",(?=([^\"']*[\"'][^\"']*[\"'])*[^\"']*$)");
		FileReader fr=null;
		BufferedReader br=null;
		String CurrentLine=null;
		String parts[]=null;
		String city="cities.txt";
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/geography","root","");
		Statement stmt=conn.createStatement();
		stmt.execute("SET FOREIGN_KEY_CHECKS=0");
		 /*br = new BufferedReader(new FileReader(city));
		 while((CurrentLine=br.readLine())!=null)
			{
			 parts=COMMA_PATTERN.split(CurrentLine);
			 String cityname=parts[0].trim();
			 String statename=parts[1].trim();
			 String lat=parts[3].trim();
			 String lon=parts[4].trim();
			 String cpop=parts[2].trim();
			 stmt.executeUpdate("insert into city(CityName,StateName,Latitude,Longitude,CurrentPopulation) values("+cityname+","+statename+","+lat+","+lon+","+cpop+")");
				
		
			}
		 
		 
		 
		 br.close();*/
		 
		 
		/* String snc="state_adj_country.txt";
		 stmt.execute("SET FOREIGN_KEY_CHECKS=0");
		 br = new BufferedReader(new FileReader(snc));
		 while((CurrentLine=br.readLine())!=null)
			{
			 	parts=COMMA_PATTERN.split(CurrentLine);
			 	String stName=parts[0].trim();
			 	String cName=parts[1].trim();
			 	 stmt.executeUpdate("insert into state_neighbouringcountries(StateName,Neighbour_CountryName) values("+stName+","+cName+")");
					
			}
		 
		 br.close();
		 */
		
		/*String wbs="wb_state.txt";
		 stmt.execute("SET FOREIGN_KEY_CHECKS=0");
		 br = new BufferedReader(new FileReader(wbs));
		 while((CurrentLine=br.readLine())!=null)
			{
			 	parts=COMMA_PATTERN.split(CurrentLine);
			 	String wbName=parts[0].trim();
			 	String adjSName=parts[1].trim();
			 	 stmt.executeUpdate("insert into adjacentstate(WBName,Adj_StateName) values("+wbName+","+adjSName+")");
					
			}
		 
		 br.close();*/
		
		/*String cph="country_pop_history.txt";
		 stmt.execute("SET FOREIGN_KEY_CHECKS=0");
		 br = new BufferedReader(new FileReader(cph));
		 while((CurrentLine=br.readLine())!=null)
			{
			 	parts=COMMA_PATTERN.split(CurrentLine);
			 	String country=parts[0].trim();
			 	String year=parts[1].trim();
			 	String pop=parts[2].trim();
			 	 stmt.executeUpdate("insert into country_populationhistory(Year,CountryName,Population) values("+year+","+country+","+pop+")");
					
			}
		 
		 br.close();*/
	
		String sph="state_pop_history.txt";
		 stmt.execute("SET FOREIGN_KEY_CHECKS=0");
		 br = new BufferedReader(new FileReader(sph));
		 while((CurrentLine=br.readLine())!=null)
			{
			 	parts=COMMA_PATTERN.split(CurrentLine);
			 	String state=parts[0].trim();
			 	String year=parts[1].trim();
			 	String pop=parts[2].trim();
			 	 stmt.executeUpdate("insert into state_populationhistory(Year,StateName,Population) values("+year+","+state+","+pop+")");
					
			}
		 
		 br.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		

	}

}
