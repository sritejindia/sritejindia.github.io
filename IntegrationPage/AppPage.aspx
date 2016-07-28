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
        
                    $("table#resultsTable tbody").empty();

                    $.each(licenseeInformation, function (index, element) {
                        $("table#resultsTable").append("<tr>"
                            + "<td>" + element.actionDate + "</td>"
                            + "<td>" + element.licenseeName + "</td>"
                            + "<td>" + element.boardName + "</td>"
                            + "<td>" + element.boardDecision + "</td>"
                            + "<td>" + element.ComplaintNumber + "</td>"
                            + "</tr>");
                    });
                });

                if ($("table#resultsTable tbody")[0].childElementCount > 0) {
                    $("#sortBy").change(changeDropDownValues);
                }

                var changeDropDownValues = function () {

                    $("table#resultsTable tbody").empty()

                    switch (this.options[this.selectedIndex].value) {
                        case "Action Date":
                            licenseeInformation.sort(SortByActionDate);
                            break;
                        case "Licensee Name":
                            licenseeInformation.sort(SortByLicenseeName);
                            break;
                        case "Board of Registration":
                            licenseeInformation.sort(SortByBoardName);
                            break;
                        case "Board Decision":
                            licenseeInformation.sort(SortByBoardDecision);
                            break;
                        case "Complaint Number":
                            licenseeInformation.sort(SortByComplaintNbr);
                            break;
                        default:
                            break;
                    }



                    $.each(licenseeInformation, function (index, element) {
                        $("table#resultsTable").append("<tr>"
                            + "<td>" + element.actionDate + "</td>"
                            + "<td>" + element.licenseeName + "</td>"
                            + "<td>" + element.boardName + "</td>"
                            + "<td>" + element.boardDecision + "</td>"
                            + "<td>" + element.ComplaintNumber + "</td>"
                            + "</tr>");
                    });
                };
            
                var licenseeInformation =
                    [{ "boardName": "Board of Sanitarians", "ComplaintNumber": "4", "licenseeName": "Sritej", "actionDate": "2015/01/25", "boardDecision": "SUSPENDED" },
                     { "boardName": "Board of Registration of Electricians", "ComplaintNumber": "215", "licenseeName": "Sairaj", "actionDate": "2014/02/29", "boardDecision": "CONVICTED" },
                     { "boardName": "Board of Social Workers", "ComplaintNumber": "16", "licenseeName": "Prakash", "actionDate": "2016/07/30", "boardDecision": "DISCIPLINE" },
                    { "boardName": "Board of Sanitarians", "ComplaintNumber": "2354", "licenseeName": "Sritej", "actionDate": "2015/01/25", "boardDecision": "SUSPENDED" },
                     { "boardName": "Board of Registration of Electricians", "ComplaintNumber": "115", "licenseeName": "Sairaj", "actionDate": "2014/02/29", "boardDecision": "CONVICTED" },
                     { "boardName": "Board of Social Workers", "ComplaintNumber": "16", "licenseeName": "Prakash", "actionDate": "2016/07/30", "boardDecision": "DISCIPLINE" },
                    { "boardName": "Board of Sanitarians", "ComplaintNumber": "300", "licenseeName": "Sritej", "actionDate": "2015/01/25", "boardDecision": "SUSPENDED" },
                     { "boardName": "Board of Registration of Electricians", "ComplaintNumber": "155", "licenseeName": "Sairaj", "actionDate": "2014/02/29", "boardDecision": "CONVICTED" },
                     { "boardName": "Board of Social Workers", "ComplaintNumber": "16", "licenseeName": "Prakash", "actionDate": "2016/07/30", "boardDecision": "DISCIPLINE" }, ];

                function SortByLicenseeName(x, y) {
                    return ((x.licenseeName == y.licenseeName) ? 0 : ((x.licenseeName > y.licenseeName) ? 1 : -1));
                }

                function SortByBoardName(x, y) {
                    return ((x.boardName == y.boardName) ? 0 : ((x.boardName > y.boardName) ? 1 : -1));
                }

                function SortByComplaintNbr(x, y) {
                    return x.ComplaintNumber - y.ComplaintNumber;
                }

                function SortByBoardDecision(x, y) {
                    return ((x.boardDecision == y.boardDecision) ? 0 : ((x.boardDecision > y.boardDecision) ? 1 : -1));
                }

                function SortByActionDate(x, y) {
                    return new Date($(x).actionDate) < new Date($(y).actionDate);
                }               

            });
        </script>
    </section>
    <section id="SearchResults">

        <label for="sortBy">Sort By: </label>
        <select id="sortBy">
                
            <option value="Licensee Name">Licensee Name</option>
            <option value="Complaint Number">Complaint Number</option>
            <option value="Board of Registration">Board of Registration</option>
            <option value="Board Decision">Board Decision</option>
            <option value="Action Date">Action Date</option>
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
            <tbody></tbody>
        </table>
    </section>
</body>
</html>
