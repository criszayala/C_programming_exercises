const
    MAX_SUPPORTERS: integer = 10; {Max. supporters}
    MAX_TICKETS: integer = 10; {Max. tickets per supporter}
    MAX_EVENTS_TYPE: integer = 3; {Max. events type}
end const

type
    {User defined types}
    {Error type}
    tError = {OK, ERR_CANNOT_READ, ERR_MEMORY, ERR_NOT_FOUND}

    {Event type}
    tEventType = {FOOTBALL_MATCH, CONCERT, EXPO}

    tTicket = record
        eventType: tEventType;
        price: real;
    end record

    tTicketTable = record
        table: vector[MAX_TICKETS] of tTicket;
        nTickets: integer;
    end record
    
    tSupporter = record
        id: integer;
        name: string;
        age: integer;
        tickets: tTicketTable;
    end record

    tSupporterTable = record
        table: vector[MAX_SUPPORTERS] of tSupporter;
        nSupporters: integer;
    end record
end type

{Exercise 2.1}
action supporterTableInit(out tabSupporters: tSupporterTable)
    tabSupporters.nSupporters := 0;
end action

{Exercise 2.2}
action supporterTableAdd(inout tabSupporters: tSupporterTable, in supporter: tSupporter, out retVal: tError)
    if tabSupporters.nSupporters < MAX_SUPPORTERS then
        tabSupporters.table[tabSupporters.nSupporters] := supporter;
        tabSupporters.nSupporters := tabSupporters.nSupporters + 1;
        retVal := OK;
    else
        retVal := ERR_MEMORY;
    end if;
end action

{Exercise 2.3}
function averageSpendingByEvent(supporter: tSupporter, eventType: tEventType): real;
var
    totalSpending: real;
    count: integer;
    i: integer;
    totalSpending := 0; 
    count := 0; 

    for i := 1 to supporter.tickets.nTickets do
        if supporter.tickets.table[i].eventType = eventType then
            totalSpending := totalSpending + supporter.tickets.table[i].price;
            count := count + 1;
        end if;
    end for;

    if count > 0 then
        averageSpendingByEvent := totalSpending / count
    else
        averageSpendingByEvent := 0;
end function;

algorithm UOCStadium
var
    tabSupporters: tSupporterTable;
    supporter: tSupporter;
    filename: string;
    retVal: tError;
    supporterId: integer;
    i: integer;
    eventType: tEventType;
    averageSpending: real;
end var

    {Exercise 2.4}
    {Supporters table initialization}
    supporterTableInit(tabSupporters);

    {Load data from file}
    writeString("LOAD DATA FROM FILE. ENTER FILE NAME:");
    filename := readString();
    supportersTableLoad(filename, tabSupporters, retVal);

    {Data processing}
    if retVal = OK then
        {Show supporters list loaded}
        writeTabSupporters(tabSupporters);
    else
        writeString("NO SUPPORTERS RECOVERED");
    end if;

    {Exercise 2.5}
    writeString("SELECT SUPPORTER (ID):");
    supporterId := readInteger();
    retrieveSupporter(tabSupporters, supporterId, supporter, retVal);

    if retVal = OK then
        for i := 1 to supporter.tickets.nTickets do
            writeTicket(supporter.tickets.table[i]);
        end for;

        writeString("SELECT EVENT TYPE (1-FOOTBALL MATCH, 2-CONCERT, 3-EXPO):");
        eventType := readEventType();
        averageSpending := averageSpendingByEvent(supporter, eventType);
        
        writeString("AVERAGE SPENDING: ");
        writeReal(averageSpending);
    else
        {No supporter recovered}
        writeString("NO SUPPORTER RECOVERED");
    end if;
end algorithm