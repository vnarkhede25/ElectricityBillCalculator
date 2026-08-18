<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Electricity Bill Calculator</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body class="bg-light">
<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h3 class="card-title mb-4">Electricity Bill Calculator</h3>
                    <form method="post" action="calculate" id="billForm">
                        <div class="mb-3">
                            <label for="units" class="form-label">Units Consumed</label>
                            <input type="number" step="0.01" min="0" class="form-control" id="units" name="units" required />
                        </div>
                        <div id="error" class="text-danger mb-3">
                            <%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
                        </div>
                        <button type="submit" class="btn btn-primary">Calculate</button>
                        <button type="reset" class="btn btn-secondary ms-2">Reset</button>
                    </form>
                    <hr/>
                    <h6>Slab Rates</h6>
                    <ul>
                        <li>First 50 units – Rs. 3.50/unit</li>
                        <li>Next 100 units – Rs. 4.00/unit</li>
                        <li>Next 100 units – Rs. 5.20/unit</li>
                        <li>Units above 250 – Rs. 6.50/unit</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
