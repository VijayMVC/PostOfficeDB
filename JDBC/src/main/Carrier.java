package main;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import oracle.jdbc.OracleCallableStatement;
import oracle.jdbc.OracleTypes;

public class Carrier {

	public Carrier() {
	}
	
	
	public static void findReplcement(String cID) {
		if (cID.isEmpty() )
			throw new IllegalArgumentException("The parameters cannot be empty");
		try {
			CallableStatement stmt = Main.con.prepareCall(  "{call FindReplacement(?)}");
			stmt.setString(1, cID);
			stmt.executeUpdate();
			
		} catch (SQLException s) {
			print(s.getMessage());
		}

	}
	
	public static void markRouteStatus(String cID, String rID, String status) {
		if (cID.isEmpty() || rID.isEmpty() || status.isEmpty())
			throw new IllegalArgumentException("The parameters cannot be empty");
		try {
			CallableStatement stmt = Main.con.prepareCall(  "{call MarkRouteStatus(?,?,?)}");
			stmt.setString(1, cID);
			stmt.setString(2, rID);
			stmt.setString(3, status);
			stmt.executeUpdate();
			
		} catch (SQLException s) {
			print(s.getMessage());
		}

	}
	
	
	public static void markMailStatus(String cID, String mID, String status) {
		if (cID.isEmpty() || mID.isEmpty() || status.isEmpty())
			throw new IllegalArgumentException("The parameters cannot be empty");
		try {
			CallableStatement stmt = Main.con.prepareCall(  "{call MarkMailStatus(?,?,?)}");
			stmt.setString(1, cID);
			stmt.setString(2, mID);
			stmt.setString(3, status);
			stmt.executeUpdate();
			
		} catch (SQLException s) {
			print(s.getMessage());
		}

	}
	
	
	public static void getMailToDeliverByAddress(String cID, String address) {
		if (cID.isEmpty() || address.isEmpty())
			throw new IllegalArgumentException("The parameters cannot be empty");
		try {
			CallableStatement stmt = Main.con.prepareCall(  "{call GetMailToDeliverByAddress(?,?,?)}");
			stmt.setString(1, cID);
			stmt.setString(2, address);
			stmt.registerOutParameter(3, OracleTypes.CURSOR);
			
			stmt.execute();
			ResultSet rs = (ResultSet)stmt.getObject(3);
			
			while (rs.next()){
				print( "Route Id Id" +rs.getString(1));
				print("Mail Id" + rs.getString(2));
				print("Delivery Address" + rs.getString(3));
				
			}
		} catch (SQLException s) {
			print(s.getMessage());
		}

	}
	
	
	public static void getMailToDeliverByPostalCode(String cID, String pCode) {
		if (cID.isEmpty() || pCode.isEmpty())
			throw new IllegalArgumentException("The parameters cannot be empty");
		try {
			CallableStatement stmt = Main.con.prepareCall(  "{call GetMailToDeliverByPCode(?,?,?)}");
			stmt.setString(1, cID);
			stmt.setString(2, pCode);
			stmt.registerOutParameter(3, OracleTypes.CURSOR);
			
			stmt.execute();
			ResultSet rs = (ResultSet)stmt.getObject(3);
			
			while (rs.next()){
				print( "Route Id Id" +rs.getString(1));
				print("Mail Id" + rs.getString(2));
				print("Delivery Address" + rs.getString(3));
				
			}
		} catch (SQLException s) {
			print(s.getMessage());
		}

	}
	
	public static void getMailToDeliver(String cID) {
		if (cID.isEmpty())
			throw new IllegalArgumentException("The parameters cannot be empty");
		try {
			CallableStatement stmt = Main.con.prepareCall(  "{call GetMailToDeliver(?,?)}");
			stmt.setString(1, cID);
			stmt.registerOutParameter(2, OracleTypes.CURSOR);
			
			stmt.execute();
			ResultSet rs = (ResultSet)stmt.getObject(2);
			
			while (rs.next()){
				print( "Carrier Id" +rs.getString(1));
				print("Route Id" + rs.getString(2));
				print("Mail Id" + rs.getString(3));
				
			}
		} catch (SQLException s) {
			print(s.getMessage());
		}

	}

	public static void getCarrierRouteAndTruck(String cID) {
		if (cID.isEmpty())
			throw new IllegalArgumentException("The parameters cannot be empty");
		try {
			CallableStatement stmt = Main.con.prepareCall(  "{call GetRouteAndTruck(?,?)}");
			stmt.setString(1, cID);
			stmt.registerOutParameter(2, OracleTypes.CURSOR);
			
			stmt.execute();
			ResultSet rs = (ResultSet)stmt.getObject(2);
			
			while (rs.next()){
				print( "Route Id" +rs.getString(1));
				print("Vehicle Id" + rs.getString(2));
				
			}
		} catch (SQLException s) {
			print(s.getMessage());
		}

	}

	public static void print(String str) {

		System.out.println(str);
	}

}
