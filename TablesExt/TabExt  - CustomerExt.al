tableextension 50000 CustomerPRUEBACURSO extends Customer
{ //Extension tabla clientes para añadir los 2 campos y la modificacion en la Adrress
    fields
    {
        field(50000; Localization_PRUEBACURSO; Code[20])
        {
            Caption = 'Locatiooon', Comment = 'ESP="Ubicación servicio"';
            DataClassification = CustomerContent;

            TableRelation = Localizaciones.Code; //where(Nacionalidad = const(Nacional));


        }

        field(50001; LocalizationName_PRUEBACURSO; Text[50])
        {
            Caption = 'Location Name', Comment = 'ESP="Nombre de localización"';


            FieldClass = FlowField;
            CalcFormula = lookup(Localizaciones.Nombre where(Code = field(Localization_PRUEBACURSO)));

        }
        modify(Address)
        {
            Caption = 'Direccion prueba', Comment = 'ESP="Direccion prueba esp"';
            trigger OnAfterValidate()
            begin
                Message('Cuidado vas a modificar la direccion');
            end;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {

    }

    var
        myInt: Integer;
}