report 50000 "Customers_PRUEBAREPORT"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC; // Esta línea establece el formato predeterminado del informe como RDLC (Report Definition Language Client-side). RDLC es un tipo de formato de informe que se utiliza en Visual Studio para diseñar informes.
    RDLCLayout = '.\ReportsLayout\Customers.rdl'; //Esta línea especifica la ruta del archivo de diseño del informe RDLC. En este caso, el archivo de diseño del informe se llama ‘Customers.rdl’ y está ubicado en la carpeta ‘ReportsLayout’.

    dataset
    {
        dataitem(Customer; Customer)
        {
            column(TypeCustomer; 'Customer')
            {

            }
            column(NameCustomer; Name)
            {

            }
            column(Facturas; dFacturas)
            {
                AutoFormatExpression = "Currency Code";
                AutoFormatType = 2;
            }
            dataitem("Sales Header"; "Sales Header") //Esta línea define un DataItem llamado “Sales Header”. Los DataItems son las tablas de la base de datos que se utilizarán en el informe.
            {
                DataItemLink = "Sell-to Customer No." = field("No."); //: Esta línea establece una relación entre el DataItem actual (“Sales Header”) y otro DataItem. En este caso, está vinculando el campo “Sell-to Customer No.” del DataItem actual con el campo “No.” de otro DataItem.
                DataItemTableView = sorting("No.") where("Document Type" = const(Order)); //Esta línea filtra los registros del DataItem “Sales Header” donde el “Document Type” es igual a “Order”
                column(No_; "No.") //Esta línea define una columna en el informe para el campo “No.” del DataItem “Sales Header”.
                {

                }
            }
            trigger OnPreDataItem()
            begin
                Customer.SetFilter("No.", tCustomer); //Filtrando talbla clientes
            end;

            trigger OnAfterGetRecord() //Por cad registro de filtan las de cada cliente y se guarda el numero
            var
                rInvoice: Record "Sales Invoice Header";
            begin
                rInvoice.SetRange("Sell-to Customer No.", Customer."No.");
                dFacturas := rInvoice.Count();
            end;
        }
        dataitem(Vendor; Vendor)
        {
            column(TypeVendor; 'Vendor')
            {

            }
            column(NameVendor; Name)
            {

            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(FilterCustomer; tCustomer)
                    {
                        Caption = 'Customer filter', Comment = 'ESP = "Filtro cliente"';
                        ApplicationArea = All;

                    }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(LayoutName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }
    var
        tCustomer: Text;
        dFacturas: Decimal;
}