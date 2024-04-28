<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('https://images.pexels.com/photos/3184639/pexels-photo-3184639.jpeg?cs=srgb&dl=pexels-fauxels-3184639.jpg&fm=jpg'); 
            background-size: cover;
            background-repeat: no-repeat;
            text-align: center;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            
        }
        .form-group {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .form-group label, .form-group input, .form-group select {
            flex: 1;
        }
        .form-group label {
            text-align: left;
        }
        input[type="text"], input[type="password"], select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #007BFF;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        a {
            text-decoration: none;
            color: #007BFF;
        }
        a:hover {
            text-decoration: underline;
        }
        h2 {
            color: blue;
        }
        .error {
            color: red;
        }
        img {
            max-width: 100%;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<br> <br>
    <div class="container">
        <h2>Register on Employee Task Management System</h2>
        <form action="RegisterServlet" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="Emp_ID">Employee ID:</label>
                <input type="text" id="Emp_ID" name="Emp_ID" required placeholder="must be numeric">
            </div>
            <div class="form-group">
                <label for="First_Name">First Name:</label>
                <input type="text" id="First_Name" name="First_Name" required placeholder="must be alphabetical">
            </div>
            <div class="form-group">
                <label for="Last_Name">Last Name:</label>
                <input type="text" id="Last_Name" name="Last_Name" required required placeholder="must be alphabetical">
            </div>
            <!--<div class="form-group">
                <label for="Street">Street:</label>
                <input type="text" id="Street" name "Street" required>
            </div>
            <div class="form-group">
                <label for="City">City:</label>
                <input type="text" id="City" name="City" required>
            </div>
            <div class="form-group">
                <label for="State">State:</label>
                <input type="text" id="State" name="State" required>
            </div>-->
            <div class="form-group">
                <label for="Date_Of_Joining">Date of Joining:</label>
                <!-- <input type="text" id="Date_of_joining" name="Date_of_joining" required placeholder="yyyy-mm-dd format">-->
                 <input type="date" name="Date_Of_Joining" required>
            </div>
            <div class="form-group">
                <label for="Phone_No">Phone Number:</label>
                <input type="text" id="Phone_No" name="Phone_No" required placeholder="must be 10 digit long">
            </div>
            <!--  <div class="form-group">
                <label for="Alternate_phone">Alternate Phone Number:</label>
                <input type="text" id="Alternate_phone" name="Alternate_phone" required>
            </div>-->
            <div class="form-group">
                <label for="Email">Email:</label>
                <input type="text" id="Email" name="Email" required placeholder="username@example.com">
            </div>
            <div class="form-group">
                <label for="Password">Password:</label>
                <input type="Password" id="Password" name="Password" required placeholder="must be at least 3 characters long">
            </div>
            <!-- <div class="form-group">
                <label for="role">Role:</label>
                <select id="role" name="role">
                    <option value="employee">Employee</option>
                    <option value="admin">Admin</option>
                </select>
            </div> -->
            <input type="submit" value="Register">
            <p>Already have an account? <a href="login.jsp">Login</a></p>
        </form>
        <p class="error" id="error-message"></p>
    </div>

    <script>
    function validateForm() {
        var empId = document.getElementById("Emp_ID").value;
        var firstName = document.getElementById("First_Name").value;
        var lastName = document.getElementById("Last_Name").value;
        var email = document.getElementById("Email").value;
        var password = document.getElementById("Password").value;
        var phone = document.getElementById("Phone_No").value;

        var errorElement = document.getElementById("error-message");
        errorElement.innerText = ""; 

        if (!/^\d+$/.test(empId)) {
            errorElement.innerText = "Employee ID must be numeric.";
            return false;
        }

        if (!/^[A-Za-z]+$/.test(firstName) || !/^[A-Za-z]+$/.test(lastName)) {
            errorElement.innerText = "Name must contain only alphabetic characters.";
            return false;
        }

        if (!/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email)) {
            errorElement.innerText = "Invalid email format.";
            return false;
        }

        if (password.length < 3) {
            errorElement.innerText = "Password must be at least 3 characters long.";
            return false;
        }

        if (phone.length !== 10) {
            errorElement.innerText = "Phone must be 10 digits long.";
            return false;
        }

        return true; 
    }
</script>

</body>
</html>



<!--  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
</head>
<body>
	<form action=register method=post>
		<label> Employee ID: </label>
		<input type=text name="Emp_id"> <br> <br>
		<label> First Name : </label>
		<input type=text name="First_Name"> <br> <br>
		<label> Last Name: </label>
		<input type=text name="Last_Name"> <br> <br>
		<label> Street: </label>
		<input type=text name="Street"> <br> <br>
		<label> City :</label>
		<input type=text name="City"> <br> <br>
		<label> State: </label>
		<input type=text name="State"> <br> <br>
		<label> Date of joining: </label>
		<input type=text name="Date_of_joining"> <br> <br>
		<label> Phone Number: </label>
		<input type=text name="Phone_No"> <br> <br>
		<label> Alternate Phone Number :</label>
		<input type=text name="Alternate_phone"> <br> <br>
		<label> Email:</label>
		<input type=text name="Email"> <br> <br>
		<label> password:</label>
		<input type="password" name="password"> <br> <br>
		<input type=submit value="Register"> 
		<select name="role">
    		<option value="employee">Employee</option>
    		<option value="admin">Admin</option>
		</select>
		Already have an account? <a href="login.jsp">Login</a>
	</form>
</body>
</html>-->


