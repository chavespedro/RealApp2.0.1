<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Fotografias.aspx.vb" Inherits="realapp.Fotografias" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    

    <style type="text/css">

        .modal{
            margin-left:0px;
        }
        body .modal {
            /* new custom width */
            width: 1200px;            
        }
          .modal-content {
    width: 850px;
    /*margin:auto;*/
  }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <%-- criar modal popups para cada Hotel para mostrar a galeria de fotos --%>

    <br />
    <div class="row">
        <div class="col-lg-4">
            <a href="GrandeRealVillaItalia.aspx" ><asp:Image ID="image1" runat="server" ImageUrl="http://realhotelsgroup.com/RealApp/Logos/logo-grvi.png" /></a>
            </div>
        <div class="col-lg-4">
            
    <a href="HotelRealOeiras.aspx" ><asp:Image ID="image4" runat="server" ImageUrl="http://realhotelsgroup.com/RealApp/Logos/logo-roe.png" /></a>
    
        </div>
        <div class="col-lg-4">
    <a href="HotelRealPalacio.aspx" ><asp:Image ID="image5" runat="server" ImageUrl="http://realhotelsgroup.com/RealApp/Logos/logo-rpl.png" /></a>
    </div>
    </div>
   <div class="row">
       <div class="col-lg-4">
           <a href="HotelRealParque.aspx"><asp:Image ID="image6" runat="server" ImageUrl="http://realhotelsgroup.com/RealApp/Logos/logo-rpq.png" /></a>
           </div>
       <div class="col-lg-4">
            <a href="RealResidencia.aspx"><asp:Image ID="image7" runat="server" ImageUrl="http://realhotelsgroup.com/RealApp/Logos/logo-rrs.png" /></a>
           </div>
       <div class="col-lg-4">
           <a href="GrandeRealSantaEulalia.aspx" ><asp:Image ID="image2" runat="server" ImageUrl="http://realhotelsgroup.com/RealApp/Logos/logo-grse.png" /></a>
           </div>
       </div>

    <div class="row">
        <div class="col-lg-4">
            <a href="RealBellavistaHotelSpa.aspx"><asp:Image ID="image9" runat="server" ImageUrl="http://realhotelsgroup.com/RealApp/Logos/logo-rbv.png" /></a>
            </div>
        <div class="col-lg-4">
             <a href="RealMarinaHotelSpa.aspx" ><asp:Image ID="image3" runat="server" ImageUrl="http://realhotelsgroup.com/RealApp/Logos/logo-rmo.png" /></a>
            </div>
        <div class="col-lg-4">
            <a href="RealMarinaResidence.aspx"><asp:Image ID="image8" runat="server" ImageUrl="http://realhotelsgroup.com/RealApp/Logos/logo-rmr.png" /></a>
            </div>
        </div>
           
   

   
    
    



</asp:Content>