CLASS lsc_zr_tbl_onlineshop DEFINITION INHERITING FROM cl_abap_behavior_saver.

  PROTECTED SECTION.

    METHODS save_modified REDEFINITION.

ENDCLASS.

CLASS lsc_zr_tbl_onlineshop IMPLEMENTATION.

  METHOD save_modified.

    IF create-shop IS NOT INITIAL.
      RAISE ENTITY EVENT zr_tbl_onlineshop~ItemIsOrdered
      FROM VALUE #( FOR shop IN create-shop (
                    %key = shop-%key %param-ItemName = shop-Ordereditem
                    ) ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.

CLASS lhc_zr_tbl_onlineshop DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR shop
        RESULT result.
ENDCLASS.

CLASS lhc_zr_tbl_onlineshop IMPLEMENTATION.
  METHOD get_global_authorizations.
  ENDMETHOD.
ENDCLASS.
