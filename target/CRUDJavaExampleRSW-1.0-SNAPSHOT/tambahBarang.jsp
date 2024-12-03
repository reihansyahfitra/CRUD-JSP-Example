<%-- 
    Document   : tambahBarang
    Created on : 17 Nov 2024, 23.18.05
    Author     : lesskind
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tambah Barang</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </head>
    <body class="container">
        <div class="d-flex justify-content-between align-items-center my-3">
            <h1 class="w-100">Tambah Barang</h1>
            <a class="btn btn-secondary" href="daftarBarang.jsp" role="button">Back to List</a>
        </div>
        <div class="card">
            <div class="card-body">
                <form method="post" action="BarangServlet" class="needs-validation" novalidate>
                    <div class="mb-3">
                        <label for="name" class="form-label">Nama barang:</label>
                        <input type="text" name="name" class="form-control" required/>
                        <div class="invalid-feedback">
                            Please enter the name of the item.
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="stock" class="form-label">Jumlah stock:</label>
                        <input type="number" name="stock" class="form-control" required/>
                        <div class="invalid-feedback">
                            Please enter the stock quantity.
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">Tambah</button>
                </form>
            </div>
        </div>
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
