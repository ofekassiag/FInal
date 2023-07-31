<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addx.aspx.cs" Inherits="Project.addx" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
    .disclaimer-text {
        font-size: 12px;
        color: #777;
        margin-top: 30px;
        margin: 8rem auto;
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
        <div class="container">
            <h1>Add Citizen</h1>
            <div class="form-group">
                <label for="Name">Full Name:</label>
                <asp:TextBox ID="Name" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="ID">I.D:</label>
                <asp:TextBox ID="ID" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="AddText">Address:</label>
                <asp:TextBox ID="Address" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="Age">Age:</label>
                <asp:DropDownList ID="Age" runat="server" OnSelectedIndexChanged="Page_Load"><asp:ListItem Text="" Value=""></asp:ListItem></asp:DropDownList>
            </div>
            <div class="form-group">
                <label>Gender:</label>
                <div class="checkbox-group">
                    <asp:RadioButton ID="GenderMale" runat="server" GroupName="gender" value="male"/>
                    <label for="GenderMale">Male</label>
                </div>
                <div class="checkbox-group">
                    <asp:RadioButton ID="GenderFemale" runat="server" GroupName="gender" value="female"/>
                    <label for="GenderFemale">Female</label>
                </div>
            </div>
            <div class="form-group">
                <label for="CheckBoxList1">Social Credit Calculator:</label>
                <ul id="CheckBoxList1" runat="server">
                    <li>
                        <div class="checkbox-group">
                            <asp:CheckBox ID="Donation" runat="server" />
                            <label for="Donation">I donated money to the Glory Government of the CCP</label>
                        </div>
                    </li>
                    <li>
                        <div class="checkbox-group">
                            <asp:CheckBox ID="SocialMedia" runat="server" />
                            <label for="SocialMedia">I protected China's interests on social media</label>
                        </div>
                    </li>
                    <li>
                        <div class="checkbox-group">
                            <asp:CheckBox ID="ChineseHan" runat="server" />
                            <label for="ChineseHan">I'm Chinese Han (not Muslim)</label>
                        </div>
                    </li>
                    <li>
                        <div class="checkbox-group">
                            <asp:CheckBox ID="Job" runat="server" />
                            <label for="Job">I have a Job</label>
                        </div>
                    </li>
                    <li>
                        <div class="checkbox-group">
                            <asp:CheckBox ID="CCPVote" runat="server" />
                            <label for="CCPVote">I voted for the CCP</label>
                        </div>
                    </li>
                    <li>
                        <div class="checkbox-group">
                            <asp:CheckBox ID="Protest" runat="server" />
                            <label for="Protest">I don't Protest</label>
                        </div>
                    </li>
                    <li>
                        <div class="checkbox-group">
                            <asp:CheckBox ID="none" runat="server" />
                            <label for="None">None.</label>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="submit-button">
                <asp:Button ID="Submit" runat="server" Text="Submit" CssClass="submit" OnClick="Submit_Click" onClientClick="validateForm();"/>
                <p><asp:Label ID="label1" runat="server" Text="Label" CssClass="result-label"></asp:Label></p>
            </div>
            <p class="disclaimer-text">ChineseCitizensDB.com is an independent platform that aims to provide information and insights related to the social credit system in China. We do not have any affiliation with the Chinese government or any other organization involved in the implementation of the social credit system. The information provided on this website is for educational purposes only and should not be considered legal or official advice.</p>
        </div>
    </form>

<script>
    window.onload = function () {
        var noneCheckbox = document.getElementById('<%= none.ClientID %>');
        var otherCheckboxes = document.querySelectorAll('#CheckBoxList1 input[type="checkbox"]:not(#none)');

        noneCheckbox.addEventListener('click', function () {
            if (noneCheckbox.checked) {
                otherCheckboxes.forEach(function (checkbox) {
                    checkbox.checked = false;
                });
            }
        });

        otherCheckboxes.forEach(function (checkbox) {
            checkbox.addEventListener('click', function () {
                if (noneCheckbox.checked) {
                    noneCheckbox.checked = false;
                }
            });
        });

        var idTextBox = document.getElementById('<%= ID.ClientID %>');
        var submitButton = document.getElementById('<%= Submit.ClientID %>');
        var errorMessage = document.createElement('span');

        // ה-CSS של הJS
        errorMessage.style.color = 'red';
        errorMessage.style.display = 'none';
        errorMessage.style.padding = '5px';
        errorMessage.style.border = '1px solid red';
        errorMessage.style.borderRadius = '4px';
        errorMessage.style.marginLeft = '5px';
        errorMessage.style.marginTop = '5px'; // מרחק

        idTextBox.parentNode.insertBefore(errorMessage, idTextBox.nextSibling);

        idTextBox.addEventListener('input', function () {
            var idValue = idTextBox.value;
            var hasLetters = /[a-zA-Z]/.test(idValue);

            if (hasLetters) {
                errorMessage.textContent = 'ID should not contain letters.';
                errorMessage.style.display = 'inline-block';
                submitButton.disabled = true;
            } else {
                errorMessage.style.display = 'none';
                submitButton.disabled = false;
            }
        });
    };
</script>
</body>
</html>
