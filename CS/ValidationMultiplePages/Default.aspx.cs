using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Editors_Validation_ValidationMultiplePages : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {

    }
    protected void OnSumbitButtonClick(object sender, EventArgs e) {
        Form.Controls.Add(new LiteralControl(
            "<h1>" +
            "<span style=\"color: #2159D6;\">B</span>" +
            "<span style=\"color: #E74931;\">i</span>" +
            "<span style=\"color: #FFCF00;\">n</span>" +
            "<span style=\"color: #2159D6;\">g</span>" +
            "<span style=\"color: #31B639;\">o</span>" +
            "<span style=\"color: #E74931;\">!</span>" +
            "</h1>"));
    }
}
