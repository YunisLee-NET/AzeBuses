<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminXett.aspx.cs" Inherits="AzeBuses.Admin.AdminDayanacaq" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/bootstrap.css" rel="stylesheet" />

    <style>
        .txtbusstop {
            outline: none;
            border: 1px solid silver;
            border-radius: 4px;
            height: 1cm;
        }

        .txtbusstop:active {
            border: 1px solid blue;
            box-shadow: 0 0 9px blue;
        }

        .txtbusstop:hover {
            border: 1px solid blue;
            box-shadow: 0 0 9px blue;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Marşrut xətləri</h1>
    <hr />
    <div class="col-lg-12">

        <div class="col-lg-12">
            <h6>Marşrutun №-si</h6>
            <asp:TextBox ID="txtBusNo" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <br />
        <div class="col-lg-12">
            <h6>Başlanğıc məntəqə</h6>
            <asp:TextBox ID="txt1stStop" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <br />
        <div class="col-lg-12">
            <h6>Son məntəqə</h6>
            <asp:TextBox ID="txtSonStop" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <br />
        <div class="col-lg-12" style="display: flex; justify-content: space-around;">
            <div class="col-md-3">
                <h6>İnterval (dəq.)</h6>
                <asp:TextBox ID="txtInterval" runat="server" class="txtbusstop" TextMode="Number"></asp:TextBox>
            </div>
            <div class="col-md-3">
                <h6>Gediş haqqı (AZN)</h6>
                <asp:TextBox ID="txtGedisHaqqi" runat="server" class="txtbusstop"></asp:TextBox>
            </div>
            <div class="col-md-3">
                <h6>Vaxt qrafiki</h6>
                <asp:TextBox ID="txtVaxt" runat="server" class="txtbusstop"></asp:TextBox>
            </div>
            <div class="col-md-3">
                <h6>Avtobus sayı</h6>
                <asp:TextBox ID="txtSay" runat="server" class="txtbusstop" TextMode="Number"></asp:TextBox>
            </div>
            <br />

            <br />
            <br />
        </div>

        <div class="col-lg-12" style="display: flex; justify-content: space-around;">
            <div class="col-md-4">
                <h6>Avtobus modeli</h6>
                <asp:TextBox ID="txtModel" runat="server" class="txtbusstop"></asp:TextBox>
            </div>
            <div class="col-md-4">
                <h6>Daşıyıcı şirkət</h6>
                <asp:DropDownList ID="DDL_AdminDasiyici" runat="server" OnSelectedIndexChanged="DDL_AdminDasiyici_SelectedIndexChanged" class="txtbusstop"></asp:DropDownList>
                <%--<asp:TextBox ID="txtDasiyici" runat="server" class="txtbusstop"></asp:TextBox>--%>
            </div>
            <div class="col-md-4">
                <h6>Sıra</h6>
                <asp:TextBox ID="txtSira" runat="server" class="txtbusstop"></asp:TextBox>
            </div>
        </div>

    </div>
<br />
    <div class="col-lg-12" style="display: flex; justify-content: space-around;">
        <div class="col-lg-6">
            <asp:Image ID="imgbusfoto" runat="server" Style="width: 300px; height: 300px; border: 1px solid snow; color: snow;" />
            <br />
            <br />
            <asp:FileUpload ID="fileimg" runat="server" onchange='openFile(event)' />
        </div>
        <div class="col-lg-6">

            <div>
                <asp:LinkButton ID="lnkOk" runat="server" CssClass="btn btn-success" OnClick="lnkOk_Click">Təsdiq et</asp:LinkButton>
            </div>
        </div>
    </div>
    <br />
    <div class="col-lg-12">
        <asp:TextBox ID="txtAxtar" runat="server" OnTextChanged="txtAxtar_TextChanged" placeholder="Axtar" style="height: 35px; width: 500px; outline: none; margin-right: 20px;"></asp:TextBox><asp:LinkButton ID="lnkAxtar" runat="server" OnClick="lnkAxtar_Click" CssClass="btn btn-primary">Axtar</asp:LinkButton>
    </div>

    <div class="col-lg-12">
                    <table class="table table-bordered">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th>Marşrutun №-si</th>
                        <th>Başlanğıc məntəqə</th>
                        <th>Son məntəqə</th>
                        <th>İnterval</th>
                        <th>Gediş haqqı</th>
                        <th>Vaxt qrafiki</th>
                        <th>Avtobus sayı</th>
                        <th>Avtobus modeli</th>
                        <th>Daşıyıcı</th>
                        <th>Şəkil</th>
                        <th>Sıra</th>
                        <th>Düzəliş</th>
                        <th>Sil</th>
                    </tr>
                </thead>
                            <asp:Repeater ID="RP_XettCedvel" runat="server" OnItemCommand="RP_XettCedvel_ItemCommand">
                                <ItemTemplate>
                                    <tbody>
                                        <th><%#Eval("ID") %></th>
                                        <td><%#Eval("MarsrutNo") %></td>
                                        <td><%#Eval("Baslangic") %></td>
                                        <td><%#Eval("Son") %></td>
                                        <td><%#Eval("Interval") %></td>
                                        <td><%#Eval("Gedis_haqqi") %></td>
                                        <td><%#Eval("Vaxt_qrafiki") %></td>
                                        <td><%#Eval("Avtobus_sayi") %></td>
                                        <td><%#Eval("Avtobus_modeli") %></td>
                                        <td><%#Eval("Dasiyici_sirket") %></td>
                                        <td>
                                            <img class="fotozoom" src='../logo/<%#Eval("Sekil") %>' width="30" /></td>
                                        <td><%#Eval("Sira") %></td>
                                        <td>
                                            <asp:LinkButton ID="btnEdit" runat="server" CssClass="btn btn-info" CommandName="edit" CommandArgument='<%#Eval("ID") %>'>Edit</asp:LinkButton></td>
                                        <td>
                                            <asp:LinkButton ID="btnSil" runat="server" CssClass="btn btn-info" CommandName="sil" CommandArgument='<%#Eval("ID") %>'>Sil</asp:LinkButton></td>
                                    </tbody>

                                </ItemTemplate>
                            </asp:Repeater>
            </table>
    </div>



</asp:Content>
