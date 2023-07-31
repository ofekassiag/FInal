<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Project.Login" %>

<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
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
        overflow: hidden;
    }
    
    .navbar li {
        float: left;
    }
    
    .navbar li a {
        display: block;
        color: #fff;
        text-align: center;
        padding: 10px;
        text-decoration: none;
        transition: background-color 0.3s ease;
    }
    
    .navbar li a:hover {
        background-color: #b80c17;
    }
    .login-button:hover,
    .signin-button:hover {
        background-color: #b80c17;
    }

    .login-button {
        margin-right: 10px;
    }

    .intro-text {
        font-size: 16px;
        margin-bottom: 20px;
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
        visibility: visible;
    }

        .container {
            max-width: 500px;
            margin: auto;
            padding: 20px;
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
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-group input[type="text"],
        .form-group input[type="password"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-bottom: 2px solid #ddd;
            font-size: 14px;
            transition: border-color 0.3s ease;
        }

        .form-group input[type="text"]:focus,
        .form-group input[type="password"]:focus {
            border-color: #e60012;
            outline: none;
        }

        .submit-button {
            text-align: center;
            margin-top: 20px;
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
            font-size: 18px;
            font-weight: bold;
            color: #e60012;
            margin-top: 20px;
            text-align: center;
            padding: 10px;
            border: 2px solid #e60012;
            border-radius: 4px;
            background-color: #f5f5f5;
        }

        .disclaimer-text {
            font-size: 12px;
            color: #777;
            text-align: center;
        }
    </style>
</head>
<body>
    <header>
    <nav class="navbar">
        <ul>
            <li><a href="main.aspx">Home</a></li>
            <li><a href="/photos.aspx">People's Gallery</a></li>
            <li><a href="CitizenList.aspx">Citizens List</a></li>
            <li><a href="/addx.aspx">Register Citizens</a></li>
            <li><a href="/UserList.aspx">Users List</a></li>
        </ul>
        <div>
            <asp:HyperLink ID="signInLink" runat="server" CssClass="signin-button" style="text-decoration:none; color: white" NavigateUrl="/Signup.aspx">Sign In</asp:HyperLink>
        </div>
    </nav>
</header>
    <div class="container">
        <h1>Login</h1>
        <form id="form1" runat="server">
            <div class="form-group">
                <label for="ID">ID:</label>
                <input type="text" id="ID" runat="server" class="form-control" />
            </div>
            <div class="form-group">
                <label for="Password">Password:</label>
                <input type="password" id="Password" runat="server" class="form-control" />
            </div>
            <div class="submit-button">
                <asp:Button ID="Submit" runat="server" Text="Login" CssClass="submit" OnClick="Submit_Click" OnClientClick="return validateForm();" />
                <p><asp:Label ID="Label1" runat="server" Text="Label" CssClass="result-label" style="display: none;"></asp:Label></p>
            </div>
        </form>
        <p class="disclaimer-text">ChineseCitizensDB.com is an independent platform that aims to provide information and insights related to the social credit system in China. We do not have any affiliation with the Chinese government or any other organization involved in the implementation of the social credit system. The information provided on this website is for educational purposes only and should not be considered legal or official advice.</p>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript">
        function validateForm() {
            var id = document.getElementById('<%= ID.ClientID %>').value;
            var password = document.getElementById('<%= Password.ClientID %>').value;
            var label1 = document.getElementById('<%= Label1.ClientID %>');

            if (id === '' || password === '') {
                label1.innerText = 'Please fill in all the fields.';
                label1.style.display = 'block';
                return false;
            }

            return true;
        }
    </script>
</body>
</html>
