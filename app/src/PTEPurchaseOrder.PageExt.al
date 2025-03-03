pageextension 60307 "PTE Purchase Order" extends "Purchase Order"
{
    layout
    {
        addfirst(factboxes)
        {
            part(ReportPreview; "BYD RP Report Preview")
            {
                ApplicationArea = All;
                UpdatePropagation = Both;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        CurrPage.ReportPreview.Page.LoadReport(GetReportId(), Rec.RecordId());
    end;

    internal procedure GetReportId(): Integer
    var
        ReportSelections: Record "Report Selections";
    begin
        ReportSelections.SetRange(Usage, ReportSelections.Usage::"P.Order");
        if ReportSelections.FindSet() then
            repeat
                if ReportSelections."Report ID" <> 0 then
                    exit(ReportSelections."Report ID");
            until ReportSelections.Next() = 0;
    end;
}

