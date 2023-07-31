<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="photos.aspx.cs" Inherits="Project.photos" %>

<!DOCTYPE html>
<html>
<head>
  <title>Photo Gallery</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
      margin: auto;
      padding: 20px;
    }

    h1 {
      text-align: center;
      color: #e60012;
      margin: 4rem auto;
    }

    .navbar {
      position: fixed;
      top: 0;
      left: 0;
      right: 0;
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

    .gallery {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
      gap: 10px;
      justify-items: center;
      align-items: center;
      padding: 20px;
      margin-top: 60px; /* Add margin-top to push content below the navbar */
    }

    .gallery img {
      width: 100%;
      height: auto;
      object-fit: cover;
      border-radius: 5px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      transition: transform 0.3s ease;
    }

    .gallery img:hover {
      transform: scale(1.1);
    }

    .disclaimer-text {
      font-size: 12px;
      color: #777;
      margin-top: 30px;
    }
  </style>
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

    <h1>People's Gallery</h1>

    <div class="gallery">
      <img src="img/image1.png" alt="Image 1">
      <img src="img/image2.png" alt="Image 2">
      <img src="img/image3.png" alt="Image 3">
        </div>
        <div class="gallery">
      <img src="img/image4.png" alt="Image 4">
      <img src="img/image5.png" alt="Image 5">
      <img src="img/image6.png" alt="Image 6">
            </div>
        <div class="gallery">
      <img src="img/image7.png" alt="Image 7"> 
      <img src="img/image9.png" alt="Image 9">       
            
    </div>

    <div>
      <p class="disclaimer-text">ChineseCitizensDB.com is an independent platform that aims to provide information and insights related to the social credit system in China. We do not have any affiliation with the Chinese government or any other organization involved in the implementation of the social credit system. The information provided on this website is for educational purposes only and should not be considered legal or official advice.</p>
    </div>

  </form>
</body>
</html>
