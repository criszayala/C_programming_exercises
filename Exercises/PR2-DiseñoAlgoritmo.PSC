const
    NUM_SUPPORTERS: integer = 3;
    BASE_MEMBERSHIP_YEARS: integer = 5;
    SILVER_MEMBERSHIP_YEARS: integer = 10;
    
    BASE_MEMBERSHIP_POINTS: integer = 10;
    SILVER_MEMBERSHIP_POINTS: integer = 15;
    GOLD_MEMBERSHIP_POINTS: integer = 20;

    RECORDS_PENALTY_POINTS: integer = 5;
end const

type
    tMembershipType = enumeration {BASE, SILVER, GOLD}
end type

type
    tSupporter = record
        name: string;
        age: integer;
        membershipYears: integer;
        hasRecords: boolean;
    end record
end type

{Exercise 2.1}
function getMembershipType(membershipYears: integer) return tMembershipType
    if membershipYears <= BASE_MEMBERSHIP_YEARS then
        return BASE
    else if membershipYears <= SILVER_MEMBERSHIP_YEARS then
        return SILVER
    else
        return GOLD
    end if
end function

{Exercise 2.2}
action readSupporter(var supporter: tSupporter)
    writeString("NAME (25 CHAR MAX, NO SPACES)?")
    supporter.name := readString()
    
    writeString("AGE (AN INTEGER)?")
    supporter.age := readInteger()
    
    writeString("MEMBERSHIP YEARS (AN INTEGER)?")
    supporter.membershipYears := readInteger()
    
    writeString("HAS RECORDS (0-FALSE, 1-TRUE)?")
    supporter.hasRecords := readBoolean()

    supporter.membershipType := getMembershipType(supporter.membershipYears)

end action

{Exercise 2.3}
action writeSupporter(supporter: tSupporter)
    writeString("NAME: " + supporter.name)
    writeString("AGE: 2 " + toString(supporter.age))
    writeString("MEMBERSHIP YEARS:  " + toString(supporter.membershipYears))
    writeString("HAS RECORDS (0-FALSE, 1-TRUE): " + toString(supporter.hasRecords))
    writeString("MEMBERSHIP TYPE (1-BASE, 2-SILVER, 3-GOLD): ")
    writeMembershipType(supporter.membershipType)
end action

{Exercise 2.4}
function getPoints(supporter: tSupporter) return integer
    var
        points: integer

    { Asignar puntos basados en el tipo de membresía }
    points := 0
    if supporter.membershipType = BASE then
        points := BASE_MEMBERSHIP_POINTS
    else if supporter.membershipType = SILVER then
        points := SILVER_MEMBERSHIP_POINTS
    else if supporter.membershipType = GOLD then
        points := GOLD_MEMBERSHIP_POINTS
    end if

    { Aplicar penalización si el aficionado tiene antecedentes penales }
    if supporter.hasRecords then
        points := points - RECORDS_PENALTY_POINTS
    end if

    return points
end function

algorithm UOCStadium
    var
        supporters: vector[NUM_SUPPORTERS] of tSupporter
        selectedSupporter: tSupporter
        i: integer
        maxPoints: integer
        currentPoints: integer
    end var

    {Exercise 2.5}
    {Data input}
    writeString("INPUT DATA")
    for i := 1 to NUM_SUPPORTERS do
        writeString("Enter data for supporter #" + toString(i) + ":")
        
        writeString("NAME: ")
        supporters[i].name := readString()
        
        writeString("AGE: ")
        supporters[i].age := readInteger()
        
        writeString("MEMBERSHIP YEARS: ")
        supporters[i].membershipYears := readInteger()
        
        writeString("HAS RECORDS (0-FALSE, 1-TRUE):")
        supporters[i].hasRecords := readBoolean()
    end for

    {Exercise 2.6}
    {Data processing}

    {Base case: consider the selected supporter the first}
    selectedSupporter := supporters[1]
    maxPoints := getPoints(selectedSupporter)

    {Looking for the supporter to select}
    for i := 2 to NUM_SUPPORTERS do
        currentPoints := getPoints(supporters[i])
        { If current supporter has more points or the same points but more membership years }
        if (currentPoints > maxPoints) or 
        (currentPoints = maxPoints and supporters[i].membershipYears > selectedSupporter.membershipYears) then
            selectedSupporter := supporters[i]
            maxPoints := currentPoints
        end if
    end for

    {Data output}
    writeString("SELECTED SUPPORTER")
    writeSupporter(selectedSupporter)
end algorithm



