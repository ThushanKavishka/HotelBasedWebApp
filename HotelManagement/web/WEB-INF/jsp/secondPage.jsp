<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hotel Management</title>
        <!-- CSS ===================== -->
        <!-- load bootstrap -->
        <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css"> 
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <script>
            $("#id_form2").validate();
        </script>
        <style>
            body { background-image: url("backgroudImage.jpg");
                   background-repeat:repeat-y;
                   background-size:cover;
            }
            .footer {
                position: absolute;
                right: 0;
                bottom: 0;
                left: 0;
                padding: 2rem;
                background-color: #cccccc;
                text-align: center;
            }
            #id_location {color: #ffffff;}
            .btn-primary {padding-right: 20px;}
        </style>
    </head>
    <body id="secondPage">
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">HOTEL MANAGEMENT SYSTEM</a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="index.htm">HOME</a></li>
                    <li><a href="secondPage.htm">SEARCH</a></li>
                </ul>
            </div>
        </nav>

        <div class="container">
            <div class="col-sm-8 col-sm-offset-2">

                <br>
                <div class="page-header"><center><b><h2>SEARCH BY LOCATION</h2></b></center></div>
                <br>
                <form  method="POST" id="id_form2">
                    <!-- HOTEL NAME -->
                    <div class="form-group">
                        <label id="id_location">HOTEL LOCATION:</label>
                        <input type="text" id="id_hSearch" name="hSearch" class="form-control"  required
                               data-validation="length alphanumeric" minlength="5">
                    </div>
                    <!-- SUBMIT BUTTON -->
                    <button type="submit" class="btn btn-primary">SEARCH</button>
                    <!-- RESET BUTTON -->
                    <button type="reset" class="btn btn-primary">RESET</button>
                    <!-- BACK BUTTON -->
                    <a href="index.htm"><button class="btn btn-primary">BACK</button></a>
                </form>
                <%
                    String search = request.getParameter("hSearch");

                    try {
                        /* Create string of connection url within specified format with machine
                name, port number and database name. Here machine name id localhost and 
                database name is Hotels. */
                        String connectionURL = "jdbc:derby://localhost:1527/Hotels";
                        // declare a connection by using Connection interface
                        Connection connection = null;
                        /* declare object of Statement interface that is used for executing sql 
                statements. */
                        Statement statement = null;
                        // declare a resultset that uses as a table for output data from tha table.
                        ResultSet rs = null;
                        // Load JBBC driver "com.mysql.jdbc.Driver"
                        Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
                        /* Create a connection by using getConnection() method that takes parameters 
                of string type connection url, user name and password to connect to database.*/
                        connection = DriverManager.getConnection(connectionURL, "thushan", "12345");
                        /* createStatement() is used for create statement object that is used for 
                sending sql statements to the specified database. */
                        statement = connection.createStatement();
                        // sql query to retrieve values from the secified table.

                        String QueryString = "SELECT * from HOTEL";
                        rs = statement.executeQuery(QueryString);
                %>
                <br><br>
                <table class="table">
                    <th class="active">HOTEL NAME</th>
                    <th class="active">HOTEL ADDRESS</th>
                    <th class="active">HOTEL LOCATION</th>
                        <%
                            while (rs.next()) {
                        %>

                    <%
                        if (rs.getString(3).equalsIgnoreCase(search)) {
                    %>

                    <tr class="active">
                        <td><%=rs.getString(1)%></td>
                        <td><%=rs.getString(2)%></td>
                        <td><%=rs.getString(3)%></td>
                    </tr>

                    <% }
                    %>

                    <% }
                    %>
                    <%
                        // close all the connections.
                        rs.close();
                        statement.close();
                        connection.close();
                    } catch (Exception ex) {
                    %>
                    <center><font size="+2" color="red">
                        <%
                                out.println("UNABLE TO CONNECT TO DATABASE");
                            }
                        %>
                    </center>
                </table>  
            </div></div>
        <div class="footer"> © 2017 Hotel Management.Inc. All Rights Reserved. </div>
    </body>
</html>

