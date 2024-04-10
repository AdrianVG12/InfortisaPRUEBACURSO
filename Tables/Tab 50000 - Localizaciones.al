table 50000 Localizaciones
{
    DataClassification = CustomerContent;

    LookupPageId = Nacionalidades; //Vincular con la pagina nacionalidades

    fields
    {
        field(1; Code; Code[20])
        {
            Caption = 'Code', Comment = 'ESP="Codigo"';
            DataClassification = ToBeClassified;

            trigger OnValidate()

            begin
                Message('HOLA DESDE EL TRIGER OnValidate DEL CAMPO Nº');
            end;

        }
        field(2; Nombre; Text[50])
        {
            Caption = 'Name', Comment = 'ESP="Nombre"';
            DataClassification = ToBeClassified;

        }
        field(3; Nacionalidad; Option)
        {
            Caption = 'Nacionalidad';
            OptionMembers = Nacional,UE,Extranjero;
            OptionCaption = 'Nacional,UE,Extranjero', Comment = 'ESP="Nacional, UE, Extranjero"';
            //OptionCaptionML =  ESP ='Nacional,UE,Extranjero';
        }
        field(4; Customers; Integer)
        {
            Caption = 'Customers', Comment = 'ESP="Clientes"';
            FieldClass = FlowField;
            CalcFormula = count(Customer where(Localization_PRUEBACURSO = field(Code)));
        }
        field(5; Disponibilidad; Enum "Tipo Enum")
        {
            Caption = 'EnumTipo', Comment = 'ESP="Disponibilidad"';

        }
    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Code, Nombre, Nacionalidad) //Para mostrar en la pestañita los campos de la pagina Nacionalidades
        {

        }
    }

    var
        myInt: Integer;

}