const
    NUM_SUPPORTERS: integer = 3;  // Número máximo de seguidores
    BASE_MEMBERSHIP_YEARS: integer = 5;  // Años para membresía BASE
    SILVER_MEMBERSHIP_YEARS: integer = 10;  // Años para membresía SILVER
    
    BASE_MEMBERSHIP_POINTS: integer = 10;  // Puntos para membresía BASE
    SILVER_MEMBERSHIP_POINTS: integer = 15;  // Puntos para membresía SILVER
    GOLD_MEMBERSHIP_POINTS: integer = 20;  // Puntos para membresía GOLD

    RECORDS_PENALTY_POINTS: integer = 5;  // Penalización de puntos por antecedentes penales
end const

type
    tMembershipType = enumeration {BASE, SILVER, GOLD}  // Tipos de membresía disponibles
end type

type
    tSupporter = record
        name: string;  // Nombre del seguidor
        age: integer;  // Edad del seguidor
        membershipYears: integer;  // Años de membresía del seguidor
        hasRecords: boolean;  // Indica si el seguidor tiene antecedentes penales
    end record
end type

// Función para obtener el tipo de membresía basado en los años de membresía
function getMembershipType(membershipYears: integer) return tMembershipType
    if membershipYears <= BASE_MEMBERSHIP_YEARS then
        return BASE
    else if membershipYears <= SILVER_MEMBERSHIP_YEARS then
        return SILVER
    else
        return GOLD
    end if
end function

// Acción para leer los datos de un seguidor desde la entrada estándar
action readSupporter(var supporter: tSupporter)
    writeString("Ingrese el nombre del seguidor (máx 25 caracteres, sin espacios):")
    supporter.name := readString()
    
    writeString("Ingrese la edad del seguidor (un entero):")
    supporter.age := readInteger()
    
    writeString("Ingrese los años de membresía del seguidor (un entero):")
    supporter.membershipYears := readInteger()
    
    writeString("El seguidor tiene antecedentes (0 para NO, 1 para SÍ):")
    supporter.hasRecords := readBoolean()

    supporter.membershipType := getMembershipType(supporter.membershipYears)
end action

// Acción para escribir los datos de un seguidor a la salida estándar
action writeSupporter(supporter: tSupporter)
    writeString("Nombre: " + supporter.name)
    writeString("Edad: " + toString(supporter.age))
    writeString("Años de Membresía: " + toString(supporter.membershipYears))
    writeString("Tiene Antecedentes: " + toString(supporter.hasRecords))
    writeString("Tipo de Membresía: ")
    writeMembershipType(supporter.membershipType)
end action

// Función para obtener la puntuación de un seguidor
function getPoints(supporter: tSupporter) return integer
    var
        points: integer  // Puntos del seguidor

    points := 0
    if supporter.membershipType = BASE then
        points := BASE_MEMBERSHIP_POINTS
    else if supporter.membershipType = SILVER then
        points := SILVER_MEMBERSHIP_POINTS
    else if supporter.membershipType = GOLD then
        points := GOLD_MEMBERSHIP_POINTS
    end if

    if supporter.hasRecords then
        points := points - RECORDS_PENALTY_POINTS  // Penalizar si hay antecedentes
    end if

    return points
end function

// Algoritmo principal
algorithm UOCStadium
    // Definición de variables
    var
        supporters: vector[NUM_SUPPORTERS] of tSupporter  // Vector para almacenar seguidores
        selectedSupporter: tSupporter  // Seguidor seleccionado
        i: integer  // Contador para bucles
        maxPoints: integer  // Puntos máximos encontrados
        currentPoints: integer  // Puntos del seguidor actual
    end var

    // Entrada de datos
    writeString("DATOS DE ENTRADA")
    for i := 1 to NUM_SUPPORTERS do
        readSupporter(supporters[i])  // Leer los datos de cada seguidor
    end for

    // Procesamiento de datos
    selectedSupporter := supporters[1]  // Considerar al primer seguidor como seleccionado inicialmente
    maxPoints := getPoints(selectedSupporter)  // Calcular puntos del seguidor seleccionado

    for i := 2 to NUM_SUPPORTERS do
        currentPoints := getPoints(supporters[i])  // Calcular puntos del seguidor actual
        if (currentPoints > maxPoints) or 
           (currentPoints = maxPoints and supporters[i].membershipYears > selectedSupporter.membershipYears) then
            selectedSupporter := supporters[i]  // Actualizar el seguidor seleccionado si es necesario
            maxPoints := currentPoints  // Actualizar los puntos máximos
        end if
    end for

    // Salida de datos
    writeString("SEGUIDOR SELECCIONADO")
    writeSupporter(selectedSupporter)  // Mostrar datos del seguidor seleccionado
end algorithm
