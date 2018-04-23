<%-- BeginRegion Page Settings --%>
<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="Editors_Validation_ValidationMultiplePages" %>
<%@ Register Assembly="DevExpress.Web.v8.2" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v8.2" Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.v8.2" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxpgc" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.2" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%-- EndRegion --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
	<title>Validation within a multipage container</title>
	<%-- BeginRegion CSS --%>
	<style type="text/css">
		 td.Label {
			white-space: nowrap;
			width: 100px;
			font-size: 12px;
		 }
	</style>
	<%-- EndRegion --%>
	<script type="text/javascript">
		// PageControl
function OnPageControlActiveTabChanged(s, e) {
	UpdatePrevNextEnabledState();
}

// Prev/Next Buttons
function OnPrevButtonClick(s, e) {
	SetActiveTab(-1);
	UpdatePrevNextEnabledState();
}
function OnNextButtonClick(s, e) {
	SetActiveTab(1);
	UpdatePrevNextEnabledState();
}
function SetActiveTab(tabIndexIncrement) {
	var activeTabIndex = PageControl.GetActiveTab().index;
	activeTabIndex += tabIndexIncrement;
	PageControl.SetActiveTab(PageControl.GetTab(activeTabIndex));
}
function UpdatePrevNextEnabledState() {
	var activeTabIndex = PageControl.GetActiveTab().index;
	PrevButton.SetEnabled(activeTabIndex > 0);
	NextButton.SetEnabled(activeTabIndex < PageControl.GetTabCount() - 1);
}

// Submit Button
function OnSumbitButtonClick(s, e) {
	var tabPageCount = PageControl.GetTabCount();
	for(var i = 0; i < tabPageCount; i++) {
		PageControl.SetActiveTab(PageControl.GetTab(i));
		var editorsContainerId = "tblContainer" + i;
		if (!ASPxClientEdit.ValidateEditorsInContainerById(editorsContainerId)) {
			e.processOnServer = false;
			break;
		}
	}
}

// Validation Event Handlers
function OnAgeValidation(s, e) {
	var age = e.value;
	if (age == null || age == "")
		return;
	var digits = "0123456789";
	for (var i = 0; i < age.length; i++) {
		if (digits.indexOf(age.charAt(i)) == -1) {
			e.isValid = false;
			break;
		}
	}
	if (e.isValid && age.charAt(0) == "0") {
		age = age.replace(/^0+/, "");
		if (age.length == 0)
			age = "0";
		e.value = age;
	 }
	 if (age < 18)
		 e.isValid = false;
}
	</script>
