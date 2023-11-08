const
    MIN_SUPPORTERS: integer = 1
    MAX_SUPPORTERS: integer = 10
    BASE_MEMBERSHIP_YEARS: integer = 5
    SILVER_MEMBERSHIP_YEARS: integer = 10
end const

type
    tMembershipType = enumeration {BASE, SILVER, GOLD}
end type

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