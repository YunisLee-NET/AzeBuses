<%@ Page Title="" Language="C#" MasterPageFile="~/BusSite.Master" AutoEventWireup="true" CodeBehind="AnaSehife.aspx.cs" Inherits="AzeBuses.AnaSehife" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container">

    <div class="col-lg-12" id="basliq" style="display: flex; justify-content: space-around;">
        <div class="col-lg-7">
            <h1><b>Sizin avtobus bələdçiniz :)</b></h1>
        </div>
        <div class="col-lg-5" style="border: 1px solid black; border-radius: 15px; width: 300px; padding-top: 11px; background-color: #adadad;">
            <asp:TextBox ID="txtAxtar" runat="server" placeholder="Axtar..." style="outline: none; border: none; height: 30px; padding-bottom: 7px; background-color: #adadad; width: auto;"></asp:TextBox>
            <img src="logo/axtar.png" style="float: right;" />
        </div>
    </div>
    <br />
    <br />
    <br />
    <div id="sekiller">

        <div class="col-lg-12">
            <div class="row">
                <div class="col-lg-8">
                    <img src="logo/knmm.jpg" style="width: 20cm; border-radius: 20px; height: 11.6cm;" />
                </div>
                <div class="col-lg-4">
                  <div>
                    <img src="logo/koroglu.jpg" style="width: 10cm; height: 6cm; border-radius: 20px;" />
                </div>
                <br />
                <div>
                    <img src="logo/bb.jpg" style="width: 10cm; height: 5cm; border-radius: 20px;" />
                </div>
                </div>
            </div>
        </div>



    </div>
    <br />
    <div id="elaqe">
        <div style="background-color: #dbedfe; height: 12cm; width: 100%; border-radius: 20px;" class="col-lg-12">
            <div class="row">
                <div class="col-lg-8">
                    <div style="transform: scale(0.9);margin-top:5px">
                    <h3>Bizimlə əlaqə</h3>
                    <i>Şirkətimiz tərəfindən sizin cavabınız mail ünvanınıza göndəriləcək. Xahiş edirik ki, mail ünvanınızı qeyd edərkən diqqətli olun. Əks halda bu barədə biz məsuliyyət daşımırıq.</i>
                </div>
                <div style="transform: scale(0.8)">
                    <asp:TextBox placeholder ="Ad" CssClass="form-control nothercontact" ID="TextBox1" runat="server"></asp:TextBox>
                    <br />
                     <asp:TextBox placeholder ="Soyad" CssClass="form-control nothercontact" ID="TextBox2" runat="server"></asp:TextBox>
                    <br />
                     <asp:TextBox placeholder ="Mail" CssClass="form-control nothercontact" ID="TextBox3" runat="server"></asp:TextBox>
                    <br />
                     <asp:TextBox placeholder ="Zəhmət olmasa təklif və iradınızı bura qeyd edin." TextMode="MultiLine" Rows="5" CssClass="form-control nothercontact" ID="TextBox4" runat="server"></asp:TextBox>
                    <br />
                    <asp:Button style="background-color:#3498db" CssClass="form-control btn nothercontact" ID="lnkGonder" runat="server" Text="Göndər" />
                </div>
                </div>
                <div class="col-lg-4">
                    <img style="height: 10cm; width: 100%; border-radius: 20px;" src="logo/customer-service.png" />
                </div>
            </div>
        </div>
    </div>

</div>
</asp:Content>
