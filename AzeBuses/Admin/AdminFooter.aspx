<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminFooter.aspx.cs" Inherits="AzeBuses.Admin.AdminFooter" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div>
            <h2>Admin Menu</h2>
            <hr />
            <div class="col-lg-12" style="display: flex; justify-content: space-around;">
                <asp:TextBox ID="txtMenu" runat="server" placeholder="Menu adi" CssClass="form-control"></asp:TextBox>
                <asp:TextBox ID="txtURL" runat="server" placeholder="Menu URL" CssClass="form-control"></asp:TextBox>
                <asp:TextBox ID="txtRow" runat="server" placeholder="Menu sira" TextMode="Number" CssClass="form-control"></asp:TextBox>
                <asp:LinkButton ID="lnkOK" runat="server" CssClass="btn btn-success">OK</asp:LinkButton>
            </div>
            <br />
            <table class="table table-bordered">
                <thead>
                    <tr style="background-image: linear-gradient(to top left, #3498db,#273c75);">
                        <th scope="col">#</th>
                        <th>Menu</th>
                        <th>URL</th>
                        <th>Sira</th>
                        <th>Duzeliw</th>
                        <th>Sil</th>
                    </tr>
                </thead>

                <asp:Repeater ID="RP_FTMenu" runat="server" OnItemCommand="RP_FTMenu_ItemCommand">
                    <ItemTemplate>
                        <tbody>
                            <th scope="row"><%#Eval("ID") %></th>
                            <td><%#Eval("MenuName") %></td>
                            <td><%#Eval("MenuURL") %></td>
                            <td><%#Eval("MenuRow") %></td>
                            <td>
                                <asp:LinkButton ID="btnEdit" runat="server" CssClass="btn btn-info" CommandName="Edit" CommandArgument='<%#Eval("ID") %>'>Edit</asp:LinkButton></td>
                            <td>
                                <asp:LinkButton ID="btnSil" runat="server" CssClass="btn btn-info" CommandName="Sil" CommandArgument='<%#Eval("ID") %>'>Sil</asp:LinkButton></td>
                        </tbody>
                    </ItemTemplate>
                </asp:Repeater>




            </table>
        </div>
        <hr style="border: 2px solid black;" />
        <div>
            <h2>Admin Sosial</h2>
            <hr />
            <div class="col-lg-12" style="display: flex; justify-content: space-around;">
                <asp:TextBox ID="txtSebeke" runat="server" placeholder="Sosial webeke" CssClass="form-control"></asp:TextBox> 
                <asp:TextBox ID="txtLink" runat="server" placeholder="Link" CssClass="form-control"></asp:TextBox>
                <asp:LinkButton ID="txtTesdiq" runat="server" CssClass="btn btn-success" OnClick="txtTesdiq_Click">OK</asp:LinkButton>
            </div>
            <br />
            <div class="col-lg-12" style="display: flex; justify-content: space-around;">
                <div class="col-lg-6">
                    <asp:Image ID="imgftlogo" runat="server" style="width: 40px; height: 40px; border: 1px solid snow; color: snow;" />
                    <asp:FileUpload ID="fileimg" runat="server" onchange='openFile(event)' />
                </div>
                <div class="col-lg-6">
                    
                    <div>
                        <asp:Label ID="lblURL" runat="server" Text="Salam aleykum"></asp:Label>
                    </div>
                </div>
            </div>

            <br />
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th>Sosial</th>
                        <th>URL</th>
                        <th>Logo</th>
                        <th>Duzeliw</th>
                        <th>Sil</th>
                    </tr>
                </thead>
                            <asp:Repeater ID="RP_Sosial" runat="server" OnItemCommand="RP_Sosial_ItemCommand">
                                <ItemTemplate>
                                    <tbody>
                                        <th scope="row"><%#Eval("ID") %></th>
                                        <td><%#Eval("SosialName") %></td>
                                        <td><%#Eval("SosialURL") %></td>
                                        <td>
                                            <img class="fotozoom" src='../logo/<%#Eval("LogoURL") %>' width="30" /></td>
                                        
                                        <td>
                                            <asp:LinkButton ID="btnEdit" runat="server" CssClass="btn btn-info" CommandName="edit" CommandArgument='<%#Eval("ID") %>'>Edit</asp:LinkButton></td>
                                        <td>
                                            <asp:LinkButton ID="btnSil" runat="server" CssClass="btn btn-info" CommandName="sil" CommandArgument='<%#Eval("ID") %>'>Sil</asp:LinkButton></td>
                                    </tbody>

                                </ItemTemplate>
                            </asp:Repeater>
            </table>
        </div>
        <hr style="border: 2px solid black;" />
        <div>
            <h2>Admin wekil</h2>
            <hr />

            <div class="col-lg-12" style="display: flex; justify-content: space-around;">
                <div class="col-lg-6">

                </div>
                <div class="col-lg-6">
                    <div class="col-md-12">
                        <asp:LinkButton ID="lnkAdd" runat="server" CssClass="btn btn-danger" OnClick="lnkAdd_Click">Elave et</asp:LinkButton>
                        <asp:LinkButton ID="lnkSil" runat="server" CssClass="btn btn-primary">Sil</asp:LinkButton>
                    </div>
                    <div>
                        <p>Salam aleykum</p>
                    </div>
                </div>
            </div>
        </div>

        <br />
        <br />
    </div>

    <script>
        var openFile = function (file) {
            var input = file.target;

            var reader = new FileReader();
            reader.onload = function () {
                var dataURL = reader.result;
                var output = document.getElementById('ContentPlaceHolder1_imgftlogo');
                output.src = dataURL;
            }
            reader.readAsDataURL(input.files[0]);
        };
    </script>


</asp:Content>
