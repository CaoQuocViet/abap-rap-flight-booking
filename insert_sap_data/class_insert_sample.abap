CLASS z_create_csv_structure DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun. " Implement the interface for console run
    METHODS: insert_data.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z_create_csv_structure IMPLEMENTATION.

    METHOD if_oo_adt_classrun~main.
      " Chạy phương thức insert_data khi bắt đầu thực thi
      insert_data( ).
    ENDMETHOD.
  
    METHOD insert_data.
      " Declare a table to hold the data to be inserted
      DATA lt_data TYPE TABLE OF [`zorders_table`](Dictionary/Database Tables/ZORDERS_TABLE.asddls).
      DATA ls_data TYPE [`zorders_table`](Dictionary/Database Tables/ZORDERS_TABLE.asddls).

      " Insert first row of data
      ls_data-client = '100'. " Client value (replace with actual value)
      ls_data-row_id = '0000000001'.
      ls_data-order_id = 'CA-2017-152156'.
      ls_data-order_date = '20170811'. " YYYYMMDD format
      ls_data-ship_date = '20171111'. " YYYYMMDD format
      ls_data-ship_mode = 'Second Class'.
      ls_data-customer_id = 'CG-12520'.
      ls_data-customer_name = 'Claire Gute'.
      ls_data-segment = 'Consumer'.
      ls_data-country = 'United States'.
      ls_data-city = 'Henderson'.
      ls_data-state = 'Kentucky'.
      ls_data-postal_code = '42420'.
      ls_data-region = 'South'.
      ls_data-product_id = 'FUR-BO-10001798'.
      ls_data-category = 'Furniture'.
      ls_data-sub_category = 'Bookcases'.
      ls_data-product_name = 'Bush Somerset Collection Bookcase'.
      ls_data-sales = '261.96'.
      ls_data-last_updated = sy-datum && sy-uzeit. " Current timestamp
      APPEND ls_data TO lt_data.

      " Insert second row of data
      CLEAR ls_data.
      ls_data-client = '100'.
      ls_data-row_id = '0000000002'.
      ls_data-order_id = 'CA-2017-152157'.
      ls_data-order_date = '20170812'.
      ls_data-ship_date = '20171112'.
      ls_data-ship_mode = 'First Class'.
      ls_data-customer_id = 'CG-12521'.
      ls_data-customer_name = 'John Doe'.
      ls_data-segment = 'Corporate'.
      ls_data-country = 'United States'.
      ls_data-city = 'New York'.
      ls_data-state = 'New York'.
      ls_data-postal_code = '10001'.
      ls_data-region = 'East'.
      ls_data-product_id = 'FUR-BO-10001799'.
      ls_data-category = 'Furniture'.
      ls_data-sub_category = 'Chairs'.
      ls_data-product_name = 'Ergonomic Office Chair'.
      ls_data-sales = '450.75'.
      ls_data-last_updated = sy-datum && sy-uzeit.
      APPEND ls_data TO lt_data.

      " Insert third row of data
      CLEAR ls_data.
      ls_data-client = '100'.
      ls_data-row_id = '0000000003'.
      ls_data-order_id = 'CA-2017-152158'.
      ls_data-order_date = '20170813'.
      ls_data-ship_date = '20171113'.
      ls_data-ship_mode = 'Second Class'.
      ls_data-customer_id = 'CG-12522'.
      ls_data-customer_name = 'Alice Smith'.
      ls_data-segment = 'Consumer'.
      ls_data-country = 'United States'.
      ls_data-city = 'Los Angeles'.
      ls_data-state = 'California'.
      ls_data-postal_code = '90001'.
      ls_data-region = 'West'.
      ls_data-product_id = 'FUR-BO-10001800'.
      ls_data-category = 'Furniture'.
      ls_data-sub_category = 'Tables'.
      ls_data-product_name = 'Modern Coffee Table'.
      ls_data-sales = '350.60'.
      ls_data-last_updated = sy-datum && sy-uzeit.
      APPEND ls_data TO lt_data.

      " Insert all the data into the table
      MODIFY [`zorders_table`](Dictionary/Database Tables/ZORDERS_TABLE.asddls) FROM TABLE @lt_data.

    ENDMETHOD.

ENDCLASS.