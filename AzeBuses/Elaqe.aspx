<%@ Page Title="" Language="C#" MasterPageFile="~/BusSite.Master" AutoEventWireup="true" CodeBehind="Elaqe.aspx.cs" Inherits="AzeBuses.Elaqe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        function myAlert() {
            alert("Hello! I am an alert box!");
        }
    </script>
        
        <div class="container">
            <div class="row" style="border: 2px solid black; border-radius: 25px; height: auto;">
                <br />
                <div class="col-lg-7 esas">
                    <br />
                    <h1>Bizimlə əlaqə</h1>
                    <hr />
                    <b><asp:Label ID="lblXeberdarliq" runat="server" Text="" style="font-size: 24px; color: red; font-family: 'Times New Roman';"></asp:Label></b>
                    <asp:TextBox ID="txtName" CssClass="form-control" placeholder="Adınız" runat="server"></asp:TextBox>
                    <asp:TextBox ID="txtSurname" CssClass="form-control" placeholder="Soyadınız" runat="server"></asp:TextBox>
                    <asp:TextBox ID="txtMail" CssClass="form-control" placeholder="Elektron ünvan" runat="server"></asp:TextBox>
                    <asp:TextBox ID="txtMessage" CssClass="form-control" Rows="10" placeholder="Mesajınız" TextMode="MultiLine" runat="server"></asp:TextBox>
                    <asp:TextBox ID="txtSimvol" runat="server" CssClass="form-control" placeholder="Simvolu daxil edin"></asp:TextBox>
                    <div style="background-image: url(logo/kod.jpg); width: 100px; text-align: center; -ms-transform: skewY(10deg); transform: skewY(10deg);">
                        <asp:Label ID="lblSimvol" runat="server" Text="Label" style="font-family: 'Comic Sans MS'; font-size: 28px; border-radius: 10px; text-decoration: line-through;"></asp:Label>
                    </div>
                    <br />
                    <br />
                    <asp:Button ID="btnSend" CssClass="form-control btn btn-success" runat="server" Text="Göndərin" OnClick="btnSend_Click" />
                    <input id="Button1" onclick="myAlert()" type="button" value="button" />
                <br />
                <br />
                </div>
                <div class="col-lg-5">
                   
                    <img style="height: 400px; margin-right: auto; margin-left: auto; margin-top:60px; display: block;" src="logo/collage.jpg" />
                    
        
                </div>
            </div>
        </div>

</asp:Content>
