const
    //Defino las constantes
    NUM_SUPPORTERS: integer = 3;
    BASE_MEMBERSHIP_YEARS: integer = 5;
    SILVER_MEMBERSHIP_YEARS: integer = 10;
    BASE_MEMBERSHIP_POINTS: integer = 10;
    SILVER_MEMBERSHIP_POINTS: integer = 15;
    GOLD_MEMBERSHIP_POINTS: integer = 20;
    RECORDS_PENALTY_POINTS: integer = 5;
end const

//Defino los tipos de membresía (mismos que la PR1)
type
    tMembershipType = enumeration {BASE, SILVER, GOLD}
end type

//Defino la estructura para guardar la información del SUPPORTER (tupla)
type
    tSupporter = record
        name: string;
        age: integer;
        membershipYears: integer;
        hasRecords: boolean;
    end record
end type

{Exercise 2.1}
//Defino la función que determina el tipo de membresía según los años
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
//Defino función para obtener información de los SUPPORTERS
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
//Defino esta función para mostrar por la información del SUPPORTER
action writeSupporter(supporter: tSupporter)
    writeString("NAME: " + supporter.name)
    writeString("AGE: " + toString(supporter.age))
    writeString("MEMBERSHIP YEARS: " + toString(supporter.membershipYears))
    writeString("HAS RECORDS (0-FALSE, 1-TRUE): " + toString(supporter.hasRecords))
    writeString("MEMBERSHIP TYPE (1-BASE, 2-SILVER, 3-GOLD): " + toString(supporter.membershipType + 1))
    writeString("POINTS: " + toString(getPoints(supporter)))
end action

{Exercise 2.4}
function getPoints(supporter: tSupporter) return integer
    var
        points: integer

    points := 0
    //Asigno una puntuación dependiendo el tipo de membresía
    if supporter.membershipType = BASE then
        points := BASE_MEMBERSHIP_POINTS
    else if supporter.membershipType = SILVER then
        points := SILVER_MEMBERSHIP_POINTS
    else if supporter.membershipType = GOLD then
        points := GOLD_MEMBERSHIP_POINTS
    end if

    //Si el SUPPORTER tiene antecedentes aplico la penalización
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
    //Solicito al usuario que ingrese los datos de cada SUPORTERS
    writeString("INPUT DATA")
    for i := 1 to NUM_SUPPORTERS do
        readSupporter(supporters[i])
    end for

    {Exercise 2.6}
    {Data processing}
    selectedSupporter := supporters[1]
    maxPoints := getPoints(selectedSupporter)

    //Se identifica el SUPPORTER que tiene más puntos
    for i := 2 to NUM_SUPPORTERS do
        currentPoints := getPoints(supporters[i])
        if (currentPoints > maxPoints) or 
        (currentPoints = maxPoints and supporters[i].membershipYears > selectedSupporter.membershipYears) then
            selectedSupporter := supporters[i]
            maxPoints := currentPoints
        end if
    end for

    //Se muestra por pantalla el SUPPORTER seleccionado
    writeString("SELECTED SUPPORTER")
    writeSupporter(selectedSupporter)
end algorithm