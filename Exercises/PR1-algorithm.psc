const
    MIN_SUPPORTERS: integer = 1; {Min. number of supporters}
    MAX_SUPPORTERS: integer = 10; {Max. number of supporters}
    BASE_MEMBERSHIP_YEARS: integer = 5; {Max. years base membership}
    SILVER_MEMBERSHIP_YEARS: integer = 10; {Max. years silver membership}
end const

type
    tMembershipType = enumeration {BASE, SILVER, GOLD}
end type

algorithm UOCStadium
    {Variable definitions}
    var
        supporterIds: vector[MAX_SUPPORTERS] of integer;
        supporterAges: vector[MAX_SUPPORTERS] of integer;
        supporterRecords: vector[MAX_SUPPORTERS] of boolean;
        membershipYears: vector[MAX_SUPPORTERS] of integer; {Cambio la variable a vector}
        supporterMembershipTypes: vector[MAX_SUPPORTERS] of tMembershipType;
        recoveredSupporters: vector[MAX_SUPPORTERS] of integer;
        
        numSupporters: integer;
        inputType: integer;
        selectedMembershipType: tMembershipType;
        sumaAge: integer;
        averageAge: real;
        i: integer;
    end var

    {Exercise 2.1}
    {Lectura de datos desde el canal de entrada}

    {Data input}
        writeString("INPUT DATA");
        writeString("NUMBER OF SUPPORTERS(1-10)?");
        numSupporters := readInteger();

    {Data validation}
    while (numSupporters < MIN_SUPPORTERS) or (numSupporters > MAX_SUPPORTERS) do
        writeString("INVALID DATA, TRY AGAIN!")
        writeString("NUMBER OF SUPPORTERS(1-10)?")
        numSupporters := readInteger()
    end while
        
    {Exercise 2.2}
    {Data input}
    
    sumaAge := 0
    averageAge := 0.0

    {Se recogen los datos de cada SUPPORTERS}
    for i := 1 to numSupporters do
        writeString("SUPPORTER #" + toString(i)); 

        writeString("ID (AN INTEGER)?"); 
        supporterIds[i] := i

        writeString("AGE (AN INTEGER)?"); 
        supporterAges[i] := readInteger();
        sumaAge := sumaAge + supporterAges[i];

        writeString("HAS RECORDS (0-FALSE, 1-TRUE)? ");
        supporterRecords[i] := readBoolean();

        writeString("MEMBERSHIP YEARS (AN INTEGER)?");
        membershipYears[i] := readInteger();

        {Se realiza la asignación de tipos de membresía basado en los años de membresía del enunciado}
        if membershipYears[i] <= BASE_MEMBERSHIP_YEARS then
            supporterMembershipTypes[i] := BASE;
        elseif membershipYears[i] <= SILVER_MEMBERSHIP_YEARS then
            supporterMembershipTypes[i] := SILVER;
        else
            supporterMembershipTypes[i] := GOLD;
        end if
    end for

    {Calculate the average age}
    averageAge := sumaAge / numSupporters;
    

    {Exercise 2.3}
    {Data input}
    writeString("LOOKING FOR SUPPORTERS");
    writeString("MEMBERSHIP TYPE (1-BASE, 2-SILVER, 3-GOLD)?");
    inputType := readInteger();

    {Acá voy a validar que la entrada sea correcta, en caso contrario muestro el mensaje INVALID TYPE, TRY AGAIN! }
    while (inputType < 1) or (inputType > 3) do
        writeString("INVALID TYPE, TRY AGAIN!");
        writeString("MEMBERSHIP TYPE (1-BASE, 2-SILVER, 3-GOLD)?");
        inputType := readInteger();
    end while

    {Una vez que valido la entrada mapeo tMembershipType }
    case inputType of
        1: selectedMembershipType := BASE;
        2: selectedMembershipType := SILVER;
        3: selectedMembershipType := GOLD;
    end case

    {Ahora inicializo la lista de Supporter recuperada}
    setLength(recoveredSupporters, 0);

    {Data Processing}
    for i := 1 to numSupporters do
        if (supporterMembershipTypes[i] = selectedMembershipType) and
            (supporterAges[i] <= averageAge) and
            (not supporterRecords[i]) then
            setLength(recoveredSupporters, length(recoveredSupporters) + 1);
            recoveredSupporters[length(recoveredSupporters)] := supporterIds[i];
        end if
    end for

    {Exercise 2.4}
    {Data Outputs}
    if length(recoveredSupporters) = 0 then
        writeString("RESULTS");
        writeString("AVERAGE SUPPORTER AGE: " + toString(averageAge));
        writeString("NO SUPPORTERS RECOVERED.");
    else
        writeString("RESULTS");
        writeString("AVERAGE SUPPORTER AGE: " + toString(averageAge));

        for i := 0 to length(recoveredSupporters) do
            writeString("SUPPORTER ID: " + toString(recoveredSupporters[i]));
            writeString("AGE: " + toString(supporterAges[recoveredSupporters[i]]));
            writeString("HAS RECORDS (0-FALSE, 1-TRUE): " + toString(if supporterRecords[recoveredSupporters[i]] then 1 else 0));
            writeString("MEMBERSHIP TYPE: " + toString(supporterMembershipTypes[recoveredSupporters[i]]));
        end for
    end if
    
end algorithm