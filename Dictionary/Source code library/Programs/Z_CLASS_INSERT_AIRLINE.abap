CLASS z_class_insert_airline DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun. " Implement the interface for console run
    METHODS: insert_data.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z_class_insert_airline IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    " Execute the insert_data method when the program runs
    insert_data( ).
  ENDMETHOD.

  METHOD insert_data.
    " Declare a table to hold the data to be inserted
    DATA lt_data TYPE TABLE OF zpsm_airline.
    DATA ls_data TYPE zpsm_airline.

    " Insert first record into airline table
    ls_data-mandt = '100'. " Client value
    ls_data-carrid = 'AA'. " Carrier ID
    ls_data-carrname = 'American Airlines'. " Airline name
    ls_data-currcode = 'USD'. " Currency Code
    ls_data-url = 'http://www.americanairlines.com'. " Airline URL
    ls_data-lastchangedat = sy-datum && sy-uzeit. " Timestamp
    APPEND ls_data TO lt_data.

    " Insert second record
    CLEAR ls_data.
    ls_data-mandt = '100'.
    ls_data-carrid = 'DL'. " Carrier ID
    ls_data-carrname = 'Delta Airlines'. " Airline name
    ls_data-currcode = 'USD'. " Currency Code
    ls_data-url = 'http://www.delta.com'. " Airline URL
    ls_data-lastchangedat = sy-datum && sy-uzeit.
    APPEND ls_data TO lt_data.

    " Insert third record
    CLEAR ls_data.
    ls_data-mandt = '100'.
    ls_data-carrid = 'UA'. " Carrier ID
    ls_data-carrname = 'United Airlines'. " Airline name
    ls_data-currcode = 'USD'. " Currency Code
    ls_data-url = 'http://www.united.com'. " Airline URL
    ls_data-lastchangedat = sy-datum && sy-uzeit.
    APPEND ls_data TO lt_data.

    " Insert fourth record
    CLEAR ls_data.
    ls_data-mandt = '100'.
    ls_data-carrid = 'BA'. " Carrier ID
    ls_data-carrname = 'British Airways'. " Airline name
    ls_data-currcode = 'GBP'. " Currency Code
    ls_data-url = 'http://www.britishairways.com'. " Airline URL
    ls_data-lastchangedat = sy-datum && sy-uzeit.
    APPEND ls_data TO lt_data.

    " Insert fifth record
    CLEAR ls_data.
    ls_data-mandt = '100'.
    ls_data-carrid = 'LH'. " Carrier ID
    ls_data-carrname = 'Lufthansa'. " Airline name
    ls_data-currcode = 'EUR'. " Currency Code
    ls_data-url = 'http://www.lufthansa.com'. " Airline URL
    ls_data-lastchangedat = sy-datum && sy-uzeit.
    APPEND ls_data TO lt_data.

    " Insert sixth record
    CLEAR ls_data.
    ls_data-mandt = '100'.
    ls_data-carrid = 'AF'. " Carrier ID
    ls_data-carrname = 'Air France'. " Airline name
    ls_data-currcode = 'EUR'. " Currency Code
    ls_data-url = 'http://www.airfrance.com'. " Airline URL
    ls_data-lastchangedat = sy-datum && sy-uzeit.
    APPEND ls_data TO lt_data.

    " Insert seventh record
    CLEAR ls_data.
    ls_data-mandt = '100'.
    ls_data-carrid = 'KLM'. " Carrier ID
    ls_data-carrname = 'KLM Royal Dutch Airlines'. " Airline name
    ls_data-currcode = 'EUR'. " Currency Code
    ls_data-url = 'http://www.klm.com'. " Airline URL
    ls_data-lastchangedat = sy-datum && sy-uzeit.
    APPEND ls_data TO lt_data.

    " Insert eighth record
    CLEAR ls_data.
    ls_data-mandt = '100'.
    ls_data-carrid = 'CX'. " Carrier ID
    ls_data-carrname = 'Cathay Pacific'. " Airline name
    ls_data-currcode = 'HKD'. " Currency Code
    ls_data-url = 'http://www.cathaypacific.com'. " Airline URL
    ls_data-lastchangedat = sy-datum && sy-uzeit.
    APPEND ls_data TO lt_data.

    " Insert ninth record
    CLEAR ls_data.
    ls_data-mandt = '100'.
    ls_data-carrid = 'QF'. " Carrier ID
    ls_data-carrname = 'Qantas'. " Airline name
    ls_data-currcode = 'AUD'. " Currency Code
    ls_data-url = 'http://www.qantas.com'. " Airline URL
    ls_data-lastchangedat = sy-datum && sy-uzeit.
    APPEND ls_data TO lt_data.

    " Insert tenth record
    CLEAR ls_data.
    ls_data-mandt = '100'.
    ls_data-carrid = 'SQ'. " Carrier ID
    ls_data-carrname = 'Singapore Airlines'. " Airline name
    ls_data-currcode = 'SGD'. " Currency Code
    ls_data-url = 'http://www.singaporeair.com'. " Airline URL
    ls_data-lastchangedat = sy-datum && sy-uzeit.
    APPEND ls_data TO lt_data.

    " Insert eleventh record
    CLEAR ls_data.
    ls_data-mandt = '100'.
    ls_data-carrid = 'NH'. " Carrier ID
    ls_data-carrname = 'All Nippon Airways'. " Airline name
    ls_data-currcode = 'JPY'. " Currency Code
    ls_data-url = 'http://www.ana.co.jp'. " Airline URL
    ls_data-lastchangedat = sy-datum && sy-uzeit.
    APPEND ls_data TO lt_data.

    " Insert twelfth record
    CLEAR ls_data.
    ls_data-mandt = '100'.
    ls_data-carrid = 'AC'. " Carrier ID
    ls_data-carrname = 'Air Canada'. " Airline name
    ls_data-currcode = 'CAD'. " Currency Code
    ls_data-url = 'http://www.aircanada.com'. " Airline URL
    ls_data-lastchangedat = sy-datum && sy-uzeit.
    APPEND ls_data TO lt_data.

    " Insert thirteenth record
    CLEAR ls_data.
    ls_data-mandt = '100'.
    ls_data-carrid = 'JL'. " Carrier ID
    ls_data-carrname = 'Japan Airlines'. " Airline name
    ls_data-currcode = 'JPY'. " Currency Code
    ls_data-url = 'http://www.jal.co.jp'. " Airline URL
    ls_data-lastchangedat = sy-datum && sy-uzeit.
    APPEND ls_data TO lt_data.

    " Insert fourteenth record
    CLEAR ls_data.
    ls_data-mandt = '100'.
    ls_data-carrid = 'EI'. " Carrier ID
    ls_data-carrname = 'Aer Lingus'. " Airline name
    ls_data-currcode = 'EUR'. " Currency Code
    ls_data-url = 'http://www.aerlingus.com'. " Airline URL
    ls_data-lastchangedat = sy-datum && sy-uzeit.
    APPEND ls_data TO lt_data.

    " Insert fifteenth record
    CLEAR ls_data.
    ls_data-mandt = '100'.
    ls_data-carrid = 'TG'. " Carrier ID
    ls_data-carrname = 'Thai Airways'. " Airline name
    ls_data-currcode = 'THB'. " Currency Code
    ls_data-url = 'http://www.thaiairways.com'. " Airline URL
    ls_data-lastchangedat = sy-datum && sy-uzeit.
    APPEND ls_data TO lt_data.

    " Insert all the data into the table
    INSERT zpsm_airline FROM TABLE @lt_data.

  ENDMETHOD.

ENDCLASS.