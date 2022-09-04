<%@ Page Title="" Language="C#" MasterPageFile="~/BusSite.Master" AutoEventWireup="true" CodeBehind="Dasiyicilar.aspx.cs" Inherits="AzeBuses.Dasiyicilar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container col-lg-12">
        
            <asp:DropDownList CssClass="form-control" ID="DDLDasiyici" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DDLDasiyici_SelectedIndexChanged"></asp:DropDownList>
            <br />
       

            <br />
        <br />
            <asp:LinkButton ID="lnkAllXett" runat="server" CssClass="form-control btn btn-success" OnClick="lnkAllXett_Click">Bütün xətləri göstər</asp:LinkButton>
            <br />
            <div>
              <div class="row">  
                <asp:Repeater ID="RP_Dasiyici" runat="server">
                <ItemTemplate>
                    <div class="col-lg-4">
                    <a class="busa" href="Xetler.aspx?ID=<%#Eval("ID") %>">
                        <div class="card">
                            <img src="logo/<%#Eval("Sekil") %>" class="card-img-top">
                            <div class="card-body">
                                <p class="card-text"><b style="font-size: 22px;">Marşrut №<%#Eval("MarsrutNo") %></b></p>
                                <ul>
                                    <li><%#Eval("Baslangic") %> - <%#Eval("Son") %></li>
                                    <li><%#Eval("Dasiyici_sirket") %></li>
                                </ul>
                                <p style="float: right;"><a href="Xetler.aspx?ID=<%#Eval("ID") %>"><span>Ətraflı →</span></a></p>
                            </div>
                        </div>
                    </a>

                    </div>

                </ItemTemplate>
            </asp:Repeater>
</div>

           
            
             

        </div>
     
       

    </div>
</asp:Content>
