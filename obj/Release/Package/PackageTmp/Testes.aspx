<%@ Page Title="" Language="vb" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Testes.aspx.vb" Inherits="realapp.Testes" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        body {
            font-family: Arial;
            font-size: 10pt;
        }

        .GridPager a, .GridPager span {
            display: block;
            height: 15px;
            width: 15px;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
        }

        .GridPager a {
            background-color: #f5f5f5;
            color: #969696;
            border: 1px solid #969696;
        }

        .GridPager span {
            background-color: #A1DCF2;
            color: #000;
            border: 1px solid #3AC0F2;
        }
    </style>


    <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
    <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="~/Content/bootstrap-spacelab.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <div class="panel panel-primary">


        <div class="panel panel-primary">

            <div class="panel-body">
                <span style="font:18px century gothic;">Pesquisar Entidade:</span>
        <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="true" EnableViewState="true" CssClass="form-control"></asp:TextBox>

                <a data-toggle="modal" href="#detalheCliente" class="btn btn-default" data-keyboard="false"><i class="fa fa-search fa-2x" title="Pesquisar" aria-hidden="true"></i>
                    <span class="sr-only">Pesquisar</span></a>

                <div class="modal" id="detalheCliente">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title">Detalhe Entidade</h4>
                            </div>
                            <div class="modal-body">

                                <%--OnSelectedIndexChanged="GridView1_SelectedIndexChanged"--%>

                                <asp:GridView ID="GridView1" runat="server" ForeColor="#3e3e3a" HeaderStyle-ForeColor="#3e3e3a"
                                     AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                                    DataSourceID="SqlDataSource1" DataKeyNames="ent_nome" Font-Size="Large"
                                    AllowPaging="True"  CssClass="table table-bordered table-hover">
                                    <Columns>
                                        <asp:BoundField DataField="ent_nome" HeaderText="Nome da Entidade" SortExpression="ent_nome" />                                                                                
                                        
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton Text="Seleccionar" ID="lnkSelect" runat="server" CommandName="Select" ForeColor="#3e3e3a" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    
                                    <PagerStyle HorizontalAlign="Left" CssClass="GridPager" />
                                </asp:GridView>

                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:realappConnectionString %>"
                                    SelectCommand="SELECT DISTINCT Entidades.ent_nome FROM Entidades " FilterExpression="ent_nome LIKE '{0}%'">
                                    <FilterParameters>
                                        <asp:ControlParameter ControlID="TextBox1" Name="ent_nome" PropertyName="Text" Type="String" />
                                    </FilterParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>

                <br />
                <br />
                <span style="font:18px century gothic;">Entidade*:</span>
        <asp:TextBox ID="txtEntidade" runat="server" CssClass="form-control" Text='<%# Eval("ent_nome") %>' Enabled="false" Font-Size="Large"></asp:TextBox>
               



        </div>
    </div>
</asp:Content>
