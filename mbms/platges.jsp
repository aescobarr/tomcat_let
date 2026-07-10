<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.* " %>
<%@ page import="java.io.*" %>

<%
try {
    String driver = "org.postgresql.Driver";
    String url = "jdbc:postgresql://" + System.getenv("SQL_DATABASE_HOST") + "/" + System.getenv("SQL_DATABASE");    
    String username = System.getenv("SQL_USER");
    String password = System.getenv("SQL_PASSWORD");
    String myDataField = null;
    String myQuery = "select json_agg(p) from (select * from platges_pnt t  order by name) p ";
    Connection myConnection = null;
    PreparedStatement myPreparedStatement = null;
    ResultSet myResultSet = null;
    Class.forName(driver).newInstance();
    myConnection = DriverManager.getConnection(url,username,password);
    System.out.println("Opened database successfully");
    myPreparedStatement = myConnection.prepareStatement(myQuery);
    ResultSet rs = myPreparedStatement.executeQuery();
	while(rs.next()){
        String valor = String. valueOf(rs.getObject(1));
		out.print(valor);
        myConnection.close();
	}
 

}
catch(ClassNotFoundException e){
    e.printStackTrace();
}
catch (SQLException ex) {
}
%>
