--SQL CreateDBSructure
--создание структуры базы данных DHLInvoiceDB
use DHLInvoiceDB;

-- tTaskLog - Таблица лога выполнения шедулера
if OBJECT_ID('tTaskLog') is null
begin
    create table tTaskLog
    (
     ID             Numeric(18, 0) identity  
    ,InDate         DateTime default GetDate()
    ,MessageType    nvarchar(60) 
    ,MessageText    nvarchar(1000)
    );
    --create index ao1 on tTaskLog(ID);
    grant all on tTaskLog to public;                          
end   

if OBJECT_ID('tDownloadFile') is null
begin
    create table tDownloadFile
    (
     ID             Numeric(18, 0) identity  
    ,FileName       nvarchar(255) 
    );
    --create index ao1 on tTaskLog(ID);
    grant all on tDownloadFile to public;                          
end  

if OBJECT_ID('tDownloadPdf') is null
begin
    create table tDownloadPdf
    (
     ID             Numeric(18, 0) identity  
    ,FileName       nvarchar(255) 
    );
    --create index ao1 on tTaskLog(ID);
    grant all on tDownloadPdf to public;                          
end  

if OBJECT_ID('tInvoice') is null
begin
    create table tInvoice
    (
     Account_Nr	             nvarchar(64)  --63035843845301,00
    ,OriginCountry	         nvarchar(64)  --GERMANY
    ,InvoiceDate             Datetime      --28.09.2023
    ,CreditNoteDate          Datetime      --28.09.2023
    ,CreditNote              nvarchar(64)  --2557377079
    ,InvoiceNr	             nvarchar(64)  --1574599859
    ,CountryCode             nvarchar(10)  --DE	
    ,Name_1	                 nvarchar(255) --X Anke Weber
    ,City	                   nvarchar(255) --X
    ,Postcode                nvarchar(32)  --X
    ,DestStn	               nvarchar(255) --
    ,DestCountry             nvarchar(10)  --BE
    ,Prod	                   int           --2110136
    ,PuDate                  Datetime      --08.08.2023
    ,Identcode               nvarchar(64)  --CA785311725DE 340434520195276000
    ,ShippersReference	     nvarchar(64)  --AU-223902-2023-09 _ MB2
    ,Pcs	                   int           --1
    ,VolWgt	                 int           --
    ,Wgt	                   nvarchar(64)  --1,6
    ,Wgt_Abr	               int           --1
    ,ChargeAmount	           nvarchar(64)  --0,07
    ,ExtraChargeAmount	     nvarchar(64)  --0,12
    ,VAT	                   nvarchar(64)  --0,01
    ,Total	                 nvarchar(64)  --0,08
    ,Discrepancy	           nvarchar(255) --
    ,TotalinclFinanceCosts   nvarchar(64)  --
    ,DownloadFileID          numeric(18, 0)--
    );

    grant all on tInvoice to public;                          
end   