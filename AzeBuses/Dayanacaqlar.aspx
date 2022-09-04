<%@ Page Title="" Language="C#" MasterPageFile="~/BusSite.Master" AutoEventWireup="true" CodeBehind="Dayanacaqlar.aspx.cs" Inherits="AzeBuses.Dayanacaqlar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 busstops">
                <asp:DropDownList ID="DDLBusStop" runat="server"></asp:DropDownList>
                <br />
                <br />
                <h3>Marşrut №194</h3>
                <ul>
                    <li>Qobu Park</li>
                    <li>Lökbatan qəsəbəsi</li>
                    <li>Xəyal dairəsi</li>
                    <li>Xocəsən yolu</li>
                    <li>Sədərək Ticarət Mərkəzi</li>
                    <li>Meyvəli bazarı</li>
                    <li>Dairəvi yol</li>
                    <li>Yeni Yasamal</li>
                    <li>Dadaş Bünyadzadə küçəsi</li>
                    <li>20 Yanvar m/st</li>
                </ul>
            </div>
            <div class="col-lg-6 busphoto">
                <img style="height: 350px;" src="logo/194.jpg" />
            </div>
        </div>

    </div>
</asp:Content>
