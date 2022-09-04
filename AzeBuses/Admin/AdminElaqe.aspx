<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminElaqe.aspx.cs" Inherits="AzeBuses.Admin.AdminElaqe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function tesdiqle() {

            alert("Məlumat uğurla əlavə olundu ");
        }
    </script>
    <style>
       
strong {
  
  color: red;
  animation-name: example;
  animation-duration: 2s;
}

@keyframes example {
  0%   {color: red;}
  25%  {color: snow;}
  50%  {color: red;}
  100% {color: snow;}
}
</style>
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
  <h2>Basic Table</h2>
        <strong>
            <asp:Label ID="lblinfo" runat="server" Text=""></asp:Label></strong>
        <div>
            <asp:TextBox ID="txtAliciMail" CssClass="form-control" runat="server" placeholder="Alıcı"></asp:TextBox>
            <br />
            <asp:TextBox ID="txtBasliq" CssClass="form-control" runat="server" placeholder="Başlıq"></asp:TextBox>
            <br />
            <asp:TextBox ID="txtMesaj" CssClass="form-control" runat="server" placeholder="Mesaj" TextMode="MultiLine"></asp:TextBox>
            <br />
            <asp:LinkButton ID="lnkGonder" CssClass="form-control btn btn-success" runat="server" OnClick="lnkGonder_Click">Göndər</asp:LinkButton>
        </div>
        <hr />
        <div class="col-lg-12" style="display: flex; justify-content: space-around;">
            <div class="col-md-4"><span><b>Ad: </b></span><asp:Label ID="lblAd" runat="server" Text="----"></asp:Label></div>
            <div class="col-md-4"><span><b>Soyad: </b></span><asp:Label ID="lblSoyad" runat="server" Text="----"></asp:Label></div>
            <div class="col-md-4"><span><b>Mail: </b></span><asp:Label ID="lblMail" runat="server" Text="----"></asp:Label></div>
        </div>
        <br />
            <div><span><b>Mesaj: </b></span>
                <asp:Label ID="lblMesaj" runat="server" Text="Mesaj burada əks olunacaq"></asp:Label>
            </div>
        <hr />
        <br />
        <div  class="row">
            <div class="col-lg-7" style="display:flex; flex-direction:row">
                <asp:TextBox placeholder="Axtar..." CssClass="form-control" ID="txtAxtar" runat="server"></asp:TextBox>
                <asp:LinkButton CssClass="btn" style="font-size:18px" ID="lnkAxtar" runat="server" OnClick="lnkAxtar_Click">🔍</asp:LinkButton>
            </div>
            <div class="col-lg-5" style="display:flex; justify-content:space-between">
                <asp:LinkButton OnClick="lblMew_Click" ID="lblMew" CssClass="btn btn-success" runat="server">Əvvəlcə yeni 
                </asp:LinkButton>
                <asp:LinkButton OnClick="lblOld_Click" ID="lblOld" CssClass="btn btn-warning" runat="server">Əvvəlcə köhnə</asp:LinkButton>
            </div>
        </div>
         <br />
  <table class="table table-dark">
      <thead>
                  <tr>
                      <th scope="col">#</th>
                      <th>Ad</th>
                      <th>Soyad</th>
                      <th>Mail</th>
                      <th>Mesaj</th>
                      <th>Mesaj tarixi</th>
                      <th>Baxiw</th>
                      <th>Sil</th>
                  </tr>
              </thead>

              <asp:Repeater ID="RpElaqeHead" runat="server" OnItemCommand="RpElaqeHead_ItemCommand">
          <ItemTemplate>
              <tbody>
                  <th scope="row"><%#Eval("ID") %></th>
                  <td><%#Eval("Ad") %></td>
                  <td><%#Eval("Soyad") %></td>
                  <td><%#Eval("Mail") %></td>
                  <td><%#Eval("Mesaj") %></td>
                  <td><%#Eval("MsgTime") %></td>
                  <td><asp:LinkButton ID="btnBaxis" runat="server" CssClass="btn btn-warning" CommandName="Baxiw" CommandArgument='<%#Eval("ID") %>'>Baxış</asp:LinkButton></td>
                  <td><asp:LinkButton ID="btnEdit" runat="server" CssClass="btn btn-danger" CommandName="Sil" CommandArgument='<%#Eval("ID") %>'>Sil</asp:LinkButton></td>
              </tbody>
          </ItemTemplate>
      </asp:Repeater>

  </table>
</div>
</asp:Content>
