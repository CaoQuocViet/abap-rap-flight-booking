CLASS z_class_insert_flight DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun. " Implement the interface for console run
    METHODS: insert_data.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z_class_insert_flight IMPLEMENTATION.

    METHOD if_oo_adt_classrun~main.
      " Chạy phương thức insert_data khi bắt đầu thực thi
      insert_data( ).
    ENDMETHOD.

    METHOD insert_data.
      " Declare a table to hold the data to be inserted
      DATA lt_data TYPE TABLE OF zvietcq_flight.
      DATA ls_data TYPE zvietcq_flight.

      " Insert first record into flight table
      ls_data-mandt = '100'. " Client value
      ls_data-carrid = 'AA'. " Carrier ID
      ls_data-connid = '1001'. " Connection ID
      ls_data-fldate = '20240101'. " Flight Date (YYYYMMDD)
      ls_data-price = '250.00'. " Price
      ls_data-currency = 'USD'. " Currency Code
      ls_data-planetype = 'B737'. " Plane Type
      ls_data-seatsmax = 150. " Maximum Seats
      ls_data-seatsocc = 120. " Occupied Seats
      APPEND ls_data TO lt_data.

      " Insert second record
      CLEAR ls_data.
      ls_data-mandt = '100'.
      ls_data-carrid = 'DL'. " Carrier ID
      ls_data-connid = '1002'. " Connection ID
      ls_data-fldate = '20240102'. " Flight Date
      ls_data-price = '300.00'. " Price
      ls_data-currency = 'USD'. " Currency Code
      ls_data-planetype = 'A320'. " Plane Type
      ls_data-seatsmax = 180. " Maximum Seats
      ls_data-seatsocc = 150. " Occupied Seats
      APPEND ls_data TO lt_data.

      " Insert third record
      CLEAR ls_data.
      ls_data-mandt = '100'.
      ls_data-carrid = 'UA'. " Carrier ID
      ls_data-connid = '1003'. " Connection ID
      ls_data-fldate = '20240103'. " Flight Date
      ls_data-price = '275.00'. " Price
      ls_data-currency = 'USD'. " Currency Code
      ls_data-planetype = 'A330'. " Plane Type
      ls_data-seatsmax = 200. " Maximum Seats
      ls_data-seatsocc = 180. " Occupied Seats
      APPEND ls_data TO lt_data.

      " Insert fourth record
      CLEAR ls_data.
      ls_data-mandt = '100'.
      ls_data-carrid = 'BA'. " Carrier ID
      ls_data-connid = '1004'. " Connection ID
      ls_data-fldate = '20240104'. " Flight Date
      ls_data-price = '350.00'. " Price
      ls_data-currency = 'GBP'. " Currency Code
      ls_data-planetype = 'B777'. " Plane Type
      ls_data-seatsmax = 250. " Maximum Seats
      ls_data-seatsocc = 220. " Occupied Seats
      APPEND ls_data TO lt_data.

      " Insert fifth record
      CLEAR ls_data.
      ls_data-mandt = '100'.
      ls_data-carrid = 'LH'. " Carrier ID
      ls_data-connid = '1005'. " Connection ID
      ls_data-fldate = '20240105'. " Flight Date
      ls_data-price = '400.00'. " Price
      ls_data-currency = 'EUR'. " Currency Code
      ls_data-planetype = 'A350'. " Plane Type
      ls_data-seatsmax = 300. " Maximum Seats
      ls_data-seatsocc = 270. " Occupied Seats
      APPEND ls_data TO lt_data.

      " Insert additional records with varied data
      DO 15 TIMES.
        CLEAR ls_data.
        ls_data-mandt = '100'.

        " Assign carrier ID based on current iteration index
        IF sy-index = 1.
          ls_data-carrid = 'AA'.
        ELSEIF sy-index = 2.
          ls_data-carrid = 'DL'.
        ELSEIF sy-index = 3.
          ls_data-carrid = 'UA'.
        ELSEIF sy-index = 4.
          ls_data-carrid = 'BA'.
        ELSEIF sy-index = 5.
          ls_data-carrid = 'LH'.
        ELSEIF sy-index = 6.
          ls_data-carrid = 'AF'.
        ELSEIF sy-index = 7.
          ls_data-carrid = 'KLM'.
        ELSEIF sy-index = 8.
          ls_data-carrid = 'CX'.
        ELSEIF sy-index = 9.
          ls_data-carrid = 'QF'.
        ELSEIF sy-index = 10.
          ls_data-carrid = 'SQ'.
        ELSEIF sy-index = 11.
          ls_data-carrid = 'NH'.
        ELSEIF sy-index = 12.
          ls_data-carrid = 'AC'.
        ELSEIF sy-index = 13.
          ls_data-carrid = 'JL'.
        ELSEIF sy-index = 14.
          ls_data-carrid = 'EI'.
        ELSEIF sy-index = 15.
          ls_data-carrid = 'TG'.
        ENDIF.

        ls_data-connid = |10{ sy-index }|. " Connection ID
        ls_data-fldate = |202401{ sy-index }|. " Flight Date (YYYY + Index as day)
        ls_data-price = ( sy-index * 50 ) + 200. " Price (increased by 50 for each iteration)
        ls_data-currency = 'USD'. " Currency Code (assumed USD for simplicity)
        ls_data-planetype = 'A320'. " Plane Type
        ls_data-seatsmax = 200. " Maximum Seats
        ls_data-seatsocc = sy-index * 10. " Occupied Seats (increased as index increases)
        APPEND ls_data TO lt_data.
      ENDDO.

      " Insert all the data into the table
      INSERT zvietcq_flight FROM TABLE @lt_data.

    ENDMETHOD.

ENDCLASS.