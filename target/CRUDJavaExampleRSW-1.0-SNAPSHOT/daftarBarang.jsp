<%-- 
    Document   : daftarBarang
    Created on : 17 Nov 2024, 23.08.45
    Author     : lesskind
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="classes.JDBC, java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manajemen Barang</title>
    </head>
    <link href="https://cdn.jsdelivr.net/npm/ @5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <body class="container">
        <div class="d-flex justify-content-between align-items-center my-3">
            <h1>Manajemen Barang</h1>
            <a class="btn btn-primary" href="tambahBarang.jsp" role="button">Add item</a>
        </div>
        <div class="table-responsive rounded">
            <table class="table table-striped table-hover table-bordered align-middle">
                <thead class="table-dark">
                    <tr>
                        <th scope="col" class="text-center">ID</th>
                        <th scope="col" class="text-center">Nama</th>
                        <th scope="col" class="text-center">Stock</th>
                        <th scope="col" class="text-center">Action</th>
                    </tr>
                </thead>
                <tbody class="table-group-divider">
                    <%
                        JDBC db = new JDBC();
                        if(db.isConnected){
                            ResultSet rs = db.getData("select * from barang");
                            int totalStock = 0;
                            String itemWithMostStock = "";
                            int maxStock = 0;
                            while(rs.next()){
                                int stock = rs.getInt("stock");
                                totalStock += stock;
                                if(stock > maxStock) {
                                    maxStock = stock;
                                    itemWithMostStock = rs.getString("name");
                                }
                                out.print("<tr>");
                                out.print("<td class='text-center'>" + rs.getInt("id") + "</td>");
                                out.print("<td class='text-center'>" + rs.getString("name") + "</td>");
                                out.print("<td class='text-center'>" + rs.getInt("stock") + "</td>");
                                out.print("<td class='d-flex justify-content-center'>" + 
                                    "<a class='btn btn-danger mx-1' role='button' href='BarangServlet?m=del&id=" + rs.getInt("id") + "'>Delete</a>" 
                                    + " &nbsp; <a class='btn btn-primary mx-1' role='button' href='editBarang.jsp?id=" + rs.getInt("id") + "'>Update</a>"
                                + "</td>");
                                out.print("</tr>");
                                
                            }
                            db.disconnect();
                    %>
                </tbody>
            </table>
        </div>
        <div class="mt-3 row border">
            <dt class="col-sm-3">Item with the most stock</dt>
            <dd class="col-sm-9">: <%= itemWithMostStock %> (Stock: <%= maxStock %>)</dd>
            <dt class="col-sm-3">Total stock of all items</dt>
            <dd class="col-sm-9">: <%= totalStock %></dd>
        </div>
                    <%
                        }else{
                            out.print(db.message+"<br/>");
                        }
                    %>
    </body>
</html>
