@AbapCatalog.sqlViewName: 'ZCFLIGHT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Connection Views CDS Data Model'

@UI.headerInfo: { typeNamePlural: 'Flights',
                  typeName: 'Flight',
                  title: { value: 'Carrid' },
                  description: { value: 'Connid' } 
                 } 
@Search.searchable: true 
@UI.chart: [{ chartType: #DONUT, 
              qualifier: 'chartUtilization',
              measures: [ 'Utilization' ],
              measureAttributes: [{ measure: 'Utilization',
                                    role: #AXIS_1 ,
                                    asDataPoint: true }]              
            }]                

define view ZPSM_FLIGHT_VIEW as select from zvietcq_flight
  association [1..1] to zpsm_airline as _Airline on $projection.Carrid = _Airline.carrid
{
    @UI.facet: [{ label: 'Flight Info.',
                  type: #IDENTIFICATION_REFERENCE  }]    
    @UI.lineItem: [{ position: 10, importance: #HIGH }]
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.8
    @UI.selectionField: [{ position: 10 }]
    @EndUserText.label: 'Airline'
    @EndUserText.quickInfo: 'Carrier ID with text for the Flight'
    @ObjectModel.text.element: [ 'Carrname' ]
    key carrid as Carrid,
    
    @UI.lineItem: [{ position: 20, importance: #HIGH }] 
    @EndUserText.label: 'Connection ID'   
    key connid as Connid,
    
    @UI.lineItem: [{ position: 30, importance: #HIGH }]
    @UI.identification: [{ position: 10 }]
    @UI.selectionField: [{ position: 20 }]    
    @EndUserText.label: 'Flight Date'     
    key fldate as Fldate,
    
    _Airline.carrname as Carrname,
    
    @UI.lineItem: [{ position: 40, importance: #HIGH }]  
    @UI.identification: [{ position: 20 }]  
    @Semantics.amount.currencyCode: 'Currency'
    price as Price,
    
    @UI.hidden: true
    currency as Currency,
    
    @UI.lineItem: [{ position: 50, importance: #LOW }] 
    @UI.identification: [{ position: 30 }]       
    @EndUserText.label: 'Plane Type'  
    @Search.defaultSearchElement: true  
    @Search.fuzzinessThreshold: 0.8         
    planetype as Planetype,   
    
    @EndUserText.label: 'Maximun Seats'         
    seatsmax as Seatsmax,
    
    @EndUserText.label: 'Occupied Seats'       
    seatsocc as Seatsocc,
    
    @UI.lineItem: [{ position: 80, label: 'Occupied Seats', type: #AS_DATAPOINT, importance: #HIGH }]
    @UI.dataPoint: { visualization: #PROGRESS, targetValueElement: 'Seatsmax',
                     criticalityCalculation: { deviationRangeLowValue: 20.00,
                                               toleranceRangeLowValue: 80.00,
                                               improvementDirection: #MAXIMIZE } } 
    seatsocc as OccupiedSeats,
    
    @UI.lineItem: [{ position: 90, label: 'Available Seats' }]
    // Tính toán FreeSeats: Số ghế còn trống
    seatsmax - seatsocc as FreeSeats,

    // Tính toán CriticalFreeSeats bằng cách sử dụng phép toán
    (cast( seatsmax as abap.fltp ) - cast( seatsocc as abap.fltp )) * cast( 100 as abap.fltp ) / cast( seatsmax as abap.fltp ) as CriticalFreeSeatsPercentage,

    // Đổi tên để tránh trùng lặp:
    @UI.lineItem: [{ position: 100, label: 'Critical Free Seats Percentage' }] 
    (cast( seatsmax as abap.fltp ) - cast( seatsocc as abap.fltp )) * cast( 100 as abap.fltp ) / cast( seatsmax as abap.fltp ) as CriticalFSPercentage,

    @UI.lineItem: [{ position: 110, label: 'Utilization(%)', importance: #HIGH,
                     type: #AS_CHART, valueQualifier: 'chartUtilization' }]    
    @UI.dataPoint: { criticalityCalculation: { deviationRangeLowValue: 20.00,
                                               toleranceRangeLowValue: 80.00,
                                               improvementDirection: #MAXIMIZE } }                        

    // Tính toán tỷ lệ Utilization
    cast( seatsocc as abap.fltp ) * cast( 100 as abap.fltp ) / cast( seatsmax as abap.fltp ) as Utilization,

    @UI.lineItem: [{ position: 120, label: 'Web Site', importance: #HIGH,
                     type: #WITH_URL, url: 'Url' }] 
    _Airline.url as Url                       
}
