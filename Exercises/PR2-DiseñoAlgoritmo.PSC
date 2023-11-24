const
    //MIN_SUPPORTERS: integer = 1
    //MAX_SUPPORTERS: integer = 10

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
    elseif membershipYears <= SILVER_MEMBERSHIP_YEARS then
        return SILVER
    else
        return GOLD
    end if
end function

{Exercise 2.2}
action readSupporter(var supporter: tSupporter)
    writeString("Please enter the supporter's name:")
    supporter.name := readString()
    
    writeString("Please enter the supporter's age:")
    supporter.age := readInteger()
    
    writeString("Please enter the supporter's membership years:")
    supporter.membershipYears := readInteger()
    
    writeString("Does the supporter have any records? (true/false):")
    supporter.hasRecords := readBoolean()
end action

{Exercise 2.3}
action writeSupporter(supporter: tSupporter)
    writeString("Name: " + supporter.name)
    writeString("Age: " + toString(supporter.age))
    writeString("Membership Years: " + toString(supporter.membershipYears))
    writeString("Has Records: " + toString(supporter.hasRecords))
    
    { Llamada a la función getMembershipType para obtener el tipo de membresía }
    var membershipType: tMembershipType
    membershipType := getMembershipType(supporter.membershipYears)
    
    { Llamada a la acción writeMembershipType para mostrar el tipo de membresía }
    writeString("Membership Type: ")
    writeMembershipType(membershipType)
end action

{Exercise 2.4}
function getPoints(supporter: tSupporter) return integer
    var
        points: integer

    { Determinar los puntos basados en el tipo de membresía }
    points := 0
    switch (supporter.membershipType) do
        case BASE:
            points := BASE_MEMBERSHIP_POINTS
        case SILVER:
            points := SILVER_MEMBERSHIP_POINTS
        case GOLD:
            points := GOLD_MEMBERSHIP_POINTS
    end switch

    { Aplicar penalización si el aficionado tiene antecedentes penales }
    if (supporter.hasRecords) then
        points := points - RECORDS_PENALTY_POINTS
    end if

    return points
end function


algorithm UOCStadium
    var
        supporterIds: vector[MAX_SUPPORTERS] of integer
        supporterAges: vector[MAX_SUPPORTERS] of integer
        supporterRecords: vector[MAX_SUPPORTERS] of boolean
        membershipYears: vector[MAX_SUPPORTERS] of integer
        recoveredSupporters: vector[MAX_SUPPORTERS] of integer
        supporterMembershipTypes: vector[MAX_SUPPORTERS] of tMembershipType

        numSupporters: integer
        inputType: integer
        sumaAge: integer
        i: integer
        recoveredCount: integer
        averageAge: real
        selectedMembershipType: tMembershipType
    end var

    { Solicita la cantidad de SUPPORTERS }
    writeString("INPUT DATA")
    writeString("NUMBER OF SUPPORTERS (1-10)?")
    numSupporters := readInteger()

    { Validación del número de SUPPORTERS ingresado }
    while (numSupporters < MIN_SUPPORTERS) or (numSupporters > MAX_SUPPORTERS) do
        writeString("INVALID DATA, TRY AGAIN!")
        writeString("NUMBER OF SUPPORTERS(1-10)?")
        numSupporters := readInteger()
    end while

    { Recolección de los datos de cada SUPPORTER }
    sumaAge := 0
    for i := 1 to numSupporters do
        writeString("SUPPORTER #" + toString(i))

        writeString("ID (AN INTEGER)?")
        supporterIds[i] := readInteger()

        writeString("AGE (AN INTEGER)?")
        supporterAges[i] := readInteger()
        sumaAge := sumaAge + supporterAges[i]

        writeString("HAS RECORDS (0-FALSE, 1-TRUE)?")
        supporterRecords[i] := readBoolean()

        writeString("MEMBERSHIP YEARS (AN INTEGER)?")
        membershipYears[i] := readInteger()

        { Asignación del tipo de membresía basada en los años de membresía }
        if (membershipYears[i] <= BASE_MEMBERSHIP_YEARS) then
            supporterMembershipTypes[i] := BASE
        elseif (membershipYears[i] <= SILVER_MEMBERSHIP_YEARS) then
            supporterMembershipTypes[i] := SILVER
        else
            supporterMembershipTypes[i] := GOLD
        end if
    end for

    { Cálculo de la edad promedio}
    averageAge := toReal(sumaAge) / numSupporters

    { Procesamiento de los datos para buscar SUPPORTERS }
    writeString("LOOKING FOR SUPPORTERS")
    writeString("MEMBERSHIP TYPE (BASE, SILVER, GOLD)?")
    selectedMembershipType := readInteger()

    { Validación del tipo de membresía ingresado }
    while (selectedMembershipType < 1) or (selectedMembershipType > 3) do
        writeString("INVALID TYPE, TRY AGAIN!")
        writeString("MEMBERSHIP TYPE (1-BASE, 2-SILVER, 3-GOLD)?")
        selectedMembershipType := readInteger()
    end while

    {Se convierte el tipo de membresía ingresado a su correspondiente valor definido en tMembershipType }
    if (selectedMembershipType = 1) then
        selectedMembershipType := BASE
    elseif (selectedMembershipType = 2) then
        selectedMembershipType := SILVER
    else
        selectedMembershipType := GOLD
    end if

    {Realizo la Búsqueda de SUPPORTERS que cumplen con el criterio seleccionado}
    recoveredCount:= 0;
    for i := 1 to numSupporters do
        if (supporterMembershipTypes[i] = selectedMembershipType) then
            recoveredSupporters[recoveredCount] := i
            recoveredCount := recoveredCount + 1
        end if
    end for

    {Ouput donde se visualizan los resultados solicitados}
    writeString("RESULTS")
    if (recoveredCount = 0) then
        writeString("AVERAGE SUPPORTER AGE: " + toString(averageAge))
        writeString("NO SUPPORTERS RECOVERED.")
    else
        writeString("AVERAGE SUPPORTER AGE: " + toString(averageAge))
        for i := 1 to recoveredCount do
            writeString("SUPPORTER ID: " + toString(supporterIds[recoveredSupporters[i]]))
            writeString("AGE: " + toString(supporterAges[recoveredSupporters[i]]))
            writeString("HAS RECORDS? (0-FALSE, 1-TRUE): " + toString(integer(supporterRecords[recoveredSupporters[i]])))
            writeString("MEMBERSHIP TYPE (1-BASE, 2-SILVER, 3-GOLD): " + toString(supporterMembershipTypes[recoveredSupporters[i]]))
        end for
    end if
end algorithm