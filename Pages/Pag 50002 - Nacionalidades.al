page 50002 "Nacionalidades"
{
    Caption = 'Pagina Nacionalidades';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Localizaciones;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Code; Rec."Code")
                {
                    ApplicationArea = All;

                }
                field(Nombre; Rec."Nombre")
                {
                    ApplicationArea = All;

                }
                field(Nacionalidad; Rec.Nacionalidad)
                {
                    ApplicationArea = All;
                    trigger OnLookup(var Text: Text): Boolean
                    var

                    begin

                    end;
                }
                field(Customers; Rec.Customers)
                {
                    ApplicationArea = All;

                }
                field(Disponibilidad; Rec.Disponibilidad)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}