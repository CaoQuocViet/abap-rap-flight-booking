import csv
from datetime import datetime

def clean_value(value):
    """Remove ", ', and ` characters from the input string."""
    return value.replace('"', '').replace("'", "").replace('`', '')

def convert_csv_to_abap(input_csv='train.csv', output_txt='insert_business_data_class.abap'):
    with open(input_csv, 'r', encoding='utf-8') as csvfile, open(output_txt, 'w', encoding='utf-8') as txtfile:
        # Add the initial ABAP declarations
        txtfile.write("CLASS z_create_csv_structure DEFINITION\n")
        txtfile.write("  PUBLIC\n")
        txtfile.write("  FINAL\n")
        txtfile.write("  CREATE PUBLIC.\n\n")
        
        txtfile.write("  PUBLIC SECTION.\n")
        txtfile.write("    INTERFACES if_oo_adt_classrun. \" Implement the interface for console run\n")
        txtfile.write("    METHODS: insert_data.\n\n")
        
        txtfile.write("  PROTECTED SECTION.\n")
        txtfile.write("  PRIVATE SECTION.\n")
        txtfile.write("ENDCLASS.\n\n")
        
        txtfile.write("CLASS z_create_csv_structure IMPLEMENTATION.\n\n")
        
        txtfile.write("  METHOD if_oo_adt_classrun~main.\n")
        txtfile.write("    \" Chạy phương thức insert_data khi bắt đầu thực thi\n")
        txtfile.write("    insert_data( ).\n")
        txtfile.write("  ENDMETHOD.\n\n")
        
        txtfile.write("  METHOD insert_data.\n")
        txtfile.write("    \" Declare a table to hold the data to be inserted\n")
        txtfile.write("    DATA lt_data TYPE TABLE OF zorders_table.\n")
        txtfile.write("    DATA ls_data TYPE zorders_table.\n\n")
        
        reader = csv.DictReader(csvfile)
        row_id = 1
        for row in reader:
            # Format dates as YYYYMMDD
            order_date = datetime.strptime(row['Order Date'], '%d/%m/%Y').strftime('%Y%m%d')
            ship_date = datetime.strptime(row['Ship Date'], '%d/%m/%Y').strftime('%Y%m%d')
            # Get current time in HHMMSS format
            current_time = datetime.now().strftime('%H%M%S')
            # Format row_id as 10-digit zero-padded string
            formatted_row_id = f"{row_id + 1:010}"
            
            txtfile.write(f'    " Insert row {row_id} of data\n')
            txtfile.write("    CLEAR ls_data.\n")
            txtfile.write("    ls_data-client = '100'.\n")
            txtfile.write(f"    ls_data-row_id = '{formatted_row_id}'.\n")
            txtfile.write(f"    ls_data-order_id = '{clean_value(row['Order ID'])}'.\n")
            txtfile.write(f"    ls_data-order_date = '{order_date}'.\n")
            txtfile.write(f"    ls_data-ship_date = '{ship_date}'.\n")
            txtfile.write(f"    ls_data-ship_mode = '{clean_value(row['Ship Mode'])}'.\n")
            txtfile.write(f"    ls_data-customer_id = '{clean_value(row['Customer ID'])}'.\n")
            txtfile.write(f"    ls_data-customer_name = '{clean_value(row['Customer Name'])}'.\n")
            txtfile.write(f"    ls_data-segment = '{clean_value(row['Segment'])}'.\n")
            txtfile.write(f"    ls_data-country = '{clean_value(row['Country'])}'.\n")
            txtfile.write(f"    ls_data-city = '{clean_value(row['City'])}'.\n")
            txtfile.write(f"    ls_data-state = '{clean_value(row['State'])}'.\n")
            txtfile.write(f"    ls_data-postal_code = '{clean_value(row['Postal Code'])}'.\n")
            txtfile.write(f"    ls_data-region = '{clean_value(row['Region'])}'.\n")
            txtfile.write(f"    ls_data-product_id = '{clean_value(row['Product ID'])}'.\n")
            txtfile.write(f"    ls_data-category = '{clean_value(row['Category'])}'.\n")
            txtfile.write(f"    ls_data-sub_category = '{clean_value(row['Sub-Category'])}'.\n")
            txtfile.write(f"    ls_data-product_name = '{clean_value(row['Product Name'])}'.\n")
            txtfile.write(f"    ls_data-sales = '{clean_value(row['Sales'])}'.\n")
            txtfile.write(f"    ls_data-last_updated = '{current_time}'.\n")
            txtfile.write("    APPEND ls_data TO lt_data.\n\n")
            row_id += 1
        
        # Add the final ABAP insertion logic
        txtfile.write("    \" Insert all the data into the table\n")
        txtfile.write("    MODIFY zorders_table FROM TABLE @lt_data.\n\n")
        txtfile.write("  ENDMETHOD.\n\n")
        txtfile.write("ENDCLASS.\n")

if __name__ == '__main__':
    convert_csv_to_abap()