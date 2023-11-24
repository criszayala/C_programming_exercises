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
    if supporter.membershipType = BASE then
        points := BASE_MEMBERSHIP_POINTS
    elseif supporter.membershipType = SILVER then
        points := SILVER_MEMBERSHIP_POINTS
    elseif supporter.membershipType = GOLD then
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
        
        writeString("Name:")
        supporters[i].name := readString()
        
        writeString("Age:")
        supporters[i].age := readInteger()
        
        writeString("Membership Years:")
        supporters[i].membershipYears := readInteger()
        
        writeString("Has Records (true/false):")
        supporters[i].hasRecords := readBoolean()
        
        { Aquí se puede utilizar la función getMembershipType para determinar el tipo de membresía }
        supporters[i].membershipType := getMembershipType(supporters[i].membershipYears)
    end for

    {Exercise 2.6}
    {Data processing}
    {Base case: consider the first supporter as selected}
    selectedSupporter := supporters[1]
    maxPoints := getPoints(selectedSupporter)

    {Looking for the supporter with the highest score}
    for i := 2 to NUM_SUPPORTERS do
        currentPoints := getPoints(supporters[i])
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