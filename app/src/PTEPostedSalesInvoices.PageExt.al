pageextension 60301 "PTE Posted Sales Invoices" extends "Posted Sales Invoices"
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
        CurrPage.ReportPreview.Page.LoadReport(Report::"Standard Sales - Invoice", Rec.RecordId());
    end;
}

