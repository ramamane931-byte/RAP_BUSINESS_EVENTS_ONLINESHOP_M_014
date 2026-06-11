@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZONLINESHOP'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_TBL_ONLINESHOP
  as select from ZTBL_ONLINESHOP as shop
{
  key order_uuid as OrderUUID,
  order_id as OrderID,
  ordereditem as Ordereditem,
  deliverydate as Deliverydate,
  creationdate as Creationdate,
  @Semantics.user.createdBy: true
  local_created_by as LocalCreatedBy,
  @Semantics.systemDateTime.createdAt: true
  local_created_at as LocalCreatedAt,
  @Semantics.user.localInstanceLastChangedBy: true
  local_last_changed_by as LocalLastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt
}
