page 50004 "ProductosList"
{
    Caption = 'Items_formacion', Comment = 'ESP="Productos Formación"';
    //CaptionML = ENU = 'Formation Items', ESP = 'Productos Formación';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Item;
    Editable = true;

    layout
    {
        area(Content)
        {
            repeater(InfoProduct)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Numero de indentificacion del producto';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Descripcion del producto';
                }
                field("Base Unit of Measure"; Rec."Base Unit of Measure")
                {
                    ApplicationArea = All;
                    ToolTip = 'Unidad de medida base';
                }
                field("Inventory Posting Group"; "Inventory Posting Group")
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
            action(InfoProduct)
            {
                Caption = 'Info Product', Comment = 'ESP="Informacion del producto"';
                ApplicationArea = All;
                Image = Item;


                trigger OnAction()
                var
                    ItemRec: Record Item;
                begin
                    ItemRec.Get(Rec."No.");
                    Message('Estos son los detalles de tu producto selecionado');
                    Page.Run(page::InfoProduct, ItemRec);
                end;
            }
            action(ModifyProduct)
            {
                Caption = 'Modify Product', Comment = 'ESP="Modifica tu producto selecionado"';
                ApplicationArea = All;
                Image = ServiceItemGroup;


                trigger OnAction()
                var
                    ItemRec: Record Item;
                begin
                    ItemRec.Get(Rec."No.");
                    Message('Abriendo el producto a modificar');
                    Page.Run(page::ModifyProduct, ItemRec);
                end;
            }
            action(NewProduct)
            {
                Caption = 'New Product', Comment = 'ESP="Crea un nuevo producto"';
                ApplicationArea = All;
                Image = NewItem;


                trigger OnAction()
                var
                    ItemRec: Record Item;
                begin
                    ItemRec.Init();
                    ItemRec.Insert(true);
                    Message('Abriendo el creador de productos');
                    Page.Run(page::CardNewProduct, ItemRec);
                end;
            }
            action(CreateOrder)
            {
                ApplicationArea = None;
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

    var
        myInt: Integer;
}