<%@ Page Title="Consultar Tarifas" Language="vb" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ConsultarTarifas.aspx.vb" Inherits="realapp.ConsultarTarifas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

      <style type="text/css">
    body
    {
        font-family: Arial;
        font-size: 10pt;
    }
    .GridPager a, .GridPager span
    {
        display: block;
        height: 15px;
        width: 15px;
        font-weight: bold;
        text-align: center;
        text-decoration: none;
    }
    .GridPager a
    {
        background-color: #f5f5f5;
        color: #969696;
        border: 1px solid #969696;
    }
    .GridPager span
    {
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

    <br />
    <ul class="breadcrumb">
        <li><a href="Default.aspx" style="color: black;">Home</a></li>
        <li class="active">Consultar Tarifas</li>
    </ul>

   
        <h3>Consultar Tarifas</h3>

     <div class="panel panel-primary">

            <div class="panel-body">

                <div class="row">
                    <div class="col-md-12">
    <span style="font:18px century gothic;">Ano:</span> <asp:DropDownList ID="dropAno" AutoPostBack="true" runat="server" DataSourceID="SqlDataSource5"
        DataTextField="ano" DataValueField="ano" Font-Size="Large" Font-Names="Century Gothic"></asp:DropDownList>

        <asp:SqlDataSource ID="SqlDataSource5" runat="server"
            ConnectionString="<%$ ConnectionStrings:realappConnectionString %>"
            SelectCommand="SELECT [ano] FROM [Anos]"></asp:SqlDataSource>
                        </div>
                    
                    <div class="col-md-12">
      
   <span style="font:18px century gothic;">Hotel:</span> <asp:DropDownList ID="dropHoteis" AutoPostBack="true" runat="server"
        DataSourceID="SqlDataSource4" DataTextField="hot_nome" DataValueField="hot_nome" Font-Size="Large" Font-Names="Century Gothic"></asp:DropDownList>

    <asp:SqlDataSource ID="SqlDataSource4" runat="server"
        ConnectionString="<%$ ConnectionStrings:realappConnectionString %>"
        SelectCommand="SELECT [hot_nome] FROM [Hoteis]"></asp:SqlDataSource>
                        </div>

                    <div class="col-md-12">

                           <span style="font:18px century gothic;">Epoca:</span> <asp:DropDownList ID="dropEpoca" AutoPostBack="true" runat="server"
        DataSourceID="SqlDataSource2" DataTextField="epo_nome" DataValueField="epo_nome" Font-Size="Large" Font-Names="Century Gothic"></asp:DropDownList>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server"
        ConnectionString="<%$ ConnectionStrings:realappConnectionString %>"
        SelectCommand="Select distinct Epo.epo_nome
                       From Epoca as Epo
                       inner join Tarifas as Trf on Epo.epo_id = Trf.epo_id
                       inner join Hoteis as Hot on Trf.hot_id = Hot.hot_id
                       where Hot.hot_nome like @hot_nome">
         <SelectParameters>
                        <asp:ControlParameter ControlID="dropHoteis" Name="hot_nome" PropertyName="SelectedValue" />
                    </SelectParameters>
    </asp:SqlDataSource>

                    </div>


                  </div>
        
    <br />
    
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                    DataSourceID="SqlDataSource1"   ForeColor="#3e3e3a" HeaderStyle-ForeColor="#3e3e3a" Font-Names="Century Gothic"  
                      CssClass="table table-bordered table-hover">
                    <Columns>
                        <asp:BoundField DataField="hot_nome" HeaderText="Hotel" SortExpression="hot_nome" />
                        <asp:BoundField DataField="trf_nome" HeaderText="Tarifas" SortExpression="trf_nome" />
                        <asp:BoundField DataField="tip_nome" HeaderText="Tipologia" SortExpression="tip_nome" />
                        <asp:BoundField DataField="epo_nome" HeaderText="Época" SortExpression="epo_nome" />
                        <asp:BoundField DataField="trf_valor" HeaderText="Valor" SortExpression="trf_valor" />
                        <asp:BoundField DataField="trf_observacoes" HeaderText="Observações" SortExpression="trf_observacoes" />
                       
                        
                      
                    </Columns>
                </asp:GridView>
                
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConnectionString="<%$ ConnectionStrings:realappConnectionString %>"
                    SelectCommand="select Hot.hot_nome, Trf.trf_nome, Tip.tip_nome, Epo.epo_nome, Trf.trf_valor, Trf.trf_observacoes
                                   From Tarifas as Trf
                                   inner join Hoteis as Hot on Trf.hot_id = Hot.hot_id
                                   inner join Tipologia as Tip on Trf.tip_id = Tip.tip_id
                                   inner join Epoca as Epo on Trf.epo_id = Epo.epo_id
                                   inner join Anos on Trf.ano_id = Anos.ano_id
                                   where Hot.hot_nome like @hot_nome and Epo.epo_nome like @epo_nome and Anos.ano like @ano">
                    <SelectParameters>                     
                        <asp:ControlParameter Name="ano" ControlID="dropAno" Type="String" PropertyName="SelectedValue" />
                        <asp:ControlParameter Name="hot_nome" ControlID="dropHoteis" Type="String" PropertyName="SelectedValue" />
                        <asp:ControlParameter Name="epo_nome" ControlID="dropEpoca" Type="String" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>

                        </div>
        
         </div>

</asp:Content>
