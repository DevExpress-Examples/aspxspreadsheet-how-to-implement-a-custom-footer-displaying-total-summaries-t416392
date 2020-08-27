<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxSpreadsheet.v17.2, Version=17.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpreadsheet" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .myFooter{
            width:100%;
            background-color:#cecece;

            border-style:solid;
            border-color:#a7a7a7;
            border-width:1px;
            border-top-width:0px;
            text-align:right;
            height:24px;
            box-sizing: border-box;
        }
        .myTotalSummary{
            padding-bottom:6px;
            padding-right:20px;
        }
    </style>
    <script type="text/javascript">
        function onSelectionChanged(s, e) {
            var count = 0;
            var sum = 0;
            var average = 0;
            var numberCount = 0;
            var visible = false;
            var currentSelection = e.selection;
          
            for (var i = currentSelection.topRowIndex; i <= currentSelection.bottomRowIndex; i++) {
                for (var j = currentSelection.leftColumnIndex; j <= currentSelection.rightColumnIndex; j++) {
                    var value = s.GetCellValue(j, i);
                    if (value != null) {
                        count++;
                        if (!isNaN(value))
                        {
                            numberCount++;
                            sum += Number(value);
                        }
                    }
                }
            }
            average = sum / numberCount;
            if (count >= 1) {
                visible = true;
                TotalSummary.SetText("Average: " + average.toFixed(2) + "  Count: " + count + "  Sum: " + sum);
            }
            TotalSummary.SetVisible(visible);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dx:ASPxSpreadsheet ID="ASPxSpreadsheet1" runat="server" Width="100%" BorderBottom-BorderWidth="0px">
            <ClientSideEvents SelectionChanged="onSelectionChanged" />
        </dx:ASPxSpreadsheet>
        <div class="myFooter">
            <dx:ASPxLabel ID="TotalSummary" runat="server" ClientVisible="false" CssClass="myTotalSummary"></dx:ASPxLabel>
        </div>
    </div>
    </form>
</body>
</html>
