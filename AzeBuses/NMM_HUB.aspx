<%@ Page Title="" Language="C#" MasterPageFile="~/BusSite.Master" AutoEventWireup="true" CodeBehind="NMM_HUB.aspx.cs" Inherits="AzeBuses.NMM_HUB" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 hubnmm">
                <asp:DropDownList ID="DDLHUB" runat="server"></asp:DropDownList>
                <br />
                <br />
                <h3>Koroğlu Nəqliyyat Mübadilə Mərkəzi</h3>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th scope="col">Marşrutun №-si</th>
                            <th scope="col">Başlanğıc məntəqə</th>
                            <th scope="col">Son məntəqə</th>
                            <th scope="col">Daşıyıcı şirkət</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">118A</th>
                            <td>Koroğlu NMM</td>
                            <td>Zabrat qəsəbəsi (Kərpic zavodu)</td>
                            <td>Kənan-2000 MMC</td>
                        </tr>
                        <tr>
                            <th scope="row">118B</th>
                            <td>Koroğlu NMM</td>
                            <td>Zabrat qəsəbəsi (Yeni məhəllə)</td>
                            <td>Grand Bus MMC</td>
                        </tr>
                        <tr>
                            <th scope="row">136</th>
                            <td>Koroğlu NMM</td>
                            <td>Şüvəlan qəsəbəsi</td>
                            <td>Status-Avto MMC</td>
                        </tr>
                        <tr>
                            <th scope="row">148</th>
                            <td>Koroğlu NMM</td>
                            <td>Zabrat qəsəbəsi (İstixana)</td>
                            <td>Grand Bus MMC</td>
                        </tr>
                        <tr>
                            <th scope="row">160</th>
                            <td>Koroğlu NMM</td>
                            <td>Binə qəsəbəsi</td>
                            <td>Çinar-Trans MMC</td>
                        </tr>
                        <tr>
                            <th scope="row">197</th>
                            <td>Koroğlu NMM</td>
                            <td>Zabrat-2 qəsəbəsi</td>
                            <td>Grand Bus MMC</td>
                        </tr>
                        <tr>
                            <th scope="row">198</th>
                            <td>Koroğlu NMM</td>
                            <td>Zabrat qəsəbəsi (Dəmir yolu)</td>
                            <td>Grand Bus MMC</td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="col-lg-4 photohub">
                <br />
                <br />
                <br />
                <img style="width: 350px;" src="logo/koroglu.jpg" />
            </div>

        </div>
    </div>
</asp:Content>
