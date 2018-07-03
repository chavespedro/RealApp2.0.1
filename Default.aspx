<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="realapp._Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
 <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">

    <style type="text/css">
        .myCalendar .myCalendarToday {
            background-color: #f2f2f2;
            -webkit-box-shadow: 1px 1px 8px 1px #8f8f8f;
            box-shadow: 1px 1px 8px 1px #8f8f8f;
            display: inline-block;
            width: 22px !important;
            height: 19px !important;
            border: 2px solid #f2f2f2;
            margin-left: -1px;
            margin-top: -1px;
            position: relative;
        }

            .myCalendar .myCalendarToday a {
                color: #25bae5 !important;
                font-weight: bold;
            }

                .myCalendar .myCalendarToday a:after {
                    content: "TODAY";
                    color: #000;
                    font-size: 0.5em;
                    display: inline-block;
                    pointer-events: none;
                    width: 100%;
                    float: left;
                }

        .myCalendar .myCalendarDay a:hover,
        .myCalendar .myCalendarSelector a:hover {
            background-color: #25bae5;
        }





        .modal.modal-wide .modal-dialog {
            width: 70%;
        }

        .modal-wide .modal-body {
            overflow-y: auto;
        }

        #tallModal .modal-body p {
            margin-bottom: 900px;
        }


        .Calendar {
            width: 100%;
            border-color: #E9E9E9;
        }

        .SelectedDayStyle {
            background: #f4f4f4;
            color: Maroon;
        }

        .TodayDayStyle {
            background-color: #000000;
            color: White;
        }

        .OtherMonthDayStyle {
            color: #cccccc;
        }

        .DayHeaderStyle {
            background-color: #e9e9e9;
            background-image: url(images/blog/cal-header-bg.jpg);
        }

        .DayStyle {
            border: 1px solid #cccccc;
            height: 40px;
        }

        .TitleStyle {
            background-color: #ffffff;
            color: #000000;
            padding: 2px;
        }
    </style>
    <br />
    <ul class="breadcrumb">
        <li class="active">Home</li>
    </ul>

    <!--
    <span class="label label-default">Home</span>-->
    <div class="panel panel-primary">

        <div class="panel-body">


            <br />
            <br />
<%--            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" AllowPaging="true"
                PageSize="10" Visible="false">
            </asp:GridView>--%>
            <div class="row">
                <div class="col-sm-4">

                    <asp:LoginView ID="LoginView1" runat="server">
                        <RoleGroups>
                            <asp:RoleGroup Roles="Administrador">
                                <ContentTemplate>
                                    <span style="font-size: 18px;">Benvindo(a), 
 
                        <%: Context.User.Identity.Name %>!</span>


                                </ContentTemplate>
                            </asp:RoleGroup>
                            <asp:RoleGroup Roles="Utilizador">
                                <ContentTemplate>
                                    <span style="font-size: 18px;">Benvindo(a),

                         <%: Context.User.Identity.Name %>!</span>


                                </ContentTemplate>
                            </asp:RoleGroup>
                            <asp:RoleGroup Roles="Supervisor">
                                <ContentTemplate>
                                    <span style="font-size: 18px;">Benvindo(a),

                         <%: Context.User.Identity.Name %>!</span>


                                </ContentTemplate>
                            </asp:RoleGroup>
                        </RoleGroups>
                    </asp:LoginView>
                </div>
                <div class="col-sm-4">
                </div>
                <div class="col-sm-4">
                    <%--    <asp:Button ID="butCartaoVisita" runat="server" Text="Cartão Visita" PostBackUrl="~/CartaoVisita.aspx" />--%>
                </div>
            </div>

            <br />
            <br />



            <asp:Calendar
                ID="calTraining" runat="server" BackColor="#f2f2f2" BorderColor="#f2f2f2" BorderStyle="Double"
                CellPadding="4" DayNameFormat="Short" Font-Names="Verdana" Font-Size="12pt"
                ForeColor="Black" ShowNextPrevMonth="true" Height="200px" Width="800px" Font-Bold="true"
                ShowGridLines="true" FirstDayOfWeek="Monday" CssClass="myCalendar" TodayDayStyle-CssClass="myCalendarToday"
                TitleStyle-CssClass="myCalendarTitle" DayHeaderStyle-CssClass="myCalendarDayHeader">
                <SelectedDayStyle BackColor="#F4F4F4" ForeColor="Maroon" />
                <TodayDayStyle BackColor="#f5f5f5" ForeColor="black" />
                <OtherMonthDayStyle ForeColor="#CCCCCC" />
                <DayHeaderStyle BackColor="#E9E9E9" HorizontalAlign="Center" />
                <DayStyle BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Height="80px" Width="50px" HorizontalAlign="Center" />
                <TitleStyle BackColor="White" ForeColor="Black" />
            </asp:Calendar>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:realAppConnectionString %>"
                ProviderName="<%$ ConnectionStrings:realAppConnectionString.ProviderName %>"
                SelectCommand="select Vis.vis_data, Prom.prom_nome, Ent.ent_nome, Cont.cont_nome, Cont.cont_telefone, Cont.cont_morada, Cont.cont_codigopostal, Cont.cont_localidade, Cont.cont_email
                           From Visitas as Vis
                           inner join Promotores as Prom on Vis.prom_id = Prom.prom_id
                           inner join Entidades as Ent on Vis.ent_id = Ent.ent_id
                           inner join Contacto as Cont on Ent.ent_id = Cont.ent_id
                           WHERE vis_data = @datavisita">
                <SelectParameters>
                    <asp:Parameter Name="datavisita" Type="DateTime" />
                </SelectParameters>
            </asp:SqlDataSource>


            <hr />

            <h3>@Real App 1.0</h3>




        </div>
    </div>
</asp:Content>
