package main;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import oracle.jdbc.OracleTypes;
import java.util.Scanner;

public class Clerk {
	static Scanner scanner = new Scanner(System.in);
	
	public static void addMail() {
		/* Variables to save user input */
		String registration = "",
			   postalCode = "",
			   ReturnAddress = "",
			   deliveryAddress = "",
			   sender = "",
			   receiver;
		
		int weight = 0,
			 totalPostage = 0;
		
		/* Get user input */
		System.out.print("Registration? (registered/unregistered): ");
		registration = scanner.next();
		System.out.println(registration.length());
		scanner.nextLine();
		
		System.out.print("Postal Code: ");
		postalCode = scanner.nextLine();
		System.out.println(postalCode.length());

		System.out.print("Return address: ");
		ReturnAddress = scanner.nextLine();
		System.out.println(ReturnAddress.length());
		
		System.out.print("Delivery address: ");
		deliveryAddress = scanner.nextLine();
		System.out.println(deliveryAddress.length());
		
		System.out.print("Weight (in grams): ");
		weight = scanner.nextInt();
		System.out.println();

		System.out.print("Total postage (in grams): ");
		totalPostage = scanner.nextInt();
		System.out.println();

		scanner.nextLine();
		System.out.print("Sender name: ");
		sender = scanner.nextLine();
		System.out.println(sender.length());

		System.out.print("Receiver name: ");
		receiver = scanner.nextLine();
		System.out.println();

		try {
			CallableStatement stmt = Main.con.prepareCall(  "{call ClerkAddMail(?,?,?,?,?,?,?,?)}");
			stmt.setString(1, registration);
			stmt.setString(2, postalCode);
			stmt.setString(3, ReturnAddress);
			stmt.setString(4, deliveryAddress);
			stmt.setInt(5, weight);
			stmt.setInt(6, totalPostage);
			stmt.setString(7, sender);
			stmt.setString(8, receiver);

			stmt.execute();		
				
		}
		catch (SQLException s) {
			System.out.println(s.getMessage());
		}

	}
	
	public static void CalculateTotalCost() {
		String mailId = "";
		double totalCost = 0;
		System.out.print("Mail Id: ");
		mailId = scanner.next();
		
		try {
			CallableStatement stmt = Main.con.prepareCall(  "{{? = call CalculateTotalCost(?)}");
			stmt.registerOutParameter(1, Types.DOUBLE);
			stmt.setString(2, mailId);	
			stmt.execute();
			totalCost = stmt.getDouble(1);
			System.out.println("Your total cost is: $" + totalCost);
				
		}
		catch (SQLException s) {
			System.out.println(s.getMessage());
		}
		
	}
	
	public static void getMailByRoute() {
		String routeId = "";
		System.out.print("Route Id: ");
		routeId = scanner.next();

		

		try {
			CallableStatement stmt = Main.con.prepareCall(  "{call GetMailByRoute(?,?)}");
			stmt.setString(1, routeId);
			stmt.registerOutParameter(2, OracleTypes.CURSOR);
			
			stmt.execute();
			ResultSet rs = (ResultSet)stmt.getObject(2);
			
			while (rs.next()){
				System.out.println("Mail Id" +rs.getString(1));
				System.out.println("Route Id" + rs.getString(2));
				System.out.println("PostalCode" + rs.getString(3));
				System.out.println("Weight" + rs.getString(3));
				
			}
		} catch (SQLException s) {
			System.out.println(s.getMessage());
		}

	}
	
	public static void GetMailByPostalCode() {
		String postalCode = "";
		System.out.print("Postal code: ");
		postalCode = scanner.nextLine();

		try {
			CallableStatement stmt = Main.con.prepareCall(  "{call GetMailByPostalCode(?,?)}");
			stmt.setString(1, postalCode);
			stmt.registerOutParameter(2, OracleTypes.CURSOR);
			
			stmt.execute();
			ResultSet rs = (ResultSet)stmt.getObject(2);
			
			while (rs.next()){
				System.out.println("Mail Id: " +rs.getString(1));
				System.out.println("Route Id: " + rs.getString(2));
				System.out.println("PostalCode: " + rs.getString(3));
				System.out.println("Weight: " + rs.getString(3));
				
			}
		} catch (SQLException s) {
			System.out.println(s.getMessage());
		}

	}
	
	public static void GetMailBySenderName() {
		String sender = "";
		System.out.print("Sender name: ");
		sender = scanner.next();

		try {
			CallableStatement stmt = Main.con.prepareCall(  "{call GetMailBySenderName(?,?)}");
			stmt.setString(1, sender);
			stmt.registerOutParameter(2, OracleTypes.CURSOR);
			
			stmt.execute();
			ResultSet rs = (ResultSet)stmt.getObject(2);
			
			while (rs.next()){
				System.out.println("Mail Id: " +rs.getString(1));
				System.out.println("Route Id: " + rs.getString(2));
				System.out.println("PostalCode: " + rs.getString(3));
				System.out.println("Weight: " + rs.getString(3));
				
			}
		} catch (SQLException s) {
			System.out.println(s.getMessage());
		}

	}
	
	
}