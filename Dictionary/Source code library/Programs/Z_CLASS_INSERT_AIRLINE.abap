CLASS z_create_insert_airline DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun. " Implement the interface for console run
    METHODS: insert_data.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z_create_insert_airline IMPLEMENTATION.

    METHOD if_oo_adt_classrun~main.
      " Chạy phương thức insert_data khi bắt đầu thực thi
      insert_data( ).
    ENDMETHOD.

    METHOD insert_data.
      " Declare a table to hold the data to be inserted
      DATA lt_data TYPE TABLE OF zpsm_scarr.
      DATA ls_data TYPE zpsm_scarr.

      " Insert first record into airline table
      ls_data-mandt = '100'. " Client value (replace with actual value)
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

      " Insert all the data into the table
      INSERT zpsm_scarr FROM TABLE lt_data.

    ENDMETHOD.

ENDCLASS.
