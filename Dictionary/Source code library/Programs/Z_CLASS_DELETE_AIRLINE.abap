CLASS z_class_delete_airline DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun. " Implement the interface for console run
    METHODS: delete_data.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z_class_delete_airline IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    " Execute the delete_data method when the program runs
    delete_data( ).
  ENDMETHOD.

  METHOD delete_data.
    " Delete all records from the zpsm_airline table
    DELETE FROM zpsm_airline.
  ENDMETHOD.

ENDCLASS.