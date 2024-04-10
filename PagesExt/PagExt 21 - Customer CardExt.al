pageextension 50000 CustomerCardPRUEBACURSO extends "Customer Card" //21
{ //Extension de la ficha de UN cliente y añadir campos creados en la extension de la tabla Customer (CustomerExt.al)
    layout
    {
        addafter("Customized Calendar") //añadir despues de "Calendario peronsalizado" los 2 campos siguientes que vienen de la extension de la tabla Customer
        {
            field(Localization_PRUEBACURSO; Localization_PRUEBACURSO)
            {
                ApplicationArea = All;
                trigger OnValidate() //trigger pra validar el campo y que se cambie a lo escogido por el user
                begin
                    rec.CalcFields(LocalizationName_PRUEBACURSO)
                end;
            }

            field(LocalizationName_PRUEBACURSO; LocalizationName_PRUEBACURSO)
            {
                ApplicationArea = All;
            }
        }
    }
}