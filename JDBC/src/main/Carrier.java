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

	public static void getCarrierRouteAndTruck(String cID) {
		if (cID.isEmpty())
			throw new IllegalArgumentException("The parameters cannot be empty");

		

		try {
			CallableStatement stmt = Main.con.prepareCall(  "{call GetMailByAddress2(?,?)}");
			stmt.setString(1, "01835 Eagle Crest Parkway");
			stmt.registerOutParameter(2, OracleTypes.CURSOR);
			
			stmt.execute();
			ResultSet rs = (ResultSet)stmt.getObject(2);
			
			while (rs.next()){
				print( "Mail Id" +rs.getString(1));
				print("Route Id" + rs.getString(2));
				print("PostalCode" + rs.getString(3));
				print("Weight" + rs.getString(3));
				
			}
		} catch (SQLException s) {
			print(s.getMessage());
		}

	}

	public static void print(String str) {

		System.out.println(str);
	}

}
