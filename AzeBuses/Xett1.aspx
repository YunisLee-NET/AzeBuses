<%@ Page Title="" Language="C#" MasterPageFile="~/BusSite.Master" AutoEventWireup="true" CodeBehind="Xett1.aspx.cs" Inherits="AzeBuses.Xett1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <h1>Marşrutlar</h1>
            <hr />
            <div class="col-lg-6 businfo">
                <asp:DropDownList ID="DDLXett" AutoPostBack="true" OnSelectedIndexChanged="DDLXett_SelectedIndexChanged" CssClass="form-control" runat="server"></asp:DropDownList>
                <br />

                 <asp:TextBox ID="txtAxtar" runat="server" Style="outline: none;"></asp:TextBox><asp:LinkButton ID="lnkAxtar" runat="server" CssClass="btn top-0" OnClick="lnkAxtar_Click" Style="font-size: 20px;"><i>Axtar</i></asp:LinkButton>
                <br />
                <br />
                <asp:Repeater ID="RpXett" runat="server">
                    <ItemTemplate>
                        <h3>Marşrut №<%#Eval("MarsrutNo") %></h3>
                        <table class="table table-bordered">

                            <tbody>
                                <tr>
                                    <th scope="row">Marşrutun №-si</th>
                                    <td><%#Eval("MarsrutNo") %></td>
                                </tr>
                                <tr>
                                    <th scope="row">Başlanğıc məntəqə</th>
                                    <td><%#Eval("Baslangic") %></td>
                                </tr>
                                <tr>
                                    <th scope="row">Son məntəqə</th>
                                    <td><%#Eval("Son") %></td>
                                </tr>
                                <tr>
                                    <th scope="row">İnterval (dəq.)</th>
                                    <td><%#Eval("Interval") %></td>
                                </tr>
                                <tr>
                                    <th scope="row">Gediş haqqı (AZN)</th>
                                    <td><%#Eval("Gedis_haqqi") %></td>
                                </tr>
                                <tr>
                                    <th scope="row">İşləmə aralığı</th>
                                    <td><%#Eval("Vaxt_qrafiki") %></td>
                                </tr>
                                <tr>
                                    <th scope="row">Avtobus sayı</th>
                                    <td><%#Eval("Avtobus_sayi") %></td>
                                </tr>
                                <tr>
                                    <th scope="row">Avtobus modeli</th>
                                    <td><%#Eval("Avtobus_modeli") %></td>
                                </tr>
                                <tr>
                                    <th scope="row">Daşıyıcı şirkət</th>
                                    <td><%#Eval("Dasiyici_sirket") %></td>
                                </tr>
                            </tbody>


                        </table>
                    </ItemTemplate>
                </asp:Repeater>


            </div>
            <div class="col-lg-6 busphotos">
                <br />
                <br />
                <asp:Repeater ID="RpFoto" runat="server">
                    <ItemTemplate>
                        <img style="height: 350px;" src="photos/<%#Eval("Sekil") %>" />
                    </ItemTemplate>
                </asp:Repeater>

            </div>
        </div>


        <br />



    </div>

</asp:Content>
