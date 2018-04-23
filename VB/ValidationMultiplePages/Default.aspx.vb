Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls

Partial Public Class Editors_Validation_ValidationMultiplePages
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

	End Sub
	Protected Sub OnSumbitButtonClick(ByVal sender As Object, ByVal e As EventArgs)
		Form.Controls.Add(New LiteralControl("<h1>" & "<span style=""color: #2159D6;"">B</span>" & "<span style=""color: #E74931;"">i</span>" & "<span style=""color: #FFCF00;"">n</span>" & "<span style=""color: #2159D6;"">g</span>" & "<span style=""color: #31B639;"">o</span>" & "<span style=""color: #E74931;"">!</span>" & "</h1>"))
	End Sub
End Class