</head>
<body>
	<form id="form1" runat="server">
		<div>


			<dxp:ASPxPanel ID="pnlDefaultButtonOwner" runat="server" Width="200px" DefaultButton="btnSubmit">
				<PanelCollection>
					<dxp:PanelContent>
						<dxpgc:ASPxPageControl ID="pgcPageControl" runat="server" ClientInstanceName="PageControl" Width="550px" Height="130px">
							<ClientSideEvents ActiveTabChanged="OnPageControlActiveTabChanged" />
							<TabPages>
								<%-- BeginRegion Personal Info --%>
								<dxpgc:TabPage Name="PersonalInfo" Text="Personal Info">
									<ContentCollection>
										<dxw:ContentControl runat="server">
											<table id="tblContainer0">
												<tr>
													<td class="Label">
														First Name:
													</td>
													<td>
														<dxe:ASPxTextBox ID="tbFirstName" runat="server" Width="170px">
															<ClientSideEvents Init="function(s, e) { s.Focus(); }" />
															<ValidationSettings SetFocusOnError="True">
																<RequiredField IsRequired="True" />
															</ValidationSettings>
														</dxe:ASPxTextBox>
													</td>
												</tr>
												<tr>
													<td class="Label">
														Last Name:
													</td>
													<td>
														<dxe:ASPxTextBox ID="tbLastName" runat="server" Width="170px">
															<ValidationSettings SetFocusOnError="True">
																<RequiredField IsRequired="True" />
															</ValidationSettings>
														</dxe:ASPxTextBox>
													</td>
												</tr>
												<tr>
													<td class="Label">
														Age:
													</td>
													<td>
														<dxe:ASPxTextBox ID="tbAge" runat="server" Width="170px">
															<ClientSideEvents Validation="OnAgeValidation" />
															<ValidationSettings SetFocusOnError="True" ErrorText="Age must be greater than or equal 18">
																<RequiredField IsRequired="True" />
															</ValidationSettings>
														</dxe:ASPxTextBox>
													</td>
												</tr>
											</table>
										</dxw:ContentControl>
									</ContentCollection>
								</dxpgc:TabPage>
								<%-- EndRegion --%>
								<%-- BeginRegion Occupation --%>
								<dxpgc:TabPage>
									<ContentCollection>
										<dxw:ContentControl runat="server">
											<table id="tblContainer1">
												<tr>
													<td class="Label">
														Company Name:
													</td>
													<td>
														<dxe:ASPxTextBox ID="tbCompanyName" runat="server" Width="170px">
															<ValidationSettings SetFocusOnError="True">
																<RequiredField IsRequired="True" />
															</ValidationSettings>
														</dxe:ASPxTextBox>
													</td>
												</tr>
												<tr>
													<td class="Label">
														Industry:
													</td>
													<td>
														<dxe:ASPxComboBox ID="cbIndustry" runat="server" SelectedIndex="0" ValueType="System.String" Width="170px">
															<ClientSideEvents GotFocus="function(s, e) {  }" />
															<ValidationSettings SetFocusOnError="True">
																<RequiredField IsRequired="True" />
															</ValidationSettings>
															<Items>
																<dxe:ListEditItem Value="" />
																<dxe:ListEditItem Value="Accounting" />
																<dxe:ListEditItem Value="Airlines/Aviation" />
																<dxe:ListEditItem Value="Alternative Dispute Resolution" />
																<dxe:ListEditItem Value="Alternative Medicine" />
																<dxe:ListEditItem Value="Animation" />
																<dxe:ListEditItem Value="Apparel &amp; Fashion" />
																<dxe:ListEditItem Value="Architecture &amp; Planning" />
																<dxe:ListEditItem Value="Arts and Crafts" />
																<dxe:ListEditItem Value="Automotive" />
																<dxe:ListEditItem Value="Aviation &amp; Aerospace" />
																<dxe:ListEditItem Value="Banking" />
																<dxe:ListEditItem Value="Biotechnology" />
																<dxe:ListEditItem Value="Broadcast Media" />
																<dxe:ListEditItem Value="Building Materials" />
																<dxe:ListEditItem Value="Business Supplies and Equipment" />
																<dxe:ListEditItem Value="Capital Markets" />
																<dxe:ListEditItem Value="Chemicals" />
																<dxe:ListEditItem Value="Civic &amp; Social Organization" />
																<dxe:ListEditItem Value="Civil Engineering" />
																<dxe:ListEditItem Value="Commercial Real Estate" />
																<dxe:ListEditItem Value="Computer &amp; Network Security" />
																<dxe:ListEditItem Value="Computer Games" />
																<dxe:ListEditItem Value="Computer Hardware" />
																<dxe:ListEditItem Value="Computer Networking" />
																<dxe:ListEditItem Value="Computer Software" />
																<dxe:ListEditItem Value="Construction" />
																<dxe:ListEditItem Value="Consumer Electronics" />
																<dxe:ListEditItem Value="Consumer Goods" />
																<dxe:ListEditItem Value="Consumer Services" />
																<dxe:ListEditItem Value="Cosmetics" />
																<dxe:ListEditItem Value="Dairy" />
																<dxe:ListEditItem Value="Defense &amp; Space" />
																<dxe:ListEditItem Value="Design" />
																<dxe:ListEditItem Value="Education Management" />
																<dxe:ListEditItem Value="E-Learning" />
																<dxe:ListEditItem Value="Electrical/Electronic Manufacturing" />
																<dxe:ListEditItem Value="Entertainment" />
																<dxe:ListEditItem Value="Environmental Services" />
																<dxe:ListEditItem Value="Events Services" />
																<dxe:ListEditItem Value="Executive Office" />
																<dxe:ListEditItem Value="Facilities Services" />
																<dxe:ListEditItem Value="Farming" />
																<dxe:ListEditItem Value="Financial Services" />
																<dxe:ListEditItem Value="Fine Art" />
																<dxe:ListEditItem Value="Fishery" />
																<dxe:ListEditItem Value="Food &amp; Beverages" />
																<dxe:ListEditItem Value="Food Production" />
																<dxe:ListEditItem Value="Fund-Raising" />
																<dxe:ListEditItem Value="Furniture" />
																<dxe:ListEditItem Value="Gambling &amp; Casinos" />
																<dxe:ListEditItem Value="Glass, Ceramics &amp; Concrete" />
																<dxe:ListEditItem Value="Government Administration" />
																<dxe:ListEditItem Value="Government Relations" />
																<dxe:ListEditItem Value="Graphic Design" />
																<dxe:ListEditItem Value="Health, Wellness and Fitness" />
																<dxe:ListEditItem Value="Higher Education" />
																<dxe:ListEditItem Value="Hospital &amp; Health Care" />
																<dxe:ListEditItem Value="Hospitality" />
																<dxe:ListEditItem Value="Human Resources" />
																<dxe:ListEditItem Value="Import and Export" />
																<dxe:ListEditItem Value="Individual &amp; Family Services" />
																<dxe:ListEditItem Value="Industrial Automation" />
																<dxe:ListEditItem Value="Information Services" />
																<dxe:ListEditItem Value="Information Technology and Services" />
																<dxe:ListEditItem Value="Insurance" />
																<dxe:ListEditItem Value="International Affairs" />
																<dxe:ListEditItem Value="International Trade and Development" />
																<dxe:ListEditItem Value="Internet" />
																<dxe:ListEditItem Value="Investment Banking" />
																<dxe:ListEditItem Value="Investment Management" />
																<dxe:ListEditItem Value="Judiciary" />
																<dxe:ListEditItem Value="Law Enforcement" />
																<dxe:ListEditItem Value="Law Practice" />
																<dxe:ListEditItem Value="Legal Services" />
																<dxe:ListEditItem Value="Legislative Office" />
																<dxe:ListEditItem Value="Leisure, Travel &amp; Tourism" />
																<dxe:ListEditItem Value="Libraries" />
																<dxe:ListEditItem Value="Logistics and Supply Chain" />
																<dxe:ListEditItem Value="Luxury Goods &amp; Jewelry" />
																<dxe:ListEditItem Value="Machinery" />
																<dxe:ListEditItem Value="Management Consulting" />
																<dxe:ListEditItem Value="Maritime" />
																<dxe:ListEditItem Value="Market Research" />
																<dxe:ListEditItem Value="Marketing and Advertising" />
																<dxe:ListEditItem Value="Mechanical or Industrial Engineering" />
																<dxe:ListEditItem Value="Media Production" />
																<dxe:ListEditItem Value="Medical Devices" />
																<dxe:ListEditItem Value="Medical Practice" />
																<dxe:ListEditItem Value="Mental Health Care" />
																<dxe:ListEditItem Value="Military" />
																<dxe:ListEditItem Value="Mining &amp; Metals" />
																<dxe:ListEditItem Value="Motion Pictures and Film" />
																<dxe:ListEditItem Value="Museums and Institutions" />
																<dxe:ListEditItem Value="Music" />
																<dxe:ListEditItem Value="Nanotechnology" />
																<dxe:ListEditItem Value="Newspapers" />
																<dxe:ListEditItem Value="Non-Profit Organization Management" />
																<dxe:ListEditItem Value="Oil &amp; Energy" />
																<dxe:ListEditItem Value="Online Media" />
																<dxe:ListEditItem Value="Outsourcing/Offshoring" />
																<dxe:ListEditItem Value="Package/Freight Delivery" />
																<dxe:ListEditItem Value="Packaging and Containers" />
																<dxe:ListEditItem Value="Paper &amp; Forest Products" />
																<dxe:ListEditItem Value="Performing Arts" />
																<dxe:ListEditItem Value="Pharmaceuticals" />
																<dxe:ListEditItem Value="Philanthropy" />
																<dxe:ListEditItem Value="Photography" />
																<dxe:ListEditItem Value="Plastics" />
																<dxe:ListEditItem Value="Political Organization" />
																<dxe:ListEditItem Value="Primary/Secondary Education" />
																<dxe:ListEditItem Value="Printing" />
																<dxe:ListEditItem Value="Professional Training &amp; Coaching" />
																<dxe:ListEditItem Value="Program Development" />
																<dxe:ListEditItem Value="Public Policy" />
																<dxe:ListEditItem Value="Public Relations and Communications" />
																<dxe:ListEditItem Value="Public Safety" />
																<dxe:ListEditItem Value="Publishing" />
																<dxe:ListEditItem Value="Railroad Manufacture" />
																<dxe:ListEditItem Value="Ranching" />
																<dxe:ListEditItem Value="Real Estate" />
																<dxe:ListEditItem Value="Recreational Facilities and Services" />
																<dxe:ListEditItem Value="Religious Institutions" />
																<dxe:ListEditItem Value="Renewables &amp; Environment" />
																<dxe:ListEditItem Value="Research" />
																<dxe:ListEditItem Value="Restaurants" />
																<dxe:ListEditItem Value="Retail" />
																<dxe:ListEditItem Value="Security and Investigations" />
																<dxe:ListEditItem Value="Semiconductors" />
																<dxe:ListEditItem Value="Shipbuilding" />
																<dxe:ListEditItem Value="Sporting Goods" />
																<dxe:ListEditItem Value="Sports" />
																<dxe:ListEditItem Value="Staffing and Recruiting" />
																<dxe:ListEditItem Value="Supermarkets" />
																<dxe:ListEditItem Value="Telecommunications" />
																<dxe:ListEditItem Value="Textiles" />
																<dxe:ListEditItem Value="Think Tanks" />
																<dxe:ListEditItem Value="Tobacco" />
																<dxe:ListEditItem Value="Translation and Localization" />
																<dxe:ListEditItem Value="Transportation/Trucking/Railroad" />
																<dxe:ListEditItem Value="Utilities" />
																<dxe:ListEditItem Value="Venture Capital &amp; Private Equity" />
																<dxe:ListEditItem Value="Veterinary" />
																<dxe:ListEditItem Value="Warehousing" />
																<dxe:ListEditItem Value="Wholesale" />
																<dxe:ListEditItem Value="Wine and Spirits" />
																<dxe:ListEditItem Value="Wireless" />
																<dxe:ListEditItem Value="Writing and Editing" />
															</Items>
														</dxe:ASPxComboBox>
													</td>
												</tr>
												<tr>
													<td class="Label">
														Position:
													</td>
													<td>
														<dxe:ASPxTextBox ID="tbPosition" runat="server" Width="170px">
															<ValidationSettings SetFocusOnError="True">
																<RequiredField IsRequired="True" />
															</ValidationSettings>
														</dxe:ASPxTextBox>
													</td>
												</tr>
											</table>
										</dxw:ContentControl>
									</ContentCollection>
								</dxpgc:TabPage>
								<%-- EndRegion --%>
								<%-- BeginRegion Contact Information --%>
								<dxpgc:TabPage Name="ContactInformation" Text="Contact Information">
									<ContentCollection>
										<dxw:ContentControl runat="server">
											<table id="tblContainer2">
												<tr>
													<td class="Label">
														E-mail:
													</td>
													<td>
														<dxe:ASPxTextBox ID="tbEmail" runat="server" Width="170px">
															<ValidationSettings SetFocusOnError="True">
																<RequiredField IsRequired="True" />
																<RegularExpression ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorText="Invalid email" />
															</ValidationSettings>
														</dxe:ASPxTextBox>
													</td>
												</tr>
												<tr>
													<td class="Label">
														Phone Number:
													</td>
													<td>
														<dxe:ASPxTextBox ID="tbPhoneNumber" runat="server" Width="170px">
															<ValidationSettings SetFocusOnError="True">
																<RequiredField IsRequired="True" />
															</ValidationSettings>
														</dxe:ASPxTextBox>
													</td>
												</tr>
											</table>
										</dxw:ContentControl>
									</ContentCollection>
								</dxpgc:TabPage>
								<%-- EndRegion --%>
							</TabPages>
						</dxpgc:ASPxPageControl>
					</dxp:PanelContent>
				</PanelCollection>
			</dxp:ASPxPanel>

			<%-- BeginRegion Buttons --%>
			<table>
				<tr>
					<td>
						<table>
							<tr>
								<td>
									<dxe:ASPxButton ID="btnPrev" runat="server" Text="Prev" ClientEnabled="False" AutoPostBack="False" 
										ClientInstanceName="PrevButton" CausesValidation="False" Width="60px" UseSubmitBehavior="False">
										<ClientSideEvents Click="OnPrevButtonClick" />
									</dxe:ASPxButton>
								</td>
								<td>
									<dxe:ASPxButton ID="btnNext" runat="server" Text="Next" AutoPostBack="False"
										ClientInstanceName="NextButton" CausesValidation="False" Width="60px" UseSubmitBehavior="False">
										<ClientSideEvents Click="OnNextButtonClick" />
									</dxe:ASPxButton>
								</td>
							</tr>
						</table>
					</td>
					<td class="Spacer" style="width: 340px">&nbsp;</td>
					<td>
						<dxe:ASPxButton ID="btnSubmit" runat="server" Text="Submit" Width="60px" CausesValidation="False" OnClick="OnSumbitButtonClick"
							UseSubmitBehavior="False">
							<ClientSideEvents Click="OnSumbitButtonClick" />
						</dxe:ASPxButton>
					</td>
				</tr>
			</table>
			<%-- EndRegion --%>
		</div>
	</form>
</body>
</html>