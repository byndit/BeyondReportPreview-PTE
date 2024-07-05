pageextension 60302 "PTE Doc. Attachment Details" extends "Document Attachment Details"
{
    layout
    {
        addfirst(factboxes)
        {
            part(ReportPreview; "BYD RP Base64 Preview")
            {
                ApplicationArea = All;
                UpdatePropagation = Both;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        CurrPage.ReportPreview.Page.LoadBase64(PTELoadPDF);
    end;

    local procedure PTELoadPDF(): Text
    var
        Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        InStr: InStream;
    begin
        if not Rec.HasContent() then
            exit;
        If not Rec.GetContentType().Contains('pdf') then
            exit;
        Rec.GetAsTempBlob(TempBlob);
        TempBlob.CreateInStream(InStr, TextEncoding::Windows);
        exit(Base64Convert.ToBase64(InStr));
    end;
}