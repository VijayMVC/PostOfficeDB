package main;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

import oracle.jdbc.OracleTypes;

public class PostMaster {
	 static Scanner scanner = new Scanner(System.in);
	public PostMaster(){
		
		
	}
	
	public static void ViewAverageRouteTime() {
		try {
			CallableStatement stmt = Main.con.prepareCall(  "{call ViewAVGRouteTime(?)}");
			stmt.registerOutParameter(1, OracleTypes.CURSOR);
			
			stmt.execute();
			ResultSet rs = (ResultSet)stmt.getObject(1);
			print("Average time it takes for a route to be completed");
			while (rs.next()){
				print( "Average Days:" +rs.getString(1));
			}
		} catch (SQLException s) {
			print(s.getMessage());
		}

	}
	
	public static void GetNonEmptyRoutes() {
		try {
			CallableStatement stmt = Main.con.prepareCall(  "{call NonEmptyRoutes(?)}");
			stmt.registerOutParameter(1, OracleTypes.CURSOR);
			stmt.execute();
			ResultSet rs = (ResultSet)stmt.getObject(1);
			
			print("Routes that do not have either truck or carrier assigned to them");
			while (rs.next()){
				print( "Route\t" +rs.getString(1));
				
			}
		} catch (SQLException s) {
			print(s.getMessage());
		}

	}
	
	
	public static void UpdateCarrierSchedules() {
		
		
		try {
			CallableStatement stmt = Main.con.prepareCall(  "{call UpdateCarrierStatus}");
			stmt.executeUpdate();
			print("Updated Carrier Schedules");
		} catch (SQLException s) {
			
		}

	}
	
	public static void modifyMailRoute() {
        /* Variables to save user input */
        String routeId = "",
               decision = "",
               postalCode = "";
        /* Get user input */
        System.out.print("Enter route id: ");
        routeId = scanner.nextLine();
        try {
            CallableStatement stmt = Main.con.prepareCall(  "{call GetPostalCodesByRoute(?,?)}");
            stmt.setString(1, routeId);
            stmt.registerOutParameter(2, OracleTypes.CURSOR);
            stmt.execute();    
            ResultSet rs = (ResultSet)stmt.getObject(2);
            System.out.println("Listing all postal codes with route: " + routeId);
            while (rs.next()){
                System.out.println(rs.getString(1));               
            }
            System.out.print("Enter your choice (add/remove): ");
            decision = scanner.nextLine();
 
            System.out.print("Enter postal code (Format: [(H47/H7T) #X#]: ");
            postalCode = scanner.nextLine();
            switch (decision){
            case "add":
                stmt = Main.con.prepareCall("{call insertPostalCode(?,?)}");
                stmt.setString(1, postalCode);
                stmt.setString(2, routeId);
                stmt.execute();
                break;
           
            case "remove":
                stmt = Main.con.prepareCall("{call delRoute(?,?)}");
                stmt.setString(1, postalCode);
                stmt.setString(2, routeId);
                stmt.execute();
                break;
               
            default:
                System.out.println("Invalid decision");
                break;
            }
        }
        catch (SQLException s) {
            System.out.println(s.getMessage());
        }
    }
   
    public static void addEmployee() {
        /* Variables to save user input */
        String role = "",
               firstName = "",
               lastName = "",
               phone = "",
               email = "",
               scheduleId = "",
               availability = "";      
        int id = 0;
        /* Get user input */
        System.out.print("Role? (Clerk/Carrier/PostMaster): ");
        role = scanner.nextLine();
       
        System.out.print("First name: ");
        firstName = scanner.nextLine();
 
        System.out.print("Last name: ");
        lastName = scanner.nextLine();
       
        System.out.print("Phone number(###-###-####): ");
        phone = scanner.nextLine();
       
        System.out.print("Email: ");
        email = scanner.nextLine();
               
        System.out.print("Schedule ID: ");
        scheduleId= scanner.nextLine();
       
        System.out.print("Availability (AVAILABLE, UNAVAILABLE, SICK, OFFDUTY, ONVACATION, ONDUTY: ");
        availability = scanner.nextLine();
        System.out.println();
       
        try {
            CallableStatement stmt = Main.con.prepareCall(  "{call addEmployee(?, ?, ?, ?, ?, ?, ?)}");
            stmt.setString(1, role);
            stmt.setString(2, firstName);
            stmt.setString(3, lastName);
            stmt.setString(4, phone);
            stmt.setString(5, email);
            stmt.setString(6, scheduleId);
            stmt.setString(7, availability);
            stmt.execute();
        }
        catch (SQLException s) {
            System.out.println(s.getMessage());
        }
    }
   
    public static void removeEmployee() {
        /* Variables to save user input */
        String employeeId = "",
               prefix = "",
               beforeDelete = "";
       
        System.out.print("Employee id: ");
        employeeId = scanner.nextLine();
       
        try {
            CallableStatement stmt = Main.con.prepareCall(  "{call delEmployee(?)}");
            stmt.setString(1, employeeId);
            stmt.execute();
        }
        catch (SQLException s) {
            System.out.println(s.getMessage());
        }
    }
   
    public static void createMailRoute() {
        /* Variables to save user input */
        String routeName = "";
        int id = 0;
       
        System.out.println("Enter a route name: ");
        routeName = scanner.nextLine();
       
        try {
            CallableStatement stmt = Main.con.prepareCall(  "{call createRoute(?)}");
            stmt.setString(1, routeName);
            stmt.execute();
            System.out.println("Route created");
        }
        catch (SQLException s) {
            System.out.println(s.getMessage());
        }
    }
   
    public static void setMailRoute() {
        /* Variables to save user input */
        String routeName = "";
        int id = 0;
       
        System.out.println("Enter a route name: ");
        routeName = scanner.next();
       
        try {
            String sequence = "select RouteIdSequence.NEXTVAL from dual";
            PreparedStatement pst = Main.con.prepareStatement(sequence);
            ResultSet rs = pst.executeQuery();
            rs.next();
            id = rs.getInt(1);
            CallableStatement stmt = Main.con.prepareCall(  "INSERT INTO ROUTES VALUES (?, ?, ?, ?, ?)");
            stmt.setString(1, String.valueOf(id));
            stmt.setString(2, routeName);
            stmt.setString(3, null);
            stmt.setString(4, null);
            stmt.setString(5, null);
            stmt.execute();
            System.out.println("Route created");
        }
        catch (SQLException s) {
            System.out.println(s.getMessage());
        }
    }
	
	public static void print(String str) {

		System.out.println(str);
	}
}
