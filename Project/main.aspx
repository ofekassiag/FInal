<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="Project.main" %>

<!DOCTYPE html>
<html>
<head>
    <title>Welcome to ChineseCitizensDB.com</title>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

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

    .container {
        max-width: 800px;
        margin: 50px auto;
        padding: 20px;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        text-align: center;
    }

    h1 {
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 20px;
        color: #e60012;
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

    mf {
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

    .features-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        margin-top: 30px;
    }

    .feature-box {
        width: 300px;
        padding: 20px;
        margin: 10px;
        background-color: #f9f9f9;
        border-radius: 4px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        text-align: center;
    }

    .feature-icon {
        font-size: 40px;
        margin-bottom: 10px;
    }

    .feature-title {
        font-size: 18px;
        font-weight: bold;
        margin-bottom: 10px;
    }

    .feature-description {
        font-size: 14px;
        color: #555;
    }

    .join-container {
        margin-top: 30px;
    }

    .join-text {
        font-size: 16px;
        margin-bottom: 10px;
    }

    .disclaimer-text {
        font-size: 12px;
        color: #777;
        margin-top: 30px;
    }
</style>

</head>
<body>
    <form runat="server">
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
            <h1>Welcome to ChineseCitizensDB.com</h1>
            <p class="intro-text">A comprehensive database dedicated to providing information and insights about Chinese citizens.</p>

            <div class="features-container">
                <div class="feature-box">
                    <span class="feature-icon">🔍</span>
                    <h2 class="feature-title">Comprehensive Database</h2>
                    <p class="feature-description">Explore a vast and constantly updated database of information related to Chinese citizens, including social credit scores, personal profiles, public records, and more.</p>
                </div>
                <div class="feature-box">
                    <span class="feature-icon">📚</span>
                    <h2 class="feature-title">Educational Resources</h2>
                    <p class="feature-description">Access articles, guides, and FAQs to gain a better understanding of the social credit system in China. Perfect for researchers, journalists, and curious individuals.</p>
                </div>
                <div class="feature-box">
                    <span class="feature-icon">🔒</span>
                    <h2 class="feature-title">Data Privacy</h2>
                    <p class="feature-description">We prioritize user privacy and ensure compliance with data protection laws. Your information is secure and confidential.</p>
                </div>
                <div class="feature-box">
                    <span class="feature-icon">🌐</span>
                    <h2 class="feature-title">User-friendly Interface</h2>
                    <p class="feature-description">Our website offers a seamless experience with an intuitive layout and navigation, making it easy to find the information you need.</p>
                </div>
            </div>

            <asp:Panel ID="not" runat="server" class="join-container">
                <p class="join-text">Join our community and start exploring the social credit system in China today!</p>
                <button class="signin-button"><asp:HyperLink ID="joinLink" runat="server" style="text-decoration:none; color: white" NavigateUrl="/Join.aspx">Join Now</asp:HyperLink></button>
            </asp:Panel>

            <p class="disclaimer-text">ChineseCitizensDB.com is an independent platform that aims to provide information and insights related to the social credit system in China. We do not have any affiliation with the Chinese government or any other organization involved in the implementation of the social credit system. The information provided on this website is for educational purposes only and should not be considered legal or official advice.</p>
        </div>
    </form>
</body>
</html>
