<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Admin_BusCard.aspx.cs" Inherits="AzeBuses.Admin.Admin_BusCard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body{
            background-color:#222f3e;
            color:snow;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Bus card</h1>
    <div class="col-lg-12">
        <br />
        <div class="row">
            <div class="col-lg-4">
            <asp:Image ID="Image1" runat="server" />
        <asp:FileUpload ID="FileUpload1" runat="server" />
        </div>
        <div class="col-lg-8">
            <h6>Marşrut №</h6>
            <asp:TextBox CssClass="form-control" ID="txtbusnumber" runat="server"></asp:TextBox>
             <h6>Başlanğıc məntəqə</h6>
            <asp:TextBox CssClass="form-control" ID="txtfromlocation" runat="server"></asp:TextBox>
             <h6>Son məntəqə</h6>
            <asp:TextBox CssClass="form-control" ID="txtfromtolocation" runat="server"></asp:TextBox>
            <h6>Daşıyıcı şirkət</h6>
            <asp:TextBox CssClass="form-control" ID="txtcompany" runat="server"></asp:TextBox>
        </div>
        </div>
        
        <br />
        <h6>Avtobus seçin</h6>
        <div>
            <asp:DropDownList ID="DDL_BusNumber" CssClass="form-control" runat="server"></asp:DropDownList>
        </div>
        <br />
        <div>
            <table class="table table-dark">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Marşrut №</th>
      <th scope="col">Başlanğıc məntəqə</th>
      <th scope="col">Son məntəqə</th>
        <th scope="col">Daşıyıcı şirkət</th>
       <th> Düzəliş et </th>
       
        <th> Sil </th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
         <td>@mdo</td>
        <td><asp:Button ID="Button1" CssClass="btn btn-warning" runat="server" Text="Düzəliş et" /></td>
        <td><asp:Button ID="Button2" runat="server" CssClass="btn btn-danger" Text="Sil" /></td>
    </tr>

  </tbody>
</table>
        </div>
    </div>
</asp:Content>
