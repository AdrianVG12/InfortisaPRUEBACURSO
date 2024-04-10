//APUNTES

/*  // Al crearlo dentro de un campo, mostrara 3 punttitos para abrir una card que muestra la info que indiques en la fucnion
    trigger OnAsistEdit()
    begin
        if AssistEdit(xRec) then //La funciona creada
            CurrPage.Update();
    end;

    trigger OnLookUp() Se ejcuta al añadirlo en un campo mostrar una flatlist para elegir opciones
    

    //Se cogen los fragmentos de codigo del respetivo codigo fuente de la tabla Resource, para obtener los triggers OnValidate y OnInsert
    // Al crarlo en un campo, se ejecutara cuando se guarde el valor de ese campo o se vaya a otro campo
    field(1; "No.", Code[20])
    {
        trigger OnValidate()
        begin
            if "No." <> xRec."No." then begin  //Esta línea verifica si el número actual del recurso ("No.") es diferente del número del recurso en el registro anterior (xRec."No."). Si es así, entonces ejecuta el bloque de código dentro del begin y end.
                ResSetup.Get();  //Esta línea obtiene la configuración actual del recurso. //Da error si no se crean las variables
                NoSeriesMgt.TestManual(ResSetup."Resource Nos."); // Esta línea verifica si los números de los recursos están configurados para ser ingresados manualmente. Si es así, y se intenta ingresar un número automáticamente, se producirá un error.
                "No. Series" := ''; //Da error ya que es un campo de la tabla Resource  del codigo fuente, y hay que crearlo tambien copiandolo en nuestra tabla
                                    //Esta línea establece el campo "No. Series" en blanco. Esto podría ser para asegurarse de que el número de serie se genere automáticamente la próxima vez que se necesite.
            end;
        end;
    }
    //copiar el siguiente campo a nuestra tabla
    field(56; "No. Series"; Code[20])
    {
        Caption = 'No. Series';
        Editable = false;
        TableRelation = "No. Series";
    }

    //Despues de la seccion KEY de la tabla, poner el trigger OnInsert()
    trigger OnInsert()
    begin
        if "No." = '' then begin 
            ResSetup.Get(); 
            ResSetup.TestField("Resource Nos."); //Hacer comprobacion del campo Resoruce No., Testfields se asegura si el campo tiene un valor.
            NoSeriesMgt.InitSeries(ResSetup."Resource Nos.",xRec."No. Series",0D,"No.", "No. Series"); //Llama a una fucnion InitSerires de una codeunit NoSeriesMgt pasandole los parametros  a insertar
        end;
    end;

    //Hacen falta indicar las variables globales del codigo fuente Resource (la tabla Resource)
    estan todas en la parte de las variables en el codigo fuente de esta tabla ( cntrl + F, indicar lo que se quiere buscar):

    var {
        ResSetup: Record "Resources Setup"; //registro de la tabla Resources Setup
        NoSeriesMgt: Codeunit NoSeriesManagement;
    }

    //TODO ESTE BLOQUE, HACE QUE AUTOMATICAMENTE SE PONGA EL NUMERO DE SERIE AL CREAR UN NUEVO REGISTRO EN ESA TABLA

    AHORA HAY QUE CREAR NUESTRA PROPIA CNFIGURACION:

    Por ejemplo si buscas en busines central Congf. ventas y cobros, dalen muchos datos y en el apartado de serie numerica, aparecen los numeradores apra crear cleintes, ofertas, facturas...

    Ahora vamos a crear una configuracion sencilla:
    Vamos a go Definition en Resources Setup para ir a l codigo fuente de la talba Resources Setup, y copiamos toda la tabla, 
    creamos una nueva tabla, en la que pegaremos la talba Resources Setup, para asi tenerla en nuestros arichvos en vez de ser una tabla madre del sistema.

    Cambiamos los numeros Id y nombres, ya que estqan retrigindos y repetidos, para adaptarlo a nuestro modo,
    modificacnod campos a nuestro gusto, quitando lso campos inecesarios, y las variables inecesariasdejando los que queremos dejar.
    Necesitamos una pagina para interactuar con esta tabla, creamos una pagina, copiandola de cofniguracion de recurusos, en BC, entramos en Config. recursos, CNTRL + ALT + F1, y vemos el nombre y numero de la pagina para buscarla,
    en la base_application, buscamos la pagina Resources Setup, la copiamos la pegamos en nuestra nueva pagina, y la modificacmos a nuetro gusto, hacienod los cambios obligatorios de numero y nombre y cambiar la SOurceTable de la pagina, a nuestra Tabla para hacer la relacion entre ellas.
*/

