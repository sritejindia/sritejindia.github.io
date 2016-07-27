<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AppPage.aspx.cs" Inherits="IntegrationPage.AppPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Integration Page</title>
    <style type="text/css">
        section {
            margin: 10px 20px;
        }

        td {
            border:solid;
        }
    </style>
    <script src="Scripts/jquery.min.js"></script>
</head>
<body>
    <section id="SearchCriteriaSection">
        
            <fieldset>
                <legend>Search for Licenses</legend>
                <label for="BoardList">Board of Registration</label>
                <select id="BoardList">
                    <option value="Board of Sanitarian">Board of Sanitarian</option>
                    <option value="Board of Social Workers">Board of Social Workers</option>
                    <option value="Board of Funeral Directors">Board of Funeral Directors</option>
                </select>
                <br />
                <label for="complaintNumber">Complaint Number</label>
                <input type="text" id="complaintNumber" />
                <br />
                <label for="startDate">Start Date</label>
                <input type="date" id="startDate" />
                <label for="endDate">End Date</label>
                <input type="date" id="endDate" />
                <br />
                <button id="submit">Search</button>
            </fieldset>
        

        <script type="text/javascript">
            $(function () {
                $("#submit").click(function () {
                    var boardName = $("#BoardList").val();
                    var complaintNbr = $("#complaintNumber").val();
                    var startDate = $("#startDate").val();
                    var endDate = $("#endDate").val();
                    //console.log("The board name is " + boardName);
                    //console.log("The complaint number is " + complaintNbr);
                    //console.log("The start date is " + startDate);
                    //console.log("The end date is " + endDate);
                });
                $("#sortBy").change(function () {
                    alert("Value is " + this.options[this.selectedIndex].value);
                });
            
                var licenseeInformation =
                    [{ "boardName": "Board of Sanitarians", "ComplaintNumber": "14", "licenseeName": "Sritej", "actionDate": "2015/01/25", "boardDecision": "818d3db8488448f9" },
                     { "boardName": "Board of Registration of Electricians", "ComplaintNumber": "15", "licenseeName": "Sairaj", "actionDate": "2014/02/29", "boardDecision": "855c5763bd08c8c9" },
                     { "boardName": "Board of Social Workers", "ComplaintNumber": "16", "licenseeName": "Prakash", "actionDate": "2016/07/30", "boardDecision": "f980dcaba7b77974" }];

                function SortByLicenseeName(x, y) {
                    return ((x.licenseeName == y.licenseeName) ? 0 : ((x.licenseeName > y.licenseeName) ? 1 : -1));
                }
            });
        </script>
    </section>
    <section id="SearchResults">

        <label for="sortBy">Sort By: </label>
        <select id="sortBy">
            <option value="Licensee Name">Licensee Name</option>
            <option value="Complaint Number">Complaint Number</option>
        </select>

        <table id="resultsTable">
            <caption>Licensees Discipline History</caption>
            <thead>
                <tr>
                    <td>Action Date</td>
                    <td>Licensee Name</td>
                    <td>Board of Registration</td>
                    <td>Board Decision</td>
                    <td>Complaint Number</td>
                </tr>
            </thead>
        </table>
    </section>
</body>
</html>
