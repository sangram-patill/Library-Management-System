<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>GST Sales Invoice</title>
    <!-- Add Bootstrap CSS link here -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            padding-top: 70px;
        }
        
            /* Custom Styles for the Navbar */
    .navbar {
      background-color: #007bff;
    }

    .navbar-brand {
      margin-right: 10px; /* Adjust the margin based on your preference */
    }

    .navbar-nav {
      margin-top: 5px; /* Adjust the margin based on your preference */
    }
    
    .navbar-brand {
      color: #fff;
      font-weight: bold;
    }

    .navbar-nav {
      justify-content: space-between;
    }

    .nav-item {
      position: relative;
    }
    .nav-item:hover .dropdown-menu {
      display: block;
    }

    .dropdown-menu {
      position: absolute;
      top: 100%;
      left: 0;
      display: none;
      background-color: #445069;
      box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
      border: none;
      border-radius: 2px;
    }

    .dropdown-menu {
        top: 100% !important;
        right: 0;
        left: auto;
      }

    
    .dropdown-item {
      color: #fff;
    }

    /* Custom Styles for the Content Area */
    .content {
        padding: 20px;
    }

    /* Adjusted styles for the table */
    .table {
        font-size: 14px; /* Adjust font size based on your preference */
        overflow-x: auto; /* Enable horizontal scrolling if needed */
        text-align: center;
    }

    .table th, .table td {
        white-space: nowrap; /* Prevent text wrapping in cells */
    }

    /* Adjust column widths as needed */
    .table th:nth-child(1),
    .table td:nth-child(1)
    
    /* Add more nth-child selectors for other columns as needed */
    {
        width: 80px; /* Adjust width based on your preference */
    }
    
    /* Adjust column widths as needed */
    .table th:nth-child(2),
    .table td:nth-child(2)
    
    /* Add more nth-child selectors for other columns as needed */
    {
        width: 120px; /* Adjust width based on your preference */
    }
    
    
    /* Adjust column widths as needed */
    .table th:nth-child(3),
    .table td:nth-child(3)
    
    /* Add more nth-child selectors for other columns as needed */
    {
        width: 165px; /* Adjust width based on your preference */
    }
    
    /* Adjust column widths as needed */
    .table th:nth-child(4),
    .table td:nth-child(4)
    
    /* Add more nth-child selectors for other columns as needed */
    {
        width: 130px; /* Adjust width based on your preference */
    }
    
    /* Adjust column widths as needed */
    
    .table th:nth-child(5),
    .table td:nth-child(5)
    
    /* Add more nth-child selectors for other columns as needed */
    {
        width: 80px; /* Adjust width based on your preference */
    }
    
    /* Adjust column widths as needed */
    
    .table th:nth-child(6),
    .table td:nth-child(6)
    
    /* Add more nth-child selectors for other columns as needed */
    {
        width: 140px; /* Adjust width based on your preference */
    }
    
    
    .table th:nth-child(7),
    .table td:nth-child(7),
    .table th:nth-child(8),
    .table td:nth-child(8)
    
    /* Add more nth-child selectors for other columns as needed */
    {
        width: 70px; /* Adjust width based on your preference */
    }

    
    .table th:nth-child(9),
    .table td:nth-child(9)
    /* Add more nth-child selectors for other columns as needed */
    {
        width: 165px; /* Adjust width based on your preference */
    }
    
    .col-md-12 table {
        width: 100%;
    }

    table ::placeholder {
      text-align: center;
    }
         
    ::-webkit-scrollbar{
    display: none;
    }
    
    /* Hide the up and down arrows for number input */
    input[type="number"]::-webkit-inner-spin-button,
    input[type="number"]::-webkit-outer-spin-button {
      -webkit-appearance: none;
      margin: 0;
    }

    input[type="number"] {
      -moz-appearance: textfield;
    }

    
    .chart-container {
      width: 100%;
      max-width: 475px; /* Adjust the max-width based on your design */
      margin: 20px 10px; /* Add margin for spacing */
      display: inline-block; /* Display charts side by side */
    }
    </style>
    
    <style>
     form {
       opacity: 0; /* Initially set the opacity to 0 for the fade-in effect */
       animation: fadeIn 1s ease-out forwards; /* Apply the fade-in animation */
     }

     @keyframes fadeIn {
       from {
         opacity: 0;
         transform: translateY(-20px);
       }
       to {
         opacity: 1;
         transform: translateY(0);
       }
     }

      #billSavedMessage {
            margin-top: 20px;
        }

        #savedBillsTable {
            margin-top: 20px;
        }
     
        
         header {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            text-align: center;
        }

        section {
            padding: 20px;
        }

        footer {
            background-color: #333;
            color: white;
            padding: 10px;
            text-align: center;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
        
         button {
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        
     /* Your other styles here */
   </style>
   
       <style>
        /* Hide the default dropdown arrow */
        select {
            -webkit-appearance: none; /* Remove default arrow in Chrome/Safari/Webkit Browsers */
            -moz-appearance: none; /* Remove default arrow in Firefox Browsers */
            appearance: none; /* Remove default arrow in IE/Edge and modern browsers */
            padding: 5px; /* Add padding to compensate for removal of arrow */
            border: 1px solid #ccc; /* Optional: Add border for styling */
        }

        /* Style the dropdown as needed */
        select:focus {
            outline: none; /* Remove default focus style */
            border-color: #007BFF; /* Optional: Change border color on focus */
        }
    </style>
    
</head>
<body>
    <!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
  <a class="navbar-brand" href="userdashboard.jsp"><img src="images/logow.png" height="60"></a>
  
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="userdashboard.jsp">Dashboard</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Purchase Invoice</a>
        <div class="dropdown-menu">
          <a class="dropdown-item" href="newgstpurchase.jsp">New GST Invoice</a>
          <a class="dropdown-item" href="newgstfreepurchase.jsp">New GST Free Invoice</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Sales Invoice</a>
        <div class="dropdown-menu">
          <a class="dropdown-item" href="newgstsales.jsp">New GST Invoice</a>
          <a class="dropdown-item" href="newgstfreesales.jsp">New GST Free Invoice</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="deliverychallan.jsp">Delivery Challan</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="transactions.jsp">Transactions</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="particularclientsale.jsp">Particular Client Sale</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">General Master</a>
        <div class="dropdown-menu">
          <a class="dropdown-item" href="partyreg.jsp">Parties Registration</a>
          <a class="dropdown-item" href="vendorreg.jsp">Vendor Registration</a>
          <a class="dropdown-item" href="productreg.jsp">Products Registration</a>
          <a class="dropdown-item" href="transporterreg.jsp">Transporter Registration</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="https://ewaybillgst.gov.in/" target="_blank">Eway Bill</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Reports</a>
        <div class="dropdown-menu">
          <a class="dropdown-item" href="#">Sales GST Invoice</a>
          <a class="dropdown-item" href="#">Sales GST Free Invoice</a>
          <a class="dropdown-item" href="#">Purchase GST Invoice</a>
          <a class="dropdown-item" href="#">Purchase GST Free Invoice</a>
          <a class="dropdown-item" href="#">Parties</a>
          <a class="dropdown-item" href="#">Products</a>
          <a class="dropdown-item" href="#">Transporters</a>
          <a class="dropdown-item" href="#">3 Months Total Tax party Wise</a>
        </div>
      </li>
    </ul>
  </div>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  
 <img id="userDropdown" src="images/user.png" height="50" alt="No Image Found..!!" style="position: static" onclick="toggleUserDropdown()">
  <div class="dropdown-menu dropdown-menu-right" id="userDropdownMenu">
    <a class="dropdown-item" href="profile.jsp">Profile</a>
    <a class="dropdown-item" href="userlogin.jsp">Logout</a>
  </div>

  
</nav>

    <!-- GST Bill Form -->
    <div class="container mt-4">
        <h2 class="text-center mb-4">GST Sales Bill</h2>
                    
            <div class="form-row">
                <form action="newgstsales.jsp" method="post" class="d-flex">
                    <div class="form-group col-md-6">
                        <label for="customerid">Customer ID</label>
                        <input type="text" class="form-control" onkeypress="return isNumber(event)" placeholder="Enter Customer ID" name="txt_sid">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="transporterid">Transporter ID</label>
                        <input type="text" class="form-control" onkeypress="return isNumber(event)" placeholder="Enter Transporter ID" name="txt_tid">
                    </div>
                    <div class="form-group col-md-4">
                        <input class="btn btn-primary ml-auto" style="margin-top:32px" type="submit" value="Search" name="submit">
                    </div>
                </form>
            </div>
        <hr style="height:2px; background-color: black;border:0;margin: 10px 0;">
            <%
                                    Connection cn=null;
                                    Statement st=null;
                                    String p_id="";
                                    String name="";
                                    String state="";
                                    String pinCode="";
                                    String gstNo ="";
                                    String district ="";
                                    String email ="";
                                    String panNo ="";
                                    String village ="";
                                    String contact ="";
                            try
                            {
                            Class.forName("com.mysql.jdbc.Driver"); 
                            cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mercantilexpert","root","root"); st= cn.createStatement();
                            String sql = "select * from partyreg where p_id ='"+request.getParameter("txt_sid")+"' "; 
                            ResultSet rs = st.executeQuery(sql);
                            while(rs.next())
                            {                                
                                p_id = rs.getString("p_id");
                                name =rs.getString("name");
                                state =rs.getString("state");
                                pinCode=rs.getString("pinCode");
                                gstNo=rs.getString("gstNo");
                                district = rs.getString("district");
                                email=rs.getString("email");
                                panNo=rs.getString("panNo");
                                village=rs.getString("village");
                                contact=rs.getString("contact");                                
                            }
                            }
                            catch(Exception ex)
                            {
                                out.println(ex.toString());
                            }
    

                        %>
                        
                        <%
                                    cn=null;
                                    st=null;
                                    String t_id="";
                                    String transporterName="";
                                    String vehicleNo="";
                                    
                            try
                            {
                            Class.forName("com.mysql.jdbc.Driver"); 
                            cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mercantilexpert","root","root"); st= cn.createStatement();
                            String sql = "select * from transporterreg where t_id ='"+request.getParameter("txt_tid")+"' "; 
                            ResultSet rs = st.executeQuery(sql);
                            while(rs.next())
                            {                                
                                t_id = rs.getString("t_id");
                                transporterName =rs.getString("transporterName");
                                vehicleNo =rs.getString("vehicleNo");                                                               
                            }
                            }
                            catch(Exception ex)
                            {
                                out.println(ex.toString());
                            }
    

                        %>
       <form name="newgstsales" action="newgstsales" method="post">     
            <div class="form-row">
                 <div class="form-group col-md-3">
                        <label for="customerid">Customer ID</label>
                        <input type="text" class="form-control" id="customerid" onkeypress="return isNumber(event)" value="<%=p_id%>" placeholder="Customer ID" name="customerid">
                 </div>
                <div class="form-group col-md-3">
                    <label for="billNo">Bill No</label>
                    <%                              
                     int billNo = 0;
                     cn = null;  
                     st=null;
                     Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mercantilexpert","root","root"); st= cn.createStatement();
                     String sql = "select * from newgstsales"; ResultSet rs = st.executeQuery(sql);
                     while(rs.next()) {  billNo = Integer.parseInt( rs.getString("billNo").toString()) + 1 ; }
                    %>
                                                                                                
                    <input type="text" class="form-control" id="billNo" value="<%=billNo%>" placeholder="Bill No" name="billNo" readonly>
                </div>
                <div class="form-group col-md-3">
                    <label for="invoiceNo">Invoice No</label>
                    <%                              
                     int invoiceNo = 0;
                     Connection cd = null; 
                     Statement sd=null;
                     Class.forName("com.mysql.jdbc.Driver");  
                     cd=DriverManager.getConnection("jdbc:mysql://localhost:3306/mercantilexpert","root","root"); 
                     sd= cd.createStatement();
                     String sqq = "select * from newgstsales"; 
                     ResultSet rl = st.executeQuery(sqq);
                     while(rl.next()) {  invoiceNo = Integer.parseInt( rl.getString("invoiceNo").toString()) + 1 ; }
                    %>
                    <input type="text" class="form-control" id="invoiceNo" value="<%=invoiceNo%>" placeholder="Invoice No" name="invoiceNo" readonly>
                </div>
                <div class="form-group col-md-3">
                    <label for="challanNo">Challan No</label>
                    <%                              
                     int challanNo = 0;
                     Connection cp = null; 
                     Statement sp=null;
                     Class.forName("com.mysql.jdbc.Driver");  
                     cp=DriverManager.getConnection("jdbc:mysql://localhost:3306/mercantilexpert","root","root"); 
                     sp= cd.createStatement();
                     String sqp = "select * from newgstsales"; 
                     ResultSet rp = st.executeQuery(sqp);
                     while(rp.next()) {  challanNo = Integer.parseInt( rp.getString("challanNo").toString()) + 1 ; }
                    %>
                    <input type="text" class="form-control" id="challanNo" value="<%=challanNo%>" placeholder="Challan No" name="challanNo" readonly>
                </div> 
            </div>
            
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label for="gstNo">GST No Of Customer</label>
                    <input type="text" class="form-control" id="gstNo" placeholder="GST No" value="<%=gstNo%>" name="gstNo">
                </div>
                <div class="form-group col-md-4">
                    <label for="panNo">PAN No</label>
                    <input type="text" class="form-control" id="panNo" placeholder="PAN No" value="<%=panNo%>" name="panNo">
                </div>
                <div class="form-group col-md-4">
                    <label for="customername">Customer Name</label>
                    <input type="text" class="form-control" id="customername" placeholder="Customer Name" value="<%=name%>" name="customername">
                </div>
                
            </div>
            
            <div class="form-row">
                <div class="form-group col-md-3">
                    <label for="city">City</label>
                    <input type="text" class="form-control" id="city" placeholder="City" value="<%=village%>" name="city">
                </div>
                <div class="form-group col-md-3">
                    <label for="district">District</label>
                    <input type="text" class="form-control" id="district" placeholder="District" value="<%=district%>" name="district">
                </div>
                <div class="form-group col-md-3">
                    <label for="state">State</label>
                    <input type="text" class="form-control" id="state" placeholder="State" value="<%=state%>" name="state">
                </div>
                <div class="form-group col-md-3">
                    <label for="pincode">Pin Code</label>
                    <input type="text" class="form-control" id="pincode" placeholder="Pin Code" value="<%=pinCode%>" name="pincode">
                </div>
                <div class="form-group col-md-3">
                    <label for="contactNo">Contact No</label>
                    <input type="text" class="form-control" id="contactNo" placeholder="Contact No" value="<%=contact%>" name="contactNo">
                </div>
                <div class="form-group col-md-3">
                    <label for="dateOfOrder">Date Of Order</label>
                    <input type="date" class="form-control" id="dateOfOrder" name="dateOfOrder">
                </div>
                <div class="form-group col-md-3">
                    <label for="dateOfDelivery">Date Of Delivery</label>
                    <input type="date" class="form-control" id="dateOfDelivery" name="dateOfDelivery">
                </div>
                <div class="form-group col-md-3">
                    <label for="billgenerateddate">Bill Generated Date</label>
                    <input type="date" class="form-control" id="billgenerateddate" name="billgenerateddate" readonly>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-12">
                    <label for="products">Products</label>
                    <table class="table table-bordered" id="productTable">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Product Code</th>
                                <th>Product Name</th>
                                <th>HSN</th>
                                <th>Quantity</th>
                                <th>Amount</th>
                                <th>CGST (%)</th>
                                <th>SGST (%)</th>
                                <th>Total Amount</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="product-row">
                                <td><input type="text" class="form-control product-id" placeholder="ID" name="productid"></td>
                                <td><input type="text" class="form-control product-code" placeholder="Product Code" name="productcode"></td>
                                <td><input type="text" class="form-control product-name" placeholder="Product Name" name="productname"></td>
                                <td><input type="number" class="form-control product-hsn" placeholder="HSN" name="producthsn"></td>
                                <td><input type="number" class="form-control product-quantity" placeholder="Quantity" name="productquantity"></td>
                                <td><input type="number" class="form-control product-amount" placeholder="Amount" name="productamount"></td>
                                <td>
                                    <select class="form-control product-cgst" name="productcgst">
                                        <!-- Add CGST options here -->
                                        <option value="5">5%</option>
                                        <option value="10">10%</option>
                                        <!-- Add more options if needed -->
                                    </select>
                                </td>
                                <td>
                                    <select class="form-control product-sgst" name="productsgst">
                                        <!-- Add SGST options here -->
                                        <option value="5">5%</option>
                                        <option value="10">10%</option>
                                        <!-- Add more options if needed -->
                                    </select>
                                </td>
                                <td><input type="number" class="form-control product-total-amount" placeholder="Total Amount" name="producttotalamount" readonly></td>
                                <td><button type="button" class="btn btn-danger" onclick="removeProduct(this)">Remove</button></td>
                            </tr>
                        </tbody>
                    </table>
                    <button type="button" class="btn btn-success" onclick="addProduct()">Add Product</button>
                </div>
                <!-- ... Other input fields ... -->
            </div>
           
            <div class="form-row">
                
                 <div class="form-group col-md-4">
                    <label for="totalquantity">Total Quantity</label>
                    <input type="number" class="form-control" id="totalquantity" placeholder="Total Quantity" name="totalquantity" readonly>
                </div>
                
                <div class="form-group col-md-4">
                    <label for="deliveryCharges">Delivery Charges</label>
                    <input type="number" class="form-control" id="deliveryCharges" placeholder="Delivery Charges" name="deliveryCharges" required>
                </div>
                <div class="form-group col-md-4">
                    <label for="totalAmount">Total Amount (Including GST & Delivery Charges)</label>
                    <input type="number" class="form-control" id="totalAmount" placeholder="Total Amount" name="totalAmount" readonly>
                </div>
            </div>
            
            <div class="form-row">
                
                 <div class="form-group col-md-4">
                    <label for="transporterid">Transporter ID</label>
                    <input type="number" class="form-control" id="transporterid" onkeypress="return isNumber(event)" value="<%=t_id%>" placeholder="Transporter ID" name="transporterid" required>
                </div>
                
                <div class="form-group col-md-4">
                    <label for="transportername">Transporter Name</label>
                    <input type="Text" class="form-control" id="transportername" value="<%=transporterName%>" placeholder="Transporter Name" name="transportername" required>
                </div>
                <div class="form-group col-md-4">
                        <label for="vehicleNo">Vehicle No</label>
                        <input type="text" class="form-control" id="vehicleNo" name="vehicleNo" value="<%=vehicleNo%>" placeholder="Vehicle No" name ="vehicleNo" required>
                </div>
            </div>
        <input class="btn btn-primary" type="submit" value="Save Bill" name="submit">
        </form>
    </div>
        <div id="savedBillsTable"></div>

<!--     Bill Preview Modal -->
<script>
        onclick="saveBill()"
    // Array to store saved bills
    var savedBills = [];

    // Function to save the bill
    function saveBill() {
        // Get form data and calculate total amount
        // (You can modify this part based on your actual data)
        var billData = {
            invoiceNo: '12345',
            dateOfOrder: '2023-11-30',
            totalAmount: '$130.00'
            // Add other relevant data
        };

        // Add the bill to the array
        savedBills.push(billData);

        // Display saved bills table
        displaySavedBillsTable();

        // Optionally, show a confirmation message
        alert("Bill saved successfully!");
    }

    // Function to display the saved bills table
    function displaySavedBillsTable() {
        var tableContent = '<header><h1>Yashwant Saw Mill</h1><p>Email: your.email@example.com | Contact: +1 123-456-7890 | Date: 2023-11-30</p></header>';
        tableContent += '<section><h2>Invoice</h2>';
        tableContent += '<p>Invoice No: ' + savedBills[0].invoiceNo + '</p>';
        tableContent += '<p>Date Of Order: ' + savedBills[0].dateOfOrder + '</p>';

        // Invoice Items Table (Replace this with your actual bill data)
        tableContent += '<table border="1" style="width: 100%;"><thead><tr><th>Item</th><th>Description</th><th>Quantity</th><th>Unit Price</th><th>Total</th></tr></thead><tbody>';
        tableContent += '<tr><td>1</td><td>Product A</td><td>2</td><td>$50.00</td><td>$100.00</td></tr>';
        tableContent += '<tr><td>2</td><td>Product B</td><td>1</td><td>$30.00</td><td>$30.00</td></tr>';
        tableContent += '</tbody></table>';

        tableContent += '<p>Total Amount: ' + savedBills[0].totalAmount + '</p>';

        // Print button
        tableContent += '<button onclick="printInvoice()">Print</button>';

        tableContent += '</section>';

        // Footer
        tableContent += '<footer>© 2023 Your Business Name. All rights reserved.</footer>';

        // Display the content
        document.body.innerHTML = tableContent;
    }

    // Function to print the invoice
    function printInvoice() {
        window.print();
    }
</script>



    <!-- Add Bootstrap JS and Popper.js -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.s5.2/js/bootstrap.min.js"></script>


     <script>
        // Get the current date in the format "YYYY-MM-DD"
        var currentDate = new Date().toISOString().split('T')[0];

        // Set the current date as the default value for the input field
        document.getElementById('billgenerateddate').value = currentDate;

        // Existing code...
    </script>
    
<script>
    // Function to calculate and display total amount including product totals and delivery charges
    function calculateTotalAmount() {
        var productRows = document.getElementsByClassName('product-row');
        var productTotalSum = 0;

        // Calculate the sum of product-total-amount values for each product
        for (var i = 0; i < productRows.length; i++) {
            calculateProductTotal(productRows[i]); // Calculate total for each product row
            var productTotal = parseFloat(productRows[i].querySelector('.product-total-amount').value) || 0;
            productTotalSum += productTotal;
        }

        var deliveryCharges = parseFloat(document.getElementById('deliveryCharges').value) || 0;

        // Calculate the total amount including product totals and delivery charges
        var totalAmount = productTotalSum + deliveryCharges;

        // Display the value in the "Total Amount" input field
        document.getElementById('totalAmount').value = totalAmount.toFixed(2);
    }

    // Attach the calculateTotalAmount function to relevant input fields
    document.getElementById('productTable').addEventListener('input', function (event) {
        if (event.target.classList.contains('form-control')) {
            calculateTotalAmount();
        }
    });

    // Attach the calculateTotalAmount function to deliveryCharges input field
    document.getElementById('deliveryCharges').addEventListener('input', calculateTotalAmount);
</script>

<script>
    // Function to calculate total amount for a specific product row
    function calculateProductTotal(productRow) {
        var quantity = parseFloat(productRow.querySelector('.product-quantity').value) || 0;
        var amount = parseFloat(productRow.querySelector('.product-amount').value) || 0;
        var cgst = parseFloat(productRow.querySelector('.product-cgst').value) || 0;
        var sgst = parseFloat(productRow.querySelector('.product-sgst').value) || 0;

        var totalAmount = quantity * amount * (1 + cgst / 100 + sgst / 100);

        productRow.querySelector('.product-total-amount').value = totalAmount.toFixed(2);
    }

    // Attach the calculateProductTotal function to relevant input fields
    document.getElementById('productTable').addEventListener('input', function (event) {
        if (event.target.classList.contains('form-control')) {
            var productRow = event.target.closest('.product-row');
            calculateProductTotal(productRow);
        }
    });
</script>

    
    
    <script>
        // Function to populate the bill preview modal with entered data
        function previewBill() {
    // Get form data and calculate total amount
    var gstNo = $('#gstNo').val();
    var panNo = $('#panNo').val();
    var address = $('#address').val();
    var contactNo = $('#contactNo').val();
    var invoiceNo = $('#invoiceNo').val();
    var challanNo = $('#challanNo').val();
    var products = $('#products').val();
    var dateOfOrder = $('#dateOfOrder').val();
    var dateOfDelivery = $('#dateOfDelivery').val();
    var subTotal = $('#subTotal').val();
    var cgst = $('#cgst').val();
    var sgst = $('#sgst').val();
    var deliveryCharges = $('#deliveryCharges').val();
    var totalAmount = $('#totalAmount').val();

    // Additional company details
    var companyDetails =
        <div>
            <img src="images/logow.png" height="60" alt="Company Logo">
            <h4>Company Name</h4>
            <p>Street, City, District, State, Pin Code</p>
            <p>Email: company@example.com</p>
            <p>Phone: +123 456 7890</p>
        </div>
    ;

    // Bill details
    var billDetails = 
        <div>
            <p><strong>Invoice No:</strong> ${invoiceNo}</p>
            <p><strong>Challan No:</strong> ${challanNo}</p>
            <p><strong>Products:</strong> ${products}</p>
            <p><strong>Date Of Order:</strong> ${dateOfOrder}</p>
            <p><strong>Date Of Delivery:</strong> ${dateOfDelivery}</p>
            <p><strong>Sub Total:</strong> ${subTotal}</p>
            <p><strong>CGST:</strong> ${cgst}</p>
            <p><strong>SGST:</strong> ${sgst}</p>
            <p><strong>Delivery Charges:</strong> ${deliveryCharges}</p>
            <p><strong>Total Amount:</strong> ${totalAmount}</p>
        </div>
    ;

    // Signature and company name
    var signatureAndCompanyName = 
        <div style="margin-top: 50px;">
            <div style="text-align: right;">
                <p>For Company Name</p>
                <!-- Leave some space for signature -->
                <div style="height: 50px;"></div>
            </div>
        </div>
    ;

    // Combine all parts
    var billPreviewContent = 
        <div style="display: flex; justify-content: space-between;">
            ${companyDetails}
            ${billDetails}
        </div>
        ${signatureAndCompanyName}
    ;

    $('#billPreviewContent').html(billPreviewContent);
}


        // Function to print the bill
        function printBill() {
            var printContents = $('#billPreviewContent').html();
            var originalContents = document.body.innerHTML;

            var printWindow = window.open('', '_blank');
            printWindow.document.write('<html><head><title>Print</title></head><body>');
            printWindow.document.write(printContents);
            printWindow.document.write('</body></html>');

            printWindow.document.close(); // necessary for IE >= 10
            printWindow.focus(); // necessary for IE >= 10

            printWindow.print();
            printWindow.close();

            document.body.innerHTML = originalContents;
        }



        // Attach previewBill function to the Generate Bill button
        $('#billPreviewModal').on('show.bs.modal', function () {
            previewBill();
            calculateTotalAmount();
        });

        // Attach calculateTotalAmount function to relevant input fields
        $('#subTotal, #cgst, #sgst, #deliveryCharges').on('input', calculateTotalAmount);
    </script>
    
    <script>
    // Add product row
    function addProduct() {
        var productTableBody = document.getElementById('productTable').getElementsByTagName('tbody')[0];
        var productRow = productTableBody.getElementsByClassName('product-row')[0].cloneNode(true);

        // Clear values in the cloned fields
        productRow.querySelectorAll('input').forEach(function (input) {
            input.value = '';
        });

        // Append the new product row
        productTableBody.appendChild(productRow);
    }

    // Remove product row
    function removeProduct(button) {
        var productTableBody = document.getElementById('productTable').getElementsByTagName('tbody')[0];
        var productRows = productTableBody.getElementsByClassName('product-row');

        // Ensure there is more than one row before removing
        if (productRows.length > 1) {
            var productRow = button.parentNode.parentNode;
            productTableBody.removeChild(productRow);
        } else {
            alert("Cannot remove the first product.");
        }
    }

    </script>
    
    <script>
  // Function to show/hide the user dropdown menu
  function toggleUserDropdown() {
    var dropdownMenu = document.getElementById('userDropdownMenu');
    dropdownMenu.classList.toggle('show');
  }

  // Close the user dropdown menu if the user clicks outside of it
  window.onclick = function (event) {
    if (!event.target.matches('#userDropdown')) {
      var dropdowns = document.getElementsByClassName('dropdown-menu');
      for (var i = 0; i < dropdowns.length; i++) {
        var openDropdown = dropdowns[i];
        if (openDropdown.classList.contains('show')) {
          openDropdown.classList.remove('show');
        }
      }
    }
  };
</script>

<script>
    // Function to calculate the total quantity
    function calculateTotalQuantity() {
        var productRows = document.getElementsByClassName('product-row');
        var totalQuantity = 0;

        // Calculate the sum of product quantities
        for (var i = 0; i < productRows.length; i++) {
            var quantity = parseFloat(productRows[i].querySelector('.product-quantity').value) || 0;
            totalQuantity += quantity;
        }

        // Display the total quantity in the "totalquantity" input field
        document.getElementById('totalquantity').value = totalQuantity;
    }

    // Attach the calculateTotalQuantity function to relevant input fields
    document.getElementById('productTable').addEventListener('input', function (event) {
        if (event.target.classList.contains('form-control')) {
            calculateTotalQuantity();
        }
    });

    // Initial calculation when the page loads
    calculateTotalQuantity();
</script>


</body>
</html>
