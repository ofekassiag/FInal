<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="Project.Signup" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        .navbar {
            background-color: #e60012;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .navbar ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            display: flex;
        }

        .navbar li {
            margin-left: 20px;
        }

        .navbar li a {
            color: #fff;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .navbar li a:hover {
            color: #b80c17;
        }
        .login-button,
        .signin-button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #e60012;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .login-button:hover,
        .signin-button:hover {
            background-color: #b80c17;
        }

        .login-button {
            margin-right: 10px;
        }      
        
        .container {
            max-width: 550px;
            margin: auto;
            padding: 100px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        
        h1 {
            font-size: 24px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
            color: #e60012;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        
        .form-group input[type="text"],
        .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            align-items: center;
        }
        
        .checkbox-group {
            display: flex;
            align-items: center;
            margin-top: 5px;
        }
        
        .checkbox-group label {
            display: flex;
            align-items: center;
            margin-left: 10px;
            cursor: pointer;
        }
        
        .checkbox-group input[type="radio"],
        .checkbox-group input[type="checkbox"] {
            -webkit-appearance: none;
            width: 20px;
            height: 20px;
            margin-right: 5px;
            border: 2px solid #ddd;
            border-radius: 50%;
            outline: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        
        .checkbox-group input[type="radio"]:checked,
        .checkbox-group input[type="checkbox"]:checked {
            background-color: #e60012;
            border-color: #e60012;
        }
        
        .checkbox-group label:hover {
            text-decoration: underline;
        }
        
        .submit-button {
            text-align: center;
            margin-top: 20px;
            position: relative;
        }
        
        .submit-button .submit {
            padding: 10px 20px;
            background-color: #e60012;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        
        .submit-button .submit:hover {
            background-color: #b80c17;
        }
        
        .result-label {
            visibility: hidden;
            font-size: 18px;
            font-weight: bold;
            color: #e60012;
            margin-top: 20px;
            text-align: center;
            padding: 10px;
            border: 2px solid #e60012;
            border-radius: 4px;
            background-color: #f5f5f5;
            position: absolute;
            top: 100%;
            left: 50%;
            transform: translateX(-50%);
        }
        .result-label1 {
            visibility: visible;
            font-size: 18px;
            font-weight: bold;
            color: #e60012;
            margin-top: 20px;
            text-align: center;
            padding: 10px;
            border: 2px solid #e60012;
            border-radius: 4px;
            background-color: #f5f5f5;
            position: absolute;
            top: 100%;
            left: 50%;
            transform: translateX(-50%);
        }
        .disclaimer {
            text-align: center;
            font-size: 12px;
            color: #777;
            max-width: 500px;
            padding: 20px;
            margin:auto;
        }
    </style>
    <script type="text/javascript">
        function validateForm() {
            var email = document.getElementById('Email').value;
            var id = document.getElementById('ID').value;
            var password = document.getElementById('Password').value;
            var confirmPassword = document.getElementById('ConPassword').value;
            var label1 = document.getElementById('Label1');

            if (email === '' || id === '' || password === '' || confirmPassword === '') {
                label1.innerText = 'Please fill in all the fields.';
                label1.style.display = 'block';
                label1.style.visibility = "visible";
                return false;
            }

            if (id.length !== 17) {
                label1.innerText = 'ID must contain 17 numbers.';
                label1.style.display = 'block';
                label1.style.visibility = "visible";
                return false;
            }

            if (!/^\d+$/.test(id)) {
                label1.innerText = 'ID must contain only numbers.';
                label1.style.display = 'block';
                label1.style.visibility = "visible";
                return false;
            }

            if (password.length < 6 || password.length > 8) {
                label1.innerText = 'Check password length (6-8 characters)';
                label1.style.display = 'block';
                label1.style.visibility = "visible";
                return false;
            }

            if (email.length < 2) {
                label1.innerText = 'Email must be a minimum of 2 characters.';
                label1.style.display = 'block';
                label1.style.visibility = "visible";
                return false;
            }

            if (password !== confirmPassword) {
                label1.innerText = 'Password and Confirm Password do not match.';
                label1.style.display = 'block';
                label1.style.visibility = "visible";
                return false;
            }

            label1.style.display = 'block';
            label1.style.visibility = "visible";
            return true;
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
<header>
    <nav class="navbar">
        <ul>
            <li><a href="main.aspx">Home</a></li>
            <li><a href="/photos.aspx">People's Gallery</a></li>
            <li><a href="CitizenList.aspx">Citizens List</a></li>
            <li><a href="/addx.aspx">Register Citizens</a></li>
        </ul>
        <div>
            <button class="login-button"><a href="/Login.aspx" style="text-decoration:none; color: white">Login</a></button>
        </div>
    </nav>
</header>
        <div class="container">
            <h1>Sign-Up</h1>
            <div class="form-group">
                <label for="Email">Email:</label>
                <input type="text" id="Email" runat="server" />
            </div>
            <div class="form-group">
                <label for="ID">I.D:</label>
                <input type="text" id="ID" runat="server" />
            </div>
            <div class="form-group">
                <label for="Age">Age:</label>
                <select id="Age" runat="server">
                    <option value=""></option>
                </select>
            </div>
            <div class="form-group">
                <label>Gender:</label>
                <div class="checkbox-group">
                    <input type="radio" id="GenderMale" name="gender" value="male" runat="server" />
                    <label for="GenderMale">Male</label>
                </div>
                <div class="checkbox-group">
                    <input type="radio" id="GenderFemale" name="gender" value="female" runat="server" />
                    <label for="GenderFemale">Female</label>
                </div>
            </div>
            <div class="form-group">
                <label for="Password">Password:</label>
                <input type="text" id="Password" runat="server" />
            </div>
            <div class="form-group">
                <label for="ConPassword">Confirm Password:</label>
                <input type="text" id="ConPassword" runat="server" />
            </div>
            <div class="submit-button">
                <asp:Button ID="Submit" runat="server" Text="Submit" CssClass="submit" OnClick="Submit_Click" OnClientClick="return validateForm();" />
                <p><asp:Label ID="Label1" runat="server" Text="Label" CssClass="result-label"></asp:Label></p>
            </div>
        </div>
        <div class="disclaimer">
         <p>ChineseCitizensDB.com is an independent platform that aims to provide information and insights related to the social credit system in China. We do not have any affiliation with the Chinese government or any other organization involved in the implementation of the social credit system.The information provided on this website is for educational purposes only and should not be considered legal or official advice.</p>
    </div>
            </form>
</body>
</html>