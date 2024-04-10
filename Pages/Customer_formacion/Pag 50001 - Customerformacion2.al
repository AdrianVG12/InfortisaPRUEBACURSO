page 50001 "Customer_formacion2"
{
    Caption = 'Clientttte';
    PageType = Card;
    UsageCategory = None;
    SourceTable = Customer;
    DeleteAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.") //PREUNGTAR, PORQUE AQUI NO PONER EL Rec.? Es necesario su uso? Marca el registro actual.
                {
                    ApplicationArea = All;

                }
                field(Name; Name)
                {
                    ApplicationArea = All;
                }

            }

            group(AddressGrp)
            {

                field(Address; Address)
                {

                    ApplicationArea = All;

                }
            }
            group(Contact)
            {
                field("E-Mail"; "E-Mail")
                {
                    ApplicationArea = All;
                }

                field("Location Code"; Rec."Location Code")
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