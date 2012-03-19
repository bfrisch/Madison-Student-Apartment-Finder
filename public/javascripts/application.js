// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function displayPriceCriteria()
{
	return "<form method=\"GET\"><input type=\"text\" name=\"Price\" value=\"Maximum Price\"/></form>";
}

function displayLocationCriteria()
{
	return "<form method=\"GET\"><input type=\"text\" name=\"Location\" value=\"Address\"/></form>";
}

function displayTypeCriteria()
{
	return "<form method=\"GET\"><input type=\"checkbox\" name=\"Type\" value=\"Apartment\">Apartment</input><br /><input type=\"checkbox\" name=\"Type\" value=\"House\">House</input><br /><input type=\"checkbox\" name=\"Type\" value=\"Townhouse\">Townhouse</input></form>";
}

function displayResDetailsCriteria()
{
	return "<form method=\"GET\">Number of Bedrooms<br /><input type=\"text\" name=\"Bedrooms\" value=\"Maximum 8\" /><br /><br />Number of Bathrooms<br /><input type=\"text\" name=\"Bathrooms\" value=\"Maximum 4\" /></form>";
}

function displayLeaseDetails()
{
	return "<form method=\"GET\">Start Date:<br /><input type=\"radio\" name=\"Start\" value\"Fall\">Fall</input><br /><input type=\"radio\" name=\"Start\" value\"Winter\">Winter</input></form><br /><form method=\"GET\">End Date:<br /><input type=\"radio\" name=\"End\" value\"Winter\">Winter</input><br /><input type=\"radio\" name=\"End\" value\"Spring\">Spring</input><br /><input type=\"radio\" name=\"End\" value\"Summer\">Summer</input></form><br /><form method=\"GET\">Length:<br /><input type=\"radio\" name=\"Length\" value\"6 Months\">6 Months</input><br /><input type=\"radio\" name=\"Length\" value\"9 Months\">9 Months</input><br /><input type=\"radio\" name=\"Length\" value\"12 Months\">12 Months</input>";
}

function setUnclicked(id)
{
	var html = "<p onclick=\"setClicked('"+id+"')\">"+id+"</p>";
	
	switch(id)
	{
		case "Type_of_Residence":
			html = "<p onclick=\"setClicked('Type_of_Residence')\">Type of Residence</p>";
			break;
		case "Residence_Details":
			html = "<p onclick=\"setClicked('Residence_Details')\">Residence Details</p>";
			break;
		case "Lease_Details":
			html = "<p onclick=\"setClicked('Lease_Details')\">Lease Details</p>";
			break;
	}
	
	document.getElementById(id).innerHTML=html;
}

function setClicked(id)
{
	var html = "<div id=\"Criteria_Clicked\"><p onclick=\"setUnclicked('"+id+"')\">"+id+"</p>";
	
	switch(id){
		case "Price":
			html += displayPriceCriteria();
			break;
		case "Location":
			html += displayLocationCriteria();
			break;
		case "Type_of_Residence": 
			html = "<div id=\"Criteria_Clicked\"><p onclick=\"setUnclicked('Type_of_Residence')\">Type of Residence</p>";
			html += displayTypeCriteria();
			break;
		case "Residence_Details": 
			html = "<div id=\"Criteria_Clicked\"><p onclick=\"setUnclicked('Residence_Details')\">Residence Details</p>";
			html += displayResDetailsCriteria();
			break;
		case "Lease_Details": 
			html = "<div id=\"Criteria_Clicked\"><p onclick=\"setUnclicked('Lease_Details')\">Lease Details</p>";
			html += displayLeaseDetails();
			break;
		case "Utilities":
			break;
		case "Accomodations":
			break;
		case "Restrictions":
			break;
	}
	
	html += "</div>"
	document.getElementById(id).innerHTML=html;
}