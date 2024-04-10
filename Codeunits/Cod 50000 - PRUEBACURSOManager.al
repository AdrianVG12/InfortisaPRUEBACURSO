codeunit 50000 "PRUEBACURSO_Manager"
{
    // Desencadenador que se activa al ejecutar el codeunit
    trigger OnRun()
    begin
        // No hay acciones específicas al iniciar el codeunit
    end;

    // Procedimiento para crear una nueva orden de venta
    procedure CreateOrder(var rItem: Record Item)
    var
        rOrder: Record "Sales Header";
        rOrderLine: Record "Sales Line";
        nLine: Integer;
    begin
        // Inicialización de variables y establecimiento de valores en la cabecera de venta
        rOrder."Document Type" := rOrder."Document Type"::Order;
        rOrder.Validate("Posting Date", Today());
        rOrder.Validate("Sell-to Customer No.", '20000');
        rOrder.Insert(true);

        // Modificación de la fecha de envío y ejecución de la página de la orden de venta
        rOrder.Validate("Shipment Date", CalcDate('<+2D>', WorkDate()));
        rOrder.Modify(true);
        Page.Run(page::"Sales Order", rOrder);

        // Bucle para cada registro de artículo
        if rItem.FindSet() then
            repeat
                // Inicialización de la línea de venta y establecimiento de valores
                nLine += 10000;
                rOrderLine.Init();
                rOrderLine."Document Type" := rOrder."Document Type";
                rOrderLine."Document No." := rOrder."No.";
                rOrderLine."Line No." := nLine;
                rOrderLine.Insert(true);

                // Establecimiento de tipo de línea, número de artículo y cantidad
                rOrderLine.Type := rOrderLine.Type::Item;
                rOrderLine.validate("No.", rItem."No.");
                rOrderLine.Validate(Quantity, 1);
                rOrderLine.Modify(true);
            until rItem.Next() = 0
        else
            Error('No hay productos seleccionados');
    end;

    // Suscriptor de eventos que se activa después de copiar los campos de dirección del cliente de venta
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterCopySellToCustomerAddressFieldsFromCustomer', '', false, false)]
    local procedure OnAfterCopySellToCustomerAddressFieldsFromCustomer(var SalesHeader: Record "Sales Header")
    begin
        // Añadir "(Prueba) -" al comienzo del campo "Sell-to Address" en el registro de cabecera de venta
        SalesHeader."Sell-to Address" := CopyStr('(Prueba) - ' + SalesHeader."Sell-to Address", 1, MaxStrLen(SalesHeader."Sell-to Address"));
    end;
}
