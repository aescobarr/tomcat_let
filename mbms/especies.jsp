<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.* " %>
<%@ page import="java.io.*" %>

<%
try {
    String driver = "org.postgresql.Driver";
    String url = "jdbc:postgresql://" + System.getenv("SQL_DATABASE_HOST") + "/" + System.getenv("SQL_DATABASE");
    String username = System.getenv("SQL_USER");
    String password = System.getenv("SQL_PASSWORD");
    String myDataField = null;
    String myQuery = "select json_agg(p) from (select distinct nombre_especie, case when nom_comu_cat is not null then nombre_especie || ' (' || nom_comu_cat ||')' else nombre_especie end as nom from samples_especie where nombre_especie is not null order by nom) p";
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
