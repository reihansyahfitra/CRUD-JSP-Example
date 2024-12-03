<%-- 
    Document   : editBarang
    Created on : 17 Nov 2024, 23.28.08
    Author     : lesskind
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="classes.JDBC, java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Barang</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </head>
    <body class="container">
        <div class="d-flex justify-content-between align-items-center my-3">
            <h1>Edit Barang</h1>
            <a class="btn btn-secondary" href="daftarBarang.jsp" role="button">Back to List</a>
        </div>
        <%
            String id = "";
            String name = "";
            String stock = "";
            JDBC db = new JDBC();
            if(db.isConnected){
                id = request.getParameter("id");
                ResultSet rs = db.getData("select * from barang where id = '" + id + "'");
                if(rs.next()){
                    name = rs.getString("name");
                    stock = rs.getString("stock");
                }
                db.disconnect();
            }else{
                out.print(db.message + "<br/>");
            }
        %>
        <form method="post" action="BarangServlet?m=upd&id=<%=id%>" class="needs-validation" novalidate>
            <div class="mb-3">
                <label for="name" class="form-label">Nama barang:</label>
                <input type="text" name="name" class="form-control" value="<%=name%>" required/>
                <label for="stock" class="form-label">Stock barang:</label>
                <input type="number" name="stock" class="form-control" value="<%=stock%>" required/>
                <div class="invalid-feedback">
                    Please enter the name of the item.
                </div>
            </div>
            <button type="submit" class="btn btn-primary">Edit</button>
        </form>
        <script>
            // Example starter JavaScript for disabling form submissions if there are invalid fields
            (function () {
                'use strict'

                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                var forms = document.querySelectorAll('.needs-validation')

                // Loop over them and prevent submission
                Array.prototype.slice.call(forms)
                    .forEach(function (form) {
                        form.addEventListener('submit', function (event) {
                            if (!form.checkValidity()) {
                                event.preventDefault()
                                event.stopPropagation()
                            }

                            form.classList.add('was-validated')
                        }, false)
                    })
            })()
        </script>
    </body>
</html>
