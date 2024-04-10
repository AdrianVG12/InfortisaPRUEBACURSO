pageextension 50001 "ItemList_PRUEBACURSO" extends "Item List" //31
{
    actions
    {
        addlast(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;
                Caption = 'Create order', Comment = 'ESP="Crear pedido"';
                Image = NewOrder;


                trigger OnAction()
                var
                    codeunitMgr: Codeunit PRUEBACURSO_Manager;
                    rItem: Record Item;
                begin

                    CurrPage.SetSelectionFilter(rItem);
                    if not confirm('Se van a crear un pedido de %1 lineas, ¿Continuar?', false, rItem.Count()) then
                        Error('Accion cancelada');
                    codeunitMgr.CreateOrder(rItem);
                end;
            }
        }
    }

}