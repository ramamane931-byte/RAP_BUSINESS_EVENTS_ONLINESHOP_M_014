*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lhe_item DEFINITION INHERITING FROM cl_abap_behavior_event_handler.
  PRIVATE SECTION.
    METHODS get_uuid RETURNING VALUE(uuid) TYPE sysuuid_x16.

    METHODS on_item_is_ordered FOR ENTITY EVENT
       created FOR shop~ItemIsOrdered.
ENDCLASS.


CLASS lhe_item IMPLEMENTATION.

  METHOD get_uuid.
    TRY.
        uuid = cl_system_uuid=>create_uuid_x16_static( ) .
      CATCH cx_uuid_error.
    ENDTRY.
  ENDMETHOD.

  METHOD on_item_is_ordered.
    "close the active modify phase
    cl_abap_tx=>save( ).

    " assign values in abstract entity ZI_AB_ITEM_ORDER_M_014 to table for event handler
    " loop over transfered instances and do the needful ;)
    LOOP AT created REFERENCE INTO DATA(lr_created).
      "" Event Handler table Item Created: 'ztbl_itemorderd'.
      DATA lr_item_is_ordered TYPE ztbl_itemorderd.
      MOVE-CORRESPONDING lr_created->* TO lr_item_is_ordered.
      lr_item_is_ordered-uuid        = get_uuid( ).
      lr_item_is_ordered-itemname   = lr_created->ItemName.
      GET TIME STAMP FIELD lr_item_is_ordered-created_at.
*      lr_item_is_ordered-created_at  = utclong_current( ).""lr_created->created_at.

      "insert to db : 'ztbl_itemorderd'
      INSERT ztbl_itemorderd FROM @lr_item_is_ordered.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
