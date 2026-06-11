@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'ZONLINESHOP'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_ONLINESHOP_M_014
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_TBL_ONLINESHOP
  association [1..1] to ZR_TBL_ONLINESHOP as _BaseEntity on $projection.ORDERUUID = _BaseEntity.ORDERUUID
{
  key OrderUUID,
  OrderID,
  Ordereditem,
  Deliverydate,
  Creationdate,
  @Semantics: {
    User.Createdby: true
  }
  LocalCreatedBy,
  @Semantics: {
    Systemdatetime.Createdat: true
  }
  LocalCreatedAt,
  @Semantics: {
    User.Localinstancelastchangedby: true
  }
  LocalLastChangedBy,
  @Semantics: {
    Systemdatetime.Localinstancelastchangedat: true
  }
  LocalLastChangedAt,
  @Semantics: {
    Systemdatetime.Lastchangedat: true
  }
  LastChangedAt,
  _BaseEntity
}
