<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Bill Result</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="bg-light">
<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow-sm">
                <div class="card-body text-center">
                    <h3 class="card-title mb-4">Bill Summary</h3>
                    <p class="lead">Units Consumed: <strong><%= request.getAttribute("units") %></strong></p>
                    <p class="h4">Total Amount: <strong>Rs. <%= request.getAttribute("bill") %></strong></p>
                    <div class="mt-4">
                        <a href="index.jsp" class="btn btn-outline-primary">Calculate Again</a>
                        <a href="/" class="btn btn-link">Home</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
