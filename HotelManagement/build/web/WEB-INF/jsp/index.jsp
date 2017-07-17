<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hotel Management</title>
        <!-- CSS ===================== -->
        <!-- load bootstrap -->
        <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css"> 
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script>
            $("#testform").validate();
        </script>
        <script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
        <style>
            body { background-image: url("backgroudImage.jpg");
                   background-repeat:repeat-y;
                   background-size:cover;
            }
            .form-group {color: #ffffff;}
            .footer {
                position: absolute;
                right: 0;
                bottom: 0.25;
                left: 0;
                padding: 2rem;
                background-color: #cccccc;
                text-align: center;
            }
        </style>
        <script>
            $(document).ready(function () {
                $("#testform").submit(function (e) {
                    // alert($("#testform").serialize());
                    var url = "index.htm";

                    $.ajax({
                        type: "POST",
                        url: url,
                        data: $("#testform").serialize(), // serializes the form's elements.
                        success: function (data)
                        {
                            alert("DETAILS HAVE BEEN SAVED SUCCESSFULLY"); // show response 
                            $('#id_hName').val('');
                            $('#id_address').val('');
                            $('#id_location2').val('');
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            alert(textStatus);
                            $('#id_hName').val('');
                            $('#id_address').val('');
                            $('#id_location2').val('');
                        }
                    });

                    e.preventDefault(); // avoid to execute the actual submit of the form.

                });
            });


        </script>
    </head>
    <body id="indexPage">
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
        <jsp:useBean id="insertRecord" scope="page" class="com.thushan.InsertRecordInDatabase" />
        <%
            String action = request.getParameter("action");
            if (action != null && action.equals("add")) {
                String name = request.getParameter("hName");
                String address = request.getParameter("hAddress");
                String location = request.getParameter("hLocation");

                insertRecord.saveRecord(name, address, location);
        %>
        <%
        } else {
        %>

        <div class="container">
            <div class="col-sm-8 col-sm-offset-2">
                <div class="page-header"><center><b><h2>ENTER DETAILS</h2></b></center></div>
                <form name="userform" action="index.htm" method="POST" id="testform">
                    <input name="action" value="add" type="hidden" />
                    <!-- HOTEL NAME -->
                    <div class="form-group">
                        <label>HOTEL NAME:</label>
                        <input type="text" id="id_hName" name="hName" class="form-control"  required
                               data-validation="length alphanumeric" minlength="5">
                    </div>

                    <!-- HOTEL ADDRESS -->
                    <div class="form-group">
                        <label>HOTEL ADDRESS:</label>
                        <input type="text" name="hAddress" id="id_address" class="form-control" required
                               data-validation="length alphanumeric" minlength="5">
                    </div>

                    <!-- HOTEL LOCATION -->
                    <div class="form-group">
                        <label>HOTEL LOCATION:</label>
                        <input type="text" name="hLocation" id="id_location2" class="form-control" required
                               data-validation="length alphanumeric" minlength="5">
                    </div>

                    <!-- SUBMIT BUTTON -->
                    <button type="submit" class="btn btn-primary">SUBMIT</button>
                    <!-- RESET BUTTON -->
                    <button type="reset" class="btn btn-primary">RESET</button>

                </form>

                <%
                    }
                %>

            </div></div> 
        <div class="footer">© 2017 Hotel Management.Inc. All Rights Reserved.</div>
    </body>
</html>
