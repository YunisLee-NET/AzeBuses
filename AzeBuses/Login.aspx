<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AzeBuses.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/login.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <br />
        <br />
        <br />
        <br />
            <br />
        <div class="login">
            
            <div class="qeydiyyat">
                
                <div class="textboxarea">
                    <img style="height: 60px; width: 60px;" src="logo/male_user_60px.png" />
                    <br />
                    <asp:TextBox ID="txtUser" class="element" CssClass="form-control" runat="server" placeholder="İstifadəçi adı"></asp:TextBox>
                    <br />
                <asp:TextBox ID="txtParol" class="element" CssClass="form-control" runat="server" placeholder="Şifri daxil edin" type="password"></asp:TextBox>

                    <br />
                </div>
                <div class="center"> 
                    <asp:Button ID="btnGirish" runat="server" CssClass="form-control" Text="Daxil ol" OnClick="btnGirish_Click" />

                </div>
            </div>
        </div>
    </form>
</body>
</html>
