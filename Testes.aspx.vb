Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient


Public Class Testes
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'If Not Me.IsPostBack Then
        '    Me.BindGrid()
        'End If
    End Sub




    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs)


        txtEntidade.Text = GridView1.SelectedRow.Cells(0).Text



    End Sub


End Class