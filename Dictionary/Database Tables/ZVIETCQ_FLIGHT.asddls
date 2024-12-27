@EndUserText.label : 'Flight Table'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #RESTRICTED
define table zvietcq_flight {

  key mandt  : abap.clnt not null;
  key carrid : abap.char(3) not null;
  key connid : abap.numc(4) not null;
  key fldate : abap.dats not null;
  @Semantics.amount.currencyCode : 'zdemo_flight.currency'
  price      : abap.curr(16,2);
  currency   : waers;
  planetype  : abap.char(10);
  seatsmax   : abap.int4;
  seatsocc   : abap.int4;

}