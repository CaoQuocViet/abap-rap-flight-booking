CLASS z_class_delete_flight DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun. " Implement the interface for console run
    METHODS: delete_data.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z_class_delete_flight IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    " Execute the delete_data method when the program runs
    delete_data( ).
  ENDMETHOD.

  METHOD delete_data.
    " Delete all records from the zdemo_flight table
    DELETE FROM zvietcq_flight.
  ENDMETHOD.

ENDCLASS.