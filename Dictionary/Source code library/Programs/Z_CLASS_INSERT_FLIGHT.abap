CLASS z_create_insert_flight DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun. " Implement the interface for console run
    METHODS: insert_data.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z_create_insert_flight IMPLEMENTATION.

    METHOD if_oo_adt_classrun~main.
      " Chạy phương thức insert_data khi bắt đầu thực thi
      insert_data( ).
    ENDMETHOD.

    METHOD insert_data.
      " Declare a table to hold the data to be inserted
      DATA lt_data TYPE TABLE OF zdemo_flight.
      DATA ls_data TYPE zdemo_flight.

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
        ls_data-carrid = CASE sy-index
                           WHEN 1 THEN 'AA'
                           WHEN 2 THEN 'DL'
                           WHEN 3 THEN 'UA'
                           WHEN 4 THEN 'BA'
                           WHEN 5 THEN 'LH'
                           WHEN 6 THEN 'AF'
                           WHEN 7 THEN 'KLM'
                           WHEN 8 THEN 'CX'
                           WHEN 9 THEN 'QF'
                           WHEN 10 THEN 'SQ'
                           WHEN 11 THEN 'NH'
                           WHEN 12 THEN 'AC'
                           WHEN 13 THEN 'JL'
                           WHEN 14 THEN 'EI'
                           WHEN 15 THEN 'TG'
                         ENDCASE.

        ls_data-connid = '10' + sy-index. " Connection ID
        ls_data-fldate = '202401' && sy-index. " Flight Date (Year + Index as day)
        ls_data-price = ( sy-index * 50 ) + 200. " Price (increased by 50 for each iteration)
        ls_data-currency = 'USD'. " Currency Code (assumed USD for simplicity)
        ls_data-planetype = 'A320'. " Plane Type
        ls_data-seatsmax = 200. " Maximum Seats
        ls_data-seatsocc = sy-index * 10. " Occupied Seats (increased as index increases)
        APPEND ls_data TO lt_data.
      ENDDO.

      " Insert all the data into the table
      INSERT zdemo_flight FROM TABLE lt_data.

    ENDMETHOD.

ENDCLASS.
