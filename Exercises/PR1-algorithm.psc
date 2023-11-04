const
    MIN_SUPPORTERS: integer = 1; {Min. number of supporters}
    MAX_SUPPORTERS: integer = 10; {Max. number of supporters}
    BASE_MEMBERSHIP_YEARS: integer = 5; {Max. years base membership}
    SILVER_MEMBERSHIP_YEARS: integer = 10; {Max. years silver membership}
    end const

type
    tMembershipType = {BASE, SILVER, GOLD}
end type

algorithm UOCStadium
    {Variable definitions}
    var
        supporterIds: vector[MAX_SUPPORTERS] of integer;
        supporterAges: vector[MAX_SUPPORTERS] of integer;
        supporterRecords: vector[MAX_SUPPORTERS] of boolean;
        membershipYears: integer;

        i: integer;
        numSupporters: integer;
        recoveredSupporters: vector[MAX_SUPPORTERS] of integer;
        supporterMembershipTypes: vector[MAX_SUPPORTERS] of tMembershipType;
        sumaAge: integer;
        averageAge: real;
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
    i := 1;
    sumaAge := 0;
    averageAge := 0;
    
    for i := 1 to numSupporters do
        writeString("SUPPORTER #" + toString(i););
        supporterIds[i] := i

        writeString("AGE (AN INTEGER)?");
        supporterAges[i] := readInteger();
        sumaAge: = sumaAge + supporterAges[i];

        writeString("HAS RECORDS (0-FALSE, 1-TRUE)? ");
        supporterRecords[i] := readBoolean();

        writeString("MEMBERSHIP YEARS (AN INTEGER)?");
        membershipYears[i] := readInteger();
         i = i + 1;
    end for

    {Calculate the average age}
    averageAge := (sumaAge / numSupporters);

    {Exercise 2.3}
    {Data input}
    writeString("LOOKING FOR SUPPORTERS");
    writeString("MEMBERSHIP TYPE (1-BASE, 2-SILVER, 3-GOLD)?");
    {...}

    {Data Processing}
    {...};
    for i := 1 to numSupporters do
        {...}
    end for

    {Data processing and Data Outputs}
    {Exercise 2.4}
    writeString("RESULTS");
    writeString("AVERAGE SUPPORTER AGE:");
    {...}
end algorithm





ticketing
- Venta de localidades de cada partido
- Eventos

Información para generar perfiles de aficionados para futuras campañas de publicidad
Grupo de aficionados | Ingreso por el usuario
Carecer de antecedentes penales
Edad sea igual o menor a la media de edad del grupo de aficionados

