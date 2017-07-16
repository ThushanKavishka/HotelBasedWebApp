# HotelBasedWebApp
This web application based on Spring 4.X web MVC, HTML5/CSS3 and JQuery/Ajax. The main functions are entering the details of the hotels and city based search including sorting.
STEPS:
1. Install Glassfish server properly in Netbeans
2. Go to services in  Netbeans, and create a new database called 'Hotels' in Java DB
3. In that database, create new table executing following query

	CREATE TABLE HOTEL (
    HOTEL_NAME VARCHAR (50),
    HOTEL_ADDRESS VARCHAR (50),
    HOTEL_LOCATION VARCHAR (50),
    PRIMARY KEY (HOTEL_ADDRESS)
            );

4. In 'Source Packages', there is one java class : "InsertRecordInDatabase.java" and  In 'Web Pages/WEB_INF/jsp',
 there are two jsp files : "index.jsp" , "secondPage.jsp"
5. Right click on Project Folder and click "Run"
6. This Project should run on "Mozilla Firefox", "Google Chrome" etc. instead of using "Internet Explorer",
because some features may not working on "Internet Explorer"
	 url = "http://localhost:8080/HotelManagement/index.htm"
