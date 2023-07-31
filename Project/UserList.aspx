<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="Project.UserList" %>

<!DOCTYPE html>
<html>
<head>
    <title>User List</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
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
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            border-radius: 4px;
            border: 1px solid #e60012;
        }
        user-gridview {
            background-color: #e60012;
        }

        h1 {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
            color: #e60012;
            font-family: "Courier New";
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 30px;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
        }

        th {
            background-color: #e60012;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .emoji {
            font-size: 20px;
            margin-left: 5px;
        }
        .disclaimer-text {
            font-size: 12px;
            color: #777;
            margin-top: 10px;
        }
    </style>
    <script>
        // Your JavaScript code here
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
                    <li><a href="/UserList.aspx">Users List</a></li>
                </ul>
                <div>
                    <asp:Button ID="logout" runat="server" CssClass="signin-button" Text="Logout" OnClick="Logout_Click" />
                    <asp:HyperLink ID="loginLink" runat="server" CssClass="login-button" style="text-decoration:none; color: white" NavigateUrl="/Login.aspx">Login</asp:HyperLink>
                    <asp:HyperLink ID="signInLink" runat="server" CssClass="signin-button" style="text-decoration:none; color: white" NavigateUrl="/Signup.aspx">Sign In</asp:HyperLink>
                </div>
            </nav>
        </header>
        <div class="container">
            <h1>User List<span class="emoji">📋</span></h1>
            <p class="disclaimer-text">To search for a User, press "Control + F" and type the I.D.</p>
            <asp:GridView runat="server" ID="UserGridView" CssClass="user-gridview" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField HeaderText="I.D" DataField="identification" />
                    <asp:BoundField HeaderText="Email" DataField="email" />
                    <asp:BoundField HeaderText="Password" DataField="password" />
                    <asp:BoundField HeaderText="Age" DataField="age" />
                    <asp:BoundField HeaderText="Gender" DataField="gender" />
                </Columns>
            </asp:GridView>
            <p class="disclaimer-text">ChineseCitizensDB.com is an independent platform that aims to provide information and insights related to the social credit system in China. We do not have any affiliation with the Chinese government or any other organization involved in the implementation of the social credit system. The information provided on this website is for educational purposes only and should not be considered legal or official advice.</p>
        </div>
    </form>
</body>
</html>
