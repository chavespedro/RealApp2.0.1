<%@ Page Title="Adicionar Tarifas" Language="vb" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="AdicionarTarifas.aspx.vb" Inherits="realapp.AdicionarTarifas" %>
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
        <li class="active">Adicionar Tarifas</li>
    </ul>

   
        <h3>Adicionar Tarifas</h3>

     <div class="panel panel-primary">

            <div class="panel-body">

                <div class="row">
                    <div class="col-md-4">
    <span style="font:18px century gothic;">Ano:</span> <asp:DropDownList ID="dropAno" runat="server" DataSourceID="SqlDataSource5"
        DataTextField="ano" DataValueField="ano"></asp:DropDownList>

        <asp:SqlDataSource ID="SqlDataSource5" runat="server"
            ConnectionString="<%$ ConnectionStrings:realappConnectionString %>"
            SelectCommand="SELECT [ano] FROM [Anos]"></asp:SqlDataSource>
                        </div>
                    <div class="col-md-4">
        

    <span style="font:18px century gothic;">Época:</span>

    <asp:DropDownList ID="dropEpoca" runat="server"
        DataSourceID="SqlDataSource2" DataTextField="epo_nome" DataValueField="epo_nome">
        </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:realappConnectionString %>" SelectCommand="SELECT [epo_nome] FROM [Epoca]"></asp:SqlDataSource>
         </div>
                    <div class="col-md-4">
      
   
        <span style="font:18px century gothic;">Tipologia:</span>

    <asp:DropDownList ID="dropTipologia" runat="server"
        DataSourceID="SqlDataSource3" DataTextField="tip_nome" DataValueField="tip_nome">

    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:realappConnectionString %>" SelectCommand="SELECT [tip_nome] FROM [Tipologia]"></asp:SqlDataSource>
     </div>
                    <div class="col-md-4">
        <br />

    <span style="font:18px century gothic;">Hotel:</span> <asp:DropDownList ID="dropHoteis" runat="server"
        DataSourceID="SqlDataSource4" DataTextField="hot_nome" DataValueField="hot_nome"></asp:DropDownList>

    <asp:SqlDataSource ID="SqlDataSource4" runat="server"
        ConnectionString="<%$ ConnectionStrings:realappConnectionString %>"
        SelectCommand="SELECT [hot_nome] FROM [Hoteis]"></asp:SqlDataSource>
 </div>
                     </div>
                    <div class="row">
                    <div class="col-md-4">
        <br />

    <span style="font:18px century gothic;">Nome Tarifa:</span> <asp:TextBox ID="txtTarifa" runat="server" CssClass="form-control" Font-Size="Large"></asp:TextBox>
</div>
                         <div class="col-md-4">
    <br />

    <span style="font:18px century gothic;">Valor:</span> <asp:TextBox ID="txtValor" runat="server" CssClass="form-control" Font-Size="Large"></asp:TextBox>
    
</div>
                         <div class="col-md-4">
    <br />


    <span style="font:18px century gothic;">Observações:</span> <asp:TextBox ID="txtObservacoes" runat="server" CssClass="form-control" Font-Size="Large"></asp:TextBox>

                             </div>
                                 </div>
        
    <br />

    <asp:Button ID="AdicionarTarifa" runat="server" Text="Adicionar Tarifa" OnClick="InserirTarifa" CssClass="btn btn-default" Font-Size="Large" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:realappConnectionString %>" 
        InsertCommand="INSERT INTO [Tarifas] ([epo_id], [tip_id], [hot_id], [ano_id], [trf_nome], [trf_valor], [trf_observacoes])
        VALUES ((select Epo.epo_id From Epoca as Epo where Epo.epo_nome like @epo_nome),
        (select Tip.tip_id From Tipologia as Tip where Tip.tip_nome like @tip_nome),
        (select Hot.hot_id From Hoteis as Hot where Hot.hot_nome like @hot_nome),
        (select Anos.ano_id From Anos Where Anos.ano like @ano),
        @txtTarifa, @txtValor, @txtObservacoes)">
        <InsertParameters>
             <asp:ControlParameter Name="epo_nome" ControlID="dropEpoca" Type="String" PropertyName="SelectedValue" />
             <asp:ControlParameter Name="tip_nome" ControlID="dropTipologia" Type="String" PropertyName="SelectedValue" />
             <asp:ControlParameter Name="hot_nome" ControlID="dropHoteis" Type="String" PropertyName="SelectedValue" />
             <asp:ControlParameter Name="ano" ControlID="dropAno" Type="String" PropertyName="SelectedValue" />
             <asp:ControlParameter Name="txtTarifa" ControlID="txtTarifa" Type="String" />
             <asp:ControlParameter Name="txtValor" ControlID="txtValor" Type="String" />
             <asp:ControlParameter Name="txtObservacoes" ControlID="txtObservacoes" Type="String" />
        </InsertParameters>        
     </asp:SqlDataSource>

                             </div>
        
         </div>
</asp:Content>
