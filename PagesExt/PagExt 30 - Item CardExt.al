pageextension 50002 ProductoCardExtension extends "Item Card" //30
{
    layout
    {
        addafter(Description)
        {
            field("Description 2"; "Description 2")
            {
                ApplicationArea = All;
            }
        }
        addafter("Common Item No.")
        {
            field("Duty Code"; "Duty Code")
            {
                ApplicationArea = All;
            }
        }
    }

}