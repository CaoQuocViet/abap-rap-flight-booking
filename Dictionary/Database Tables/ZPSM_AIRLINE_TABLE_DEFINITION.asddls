@EndUserText.label : 'Airline Table'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #RESTRICTED
define table zpsm_scarr {

  key mandt     : abap.clnt not null;
  key carrid    : zcarrid not null;
  carrname      : abap.char(25);
  currcode      : waers;
  url           : abap.char(128);
  lastchangedat : timestampl;

}