package geography;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class Part3Q2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Connection conn=null;
		try{
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/geography","root","");
		Statement stmt=conn.createStatement();
		Statement stmt1=conn.createStatement();
		Statement stmt2=conn.createStatement();
		stmt1.execute("SET FOREIGN_KEY_CHECKS=0");
		stmt2.execute("SET FOREIGN_KEY_CHECKS=0");
		
		System.out.println("Add new estimate to the population history of a country and a state");
		System.out.println("1: Estimate Country Population");
		System.out.println("2: Estimate State Population");
		System.out.println("enter you choice:");
		Scanner scan=new Scanner(System.in);
		int choice=scan.nextInt();
		int flag=0;
		switch(choice)
		{
			case 1:System.out.println("Enter year:");
					int year=scan.nextInt();
					System.out.println("Enter Country Name:");
					String countryname=scan.next();
					System.out.println("Enter Population:");
					int pop=scan.nextInt();
					ResultSet rs=stmt.executeQuery("select * from country_populationhistory");
					while(rs.next())
						
					{
						if((year==rs.getInt(1)) &&  (countryname.equals(rs.getString(2))) && (pop==rs.getInt(3)) ) 
						{
							System.out.println("Duplicate Entry..");
							
						}
						else 
						{
							flag=1;
						}
						
					}
					if(flag==1)
					{
						rs=stmt.executeQuery("select MAX(year),CountryNames from country_Populationhistory");
						rs.next();
							int maxy=rs.getInt(1);
							String ctry=rs.getString(2);
							
							ResultSet rs2=stmt1.executeQuery("select * from country_populationhistory");
							System.out.println("CURRENTCOUNTRY POPULATION HISTORY\n");
							while(rs2.next())
							{
								System.out.println(rs2.getInt(1)+" | "+rs2.getString(2)+" | "+rs2.getInt(3));
							}
						if(year>=maxy+1 && (countryname!=ctry))
						{
							
							
							stmt2.executeUpdate("insert into country_populationhistory(Year,CountryName,Population) values("+year+",'"+countryname+"',"+pop+")");
							System.out.println("New population estimation entered successfully!!!");
							
						
						
							ResultSet rs1=stmt1.executeQuery("select * from country_populationhistory");
							System.out.println("NEW COUNTRY POPULATION HISTORY\n");
							while(rs1.next())
							{
								System.out.println(rs1.getInt(1)+" | "+rs1.getString(2)+" | "+rs1.getInt(3));
							}
						}
						else
						{
							System.out.println("Duplicate record");
						}
					}
					
					
					
				break;
			case 2:
				
			System.out.println("Enter year:");
			int syear=scan.nextInt();
			System.out.println("Enter State Name:");
			String statename=scan.next();
			System.out.println("Enter Population:");
			int spop=scan.nextInt();
			 rs=stmt.executeQuery("select * from state_populationhistory");
			while(rs.next())
				
			{
				if((syear==rs.getInt(1)) &&  (statename.equals(rs.getString(2))) && (spop==rs.getInt(3)) ) 
				{
					System.out.println("Duplicate Entry..");
					
				}
				else 
				{
					flag=1;
				}
				
			}
			if(flag==1)
			{
				rs=stmt.executeQuery("select MAX(year),StateName from state_Populationhistory");
				rs.next();
					int maxy=rs.getInt(1);
					String st=rs.getString(2);
				if(syear>=maxy+1 && (statename!=st))
					
				{
					rs=stmt.executeQuery("select * from state_populationhistory");
					System.out.println("CURRENT STATE POPULATION HISTORY\n");
					while(rs.next())
					{
						System.out.println(rs.getInt(1)+" | "+rs.getString(2)+" | "+rs.getInt(3));
					}
					stmt.executeUpdate("insert into state_populationhistory(Year,StateName,Population) values("+syear+",'"+statename+"',"+spop+")");
					System.out.println("New population estimation entered successfully!!!");
					rs=stmt.executeQuery("select * from state_populationhistory");
					System.out.println("NEW STATE POPULATION HISTORY\n");
					while(rs.next())
					{
						System.out.println(rs.getInt(1)+" | "+rs.getString(2)+" | "+rs.getInt(3));
					}
				}
				else
				{
					System.out.println("Duplicate record..");
				}
			}
			
			
			
		break;

	
			
		}
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	

	}

}
