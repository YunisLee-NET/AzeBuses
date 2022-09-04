<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminPanel.aspx.cs" Inherits="AzeBuses.Admin.AdminPanel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Admin Panel'ə xoş gəlmisiniz !!</h3>
    <br />
    <div class="row">
        <asp:Repeater ID="RpGiris" runat="server">
            <ItemTemplate>
                <table class="table table-bordered">
                    <tbody>
                        <tr>
                            <th scope="row"><%#Eval("ID") %></th>
                            <td><%#Eval("GirisVaxt") %></td>
                        </tr>
                    </tbody>
                </table>
            </ItemTemplate>
        </asp:Repeater>

    </div>


</asp:Content>
