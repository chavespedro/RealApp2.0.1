Public Class AdicionarTarifas
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.Page.User.Identity.IsAuthenticated Then
            FormsAuthentication.RedirectToLoginPage()
        End If
    End Sub

    Protected Sub InserirTarifa(sender As Object, e As EventArgs)
        SqlDataSource1.Insert()
    End Sub

End Class