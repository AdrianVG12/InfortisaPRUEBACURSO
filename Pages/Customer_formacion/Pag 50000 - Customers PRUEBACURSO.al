page 50000 "Customers PRUEBACURSO"
{
    Caption = 'Customers_formacion', Comment = 'ESP="Clientes Formacion"';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Customer;
    //InsertAllowed = false;
    //DeleteAllowed = false;
    //ModifyAllowed = false;


    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Campo numero ciente';

                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Campo nombre ciente';

                }
                field(Balance; Rec.Balance)
                {
                    ApplicationArea = All;
                    ToolTip = 'Campo balance ciente';

                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Campo codigo localizacion ciente';

                }

                field("Language Code"; "Language Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Campo codigo lenguaje ciente';
                    TableRelation = Language;

                }


            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(holaMundo)
            {
                ApplicationArea = All;
                Image = Action;
                ToolTip = 'Boton para holaMundo';

                trigger OnAction()
                var
                    hellolblMsg: Label 'Hello world %1', Comment = 'ESP="Hola mundo %1"';
                begin
                    x := x + 1;
                    Message(hellolblMsg, x);
                end;
            }

            action(Card)
            {
                Caption = 'View card', Comment = 'ESP="Vista del cliente"';  // Título y comentario de la acción
                ApplicationArea = all;  // Área de aplicación de la acción
                Image = Customer;
                ToolTip = 'Boton para mostrar carta del cliente';


                trigger OnAction()  // Desencadenador de acción
                var
                    rCustomers: Record Customer;  // Declara un registro de cliente llamado rCustomers
                begin
                    rCustomers.SetRange("No.", Rec."No.");  // Establece un rango para el campo "No." (número de cliente) basado en el registro actual
                    rCustomers.SetFilter(Name, '*a*');  // Establece un filtro para el campo "Nombre" que incluya la letra 'a'
                    rCustomers.SetFilter("No.", '%1..%2', '1000', '50000');  // Establece un filtro para el campo "No." (número de cliente) que incluya el rango de 1000 a 50000
                    //rCustomers.SetFilter("No.", '30000');
                    //rCustomers.SetFilter("E-Mail", "E-Mail");
                    //rCustomers.SetFilter("Location Code", '*GRIS*'); //rCustomers.SetFilter("Location Code", '%1', '*GRIS*');
                    //rCustomers.SetFilter("Language Code", '*ESP*');
                    //rCustomers.SetFilter("Name", '*edrit*');


                    if rCustomers.IsEmpty() then begin  // Si el conjunto de registros está vacío
                        Message('Voy a dar error');  // Muestra un mensaje en la consola
                        Error('No hay registros');  // Genera un error con el mensaje especificado
                    end
                    else begin  // Si hay registros en el conjunto
                        x := 0;  // Inicializa una variable x en 0
                        rCustomers.FindSet();  // Encuentra y selecciona el primer registro que cumpla con los filtros establecidos
                        Message('Hay %1 registros', rCustomers.Count());  // Muestra un mensaje con la cantidad de registros encontrados
                        rCustomers.Next();  // Avanza al siguiente registro en el conjunto
                        Message('Nombre: ( %1 )', rCustomers.Name);  // Muestra un mensaje con el nombre del cliente del registro actual
                        Page.RunModal(page::Customer_formacion2, rCustomers);  // Abre una página modal (formulario) para mostrar los detalles del cliente actual
                        //Rec = Registro acutal de customer
                    end;
                end;

            }
            action(NewCustomer)
            {
                Caption = 'New Customer', Comment = 'ESP="Crear cliente nuevo"';
                ApplicationArea = All;
                Image = Customer;
                ToolTip = 'Boton para crear nuevo cliente';

                trigger OnAction()
                var
                    CustomerRec: Record Customer;
                begin
                    // Inicializa un nuevo registro de cliente y lo inserta en la base de datos
                    CustomerRec.Init();
                    CustomerRec.Insert(true);
                    // Abre la página para crear un nuevo cliente con el nuevo registro
                    Message('Indica los datos del nuevo cliente');
                    Page.Run(page::CardNewCustomer, CustomerRec);

                end;
            }



        }
    }

    var
        x: Integer;
}