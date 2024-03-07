unit uUtilsTask;

interface

{$POINTERMATH ON}


uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.FileCtrl, Vcl.Grids,
  DateUtils,IOUtils,Registry, ComObj,

  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Error,

  tgputtylib, tgputtysftp, Vcl.ComCtrls

  ;

type

   TTask=class(TThread)

   private
    FbtnExecute: tControl;

    FFileList: TStringList;

    FFTP: TTGPuttySFTP;
    FConnection: TFDConnection;
    function ListingCallback(const names:Pfxp_names):Boolean;
    function VerifyHostKeyCallback(const host:PAnsiChar;const port:Integer;const fingerprint:PAnsiChar;const verificationstatus:Integer;var storehostkey:Boolean):Boolean;
    procedure MessageCallback(const Msg:AnsiString;const isstderr:Boolean);
    function ProgressCallback(const bytescopied:Int64;const isupload:Boolean):Boolean;
    function GetInputCallback(var cancel:Boolean):AnsiString;
   // function ParseDhlShipments():boolean;
    procedure SetConnection(const Value: TFDConnection);
    function GetFTP: TTGPuttySFTP;
    property Connection: TFDConnection read FConnection write SetConnection;


    property btnExecute: tControl read FbtnExecute write FbtnExecute;

    /// <summary>
    ///  FTPConnect -
    ///</summary>
    function FTPConnect(): Boolean;

    /// <summary>
    ///  DownloadFiles -
    ///</summary>
    procedure DownloadFiles();

    procedure LoadCsv(AFileName: String; DownloadFileID: integer);

    /// <summary>
    ///  FileNameInsert - добавление наименования скаченного файла в базу
    ///</summary>
    function FileNameInsert(ATableName: string; AFileName: string): Integer;

    /// <summary>
    ///  TaskLogInsert - Добавление информации/записи о выполнении задачи.
    ///  Лог выполнения задачи
    ///  0 - i
    ///  1 - ok
    ///  2 - err
    ///  3 - stop
    ///</summary>
    procedure TaskLogInsert(mType, mText: string);

    procedure TaskLogRefresh;
    procedure TaskLogShowingRefresh;
    procedure TaskLogButtonEnabled;

   protected
   public
     property FTP:TTGPuttySFTP  read GetFTP;

     //destructor Destroy; override;
     procedure Execute; override;
   end;

  function Start(AConnection: TFDConnection):boolean;


  var isStopParse: Boolean = False;

implementation

uses uSqlList, uUtilsRegistry, Settings_U, uMainForm, MTLogger, uDataModule, adAppUtils, TaskLog_U, csvparser;

function Start(AConnection: TFDConnection): boolean;
  var ThreadBegin:TTask;
begin

  if (regLoad('FTPServer')='') or
     (regLoad('FTPLogin')='') or
     (regLoad('FTPPass')='') or
     (regLoad('FTPPort')='') or

     (regLoad('Server')='') or
     (regLoad('Base')='') or
     (regLoad('User')='') or
     (regLoad('Password')='')
  then
  begin
    Exit;
  end;

  ThreadBegin:=TTask.Create(True);
  ThreadBegin.FreeOnTerminate := true; // Экземпляр должен само уничтожиться после выполнения
  ThreadBegin.Priority:=tThreadPriority.tpNormal; // Выставляем приоритет потока
  ThreadBegin.Connection := AConnection;
  ThreadBegin.Resume; // непосредственно ручной запуск потока
end;


{ TTask }

procedure TTask.LoadCsv(AFileName: String; DownloadFileID: integer);
var ParseCsv: TCSVParser;
    I : Integer;
    Query: TFDQuery;

    function GetValues(ASField: string): string;
    begin
      try
        result:=ParseCsv.FieldByName[ASField];
      except
        result:='';
      end;
    end;

begin
  ParseCsv := TCSVParser.Create;
  ParseCsv.SetDelimeter := ';';

  Query:= TFDQuery.Create(nil);
  Query.Connection :=FConnection;

  Query.SQL.Text :=  '''
  INSERT INTO [tInvoice]
         ([Account_Nr],[OriginCountry],[InvoiceDate],[InvoiceNr],[CountryCode],[Name_1],[City],[Postcode],[DestStn],[DestCountry],[Prod],[PuDate],
          [Identcode],[ShippersReference],[Pcs],[VolWgt],[Wgt],[Wgt_Abr],[ChargeAmount],[ExtraChargeAmount],[VAT],[Total],[Discrepancy],[TotalinclFinanceCosts],
          CreditNoteDate, CreditNote, DownloadFileID)
   select :Account_Nr,:OriginCountry,:InvoiceDate,:InvoiceNr,:CountryCode,:Name_1,:City,:Postcode,:DestStn,:DestCountry,:Prod,:PuDate,
          :Identcode,:ShippersReference,:Pcs,:VolWgt,:Wgt,:Wgt_Abr,:ChargeAmount,:ExtraChargeAmount,:VAT,:Total,:Discrepancy,:TotalinclFinanceCosts,
          :CreditNoteDate, :CreditNote, :DownloadFileID
  ''';

  try
    ParseCsv.SetDataFile := AFileName;
    ParseCsv.Open;


    while not ParseCsv.Eof do
    begin

        logger.Info(ParseCsv.RowCount.ToString);
        if ParseCsv.FieldByName['Origin Country'] <> 'Total' then
        begin
          Query.ParamByName('Account_Nr').Value   := GetValues('Account_Nr');
          Query.ParamByName('OriginCountry').Value:= GetValues('Origin Country');
          Query.ParamByName('CreditNoteDate').Value:= GetValues('Credit note Date');
          Query.ParamByName('CreditNote').Value   := GetValues('Credit note');
          Query.ParamByName('InvoiceDate').Value  := GetValues('Invoice Date');
          Query.ParamByName('InvoiceNr').Value    := GetValues('Invoice Nr');
          Query.ParamByName('CountryCode').Value  := GetValues('Country Code');
          Query.ParamByName('Name_1').Value       := GetValues('Name_1');
          Query.ParamByName('City').Value         := GetValues('City');
          Query.ParamByName('Postcode').Value     := GetValues('Postcode');
          Query.ParamByName('DestStn').Value      := GetValues('Dest Stn');
          Query.ParamByName('DestCountry').Value          := GetValues('Dest Country');
          Query.ParamByName('Prod').Value                 := GetValues('Prod');
          Query.ParamByName('PuDate').Value               := GetValues('Pu Date');
          Query.ParamByName('Identcode').Value            := GetValues('Identcode');
          Query.ParamByName('ShippersReference').Value    := GetValues('Shippers Reference');
          Query.ParamByName('Pcs').Value                  := GetValues('Pcs');
          Query.ParamByName('VolWgt').Value               := GetValues('VolWgt');
          Query.ParamByName('Wgt').Value                  := GetValues('Wgt');
          Query.ParamByName('Wgt_Abr').Value              := GetValues('Wgt_Abr');
          Query.ParamByName('ChargeAmount').Value         := GetValues('Charge Amount');
          Query.ParamByName('ExtraChargeAmount').Value    := GetValues('Extra Charge Amount');
          Query.ParamByName('VAT').Value                  := GetValues('VAT');
          Query.ParamByName('Total').Value                := GetValues('Total');
          Query.ParamByName('Discrepancy').Value          := GetValues('Discrepancy');
          Query.ParamByName('TotalinclFinanceCosts').Value:= GetValues('Total incl. Finance Costs');
          Query.ParamByName('DownloadFileID').Value:= DownloadFileID;

          Query.ExecSQL;
        end;

      ParseCsv.Next;
    end;

  finally
    if Assigned(ParseCsv) then  FreeAndNil(ParseCsv);
    if Assigned(Query) then  FreeAndNil(Query);
  end;
end;

procedure TTask.Execute;
begin
  inherited;
  isStopParse := False;

  DownloadFiles;
end;

procedure TTask.TaskLogRefresh;
begin
  try
    TaskLog_F.LogQuery.Active:=false;
    TaskLog_F.LogQuery.Active:=true;
  finally
  end;
end;

procedure TTask.TaskLogShowingRefresh;
begin
  try
    if MainForm.tsLog.Showing then
    begin
      TaskLog_F.LogQuery.Refresh;
     // TaskLog_F.LogQuery.Active:=true;
    end
  finally
  end;
end;

function TTask.VerifyHostKeyCallback(const host: PAnsiChar; const port: Integer;
  const fingerprint: PAnsiChar; const verificationstatus: Integer;
  var storehostkey: Boolean): Boolean;
begin
  if verificationstatus=0 then
  begin
     Result:=true;
     Exit;
  end;
  Result:=Application.MessageBox(PWideChar(WideString(
                'Please confirm the SSH host key fingerprint for '+Utf8ToString(AnsiString(host))+
                ', port '+IntToStr(port)+':'+sLineBreak+
                Utf8ToString(AnsiString(fingerprint)))),
                'Server Verification',
                MB_YESNO or MB_ICONQUESTION) = IDYES;
  storehostkey:=Result;
end;

function TTask.FTPConnect(): Boolean;
begin
  logger.Info('TTask.FTPConnect Begin');
  Result := False;
  try
    try
      with FTP do
      begin
        HostName:=Utf8Encode(regLoad('FTPServer'));
        UserName:=Utf8Encode(regLoad('FTPLogin'));
        Password:=Utf8Encode(regLoad('FTPPass'));
        Port    :=StrToIntDef(regLoad('FTPPort'), 22);

        Connect;
        ChangeDir(Utf8Encode('/prod/out/invoice'));
      end;
      if FTP.Connected then
      begin
        logger.Info('Connected');

        FFileList.Clear;

        Result:=True;
      end;
    except
      on E: Exception do
      begin
        logger.Info(E.Message);
        TaskLogInsert('err', E.Message);
      end;
    end;
  finally
    logger.Info('TTask.FTPConnect End');
  end;
end;

function TTask.GetFTP: TTGPuttySFTP;
begin
  if not Assigned(FFTP) then
  begin
    FFTP:=TTGPuttySFTP.Create(true);
    FFTP.OnListing:=ListingCallback;
    FFTP.OnMessage:=MessageCallback;
    FFTP.OnProgress:=ProgressCallback;
    FFTP.OnGetInput:=GetInputCallback;
    FFTP.OnVerifyHostKey:=VerifyHostKeyCallback;
  end;
  if not Assigned(FFileList) then
  begin
    FFileList := TStringList.Create;
  end;

  result:=FFTP;
end;

function TTask.GetInputCallback(var cancel: Boolean): AnsiString;
begin
  Result:='';
  cancel:=false;
  logger.Info('Replying with empty line.')
end;

function TTask.ListingCallback(const names: Pfxp_names): Boolean;
var  i: Integer;
begin
  for i:=0 to names.nnames-1 do
  begin
    if names.names[i].attrs.permissions and $F000 <> $4000 then
    begin
      logger.Info(Utf8ToString(names.names[i].filename));
      FFileList.Add(Utf8ToString(names.names[i].filename));
    end;
  end;
  Result:=true;
end;

procedure TTask.MessageCallback(const Msg: AnsiString; const isstderr: Boolean);
begin
  logger.Info(Msg);
end;

function TTask.ProgressCallback(const bytescopied: Int64; const isupload: Boolean): Boolean;
begin
  Application.ProcessMessages;
  Result:=true;
end;

procedure TTask.DownloadFiles;
var i:Integer;
    AFullFileName, AFileName:string;
    DownloadStream:TStream;
    APath:UnicodeString;
    Query: TFDQuery;
    ID: integer;
begin
  TaskLogInsert('i', 'Starten einer Aufgabe');


  if FTPConnect then
  begin
    Query:= TFDQuery.Create(nil);
    Query.Connection :=FConnection;
    try
      try
          FTP.ListDir('');

          APath := GetSpecialPath(regLoad('CSVPath'));
          if APath = '' then APath := TPath.GetTempPath();

          logger.Info(APath);

          logger.Info('Обработка CSV файлов');
          for i:=0 to FFileList.Count-1 do
          begin
            //Synchronize(TaskLogShowingRefresh);

            if isStopParse then
            begin
              TaskLogInsert('stop', 'Parsing abbrechen');
              Synchronize(TaskLogButtonEnabled);
              Terminate;
              Exit();
            end;

            if Terminated then begin Synchronize(TaskLogButtonEnabled); Exit(); end;

            AFileName  := FFileList[i];

            AFullFileName := APath +  AFileName;
            logger.Info('Начало обработки файла: ' +AFileName);
            logger.Info(AFullFileName);

            //try
              Query.SQL.Clear;
              Query.SQL.Text := 'Select 1 from tDownloadFile (nolock) where FileName = :FileName';
              Query.ParamByName('FileName').Value := AFileName;
              Query.Open;
              if Query.RecordCount > 0 then
              begin
                Query.Close;
                logger.Info('Файл обрабатывался ранее: ' +AFileName);

                Continue;
              end;
              Query.Close;

              TaskLogInsert('i', 'Beginn der Dateiverarbeitung: ' +AFileName);
              //Application.ProcessMessages;

              DownloadStream:=TFileStream.Create(AFullFileName,fmCreate);
              FTP.DownloadStream(Utf8Encode(AFileName), DownloadStream, false);
              DownloadStream.Free;


              TaskLogInsert('i', 'Download file: ' +AFileName);
              logger.Info('Скачали файл: ' +AFileName);

              ID := FileNameInsert('tDownloadFile', AFileName);
              LoadCsv(AFullFileName, ID);

              TaskLogInsert('i', 'Upload to database, file: ' +AFileName);

            // удаление данных с фтп
            if regLoad('DeleteCSVFileInFTP')='True' then
            begin
              FTP.DeleteFile(Utf8Encode(AFileName));
              TaskLogInsert('ok', AFileName + ' - Datei vom FTP gelöscht');
              logger.Info(AFileName + '- Удалили файл с FTP');
            end;

            // удаление данных с диска
            if (APath = '') and (FileExists(AFullFileName)) then
            begin
              if DeleteFile(AFullFileName) then
              begin
                logger.Info(AFileName + '- Удалили файл с диска');
              end;
            end;
            TaskLogInsert('ok', 'Hochgeladene Datei: ' +AFileName);
          end;


          // Обработка PDF файлов
          FFileList.Clear;
          FTP.ChangeDir(Utf8Encode('/prod/out/invoice_pdf'));
          FTP.ListDir('');
          APath := GetSpecialPath(regLoad('PDFPath'));
          logger.Info(APath);
          logger.Info('Обработка PDF файлов');

          if FFileList.Count= 0 then
            logger.Info('На FTP нет PDF файлов');

          for i:=0 to FFileList.Count-1 do //
          begin
            if isStopParse then
            begin
              TaskLogInsert('stop', 'Parsing abbrechen');
              Synchronize(TaskLogButtonEnabled);
              Terminate;
              Exit();
            end;

            if Terminated then begin Synchronize(TaskLogButtonEnabled); Exit(); end;

            AFileName  := FFileList[i];

            AFullFileName := APath +  AFileName;
            logger.Info(AFileName + ' - Начало обработки файла');

            Query.SQL.Clear;
            Query.SQL.Text := 'Select 1 from tDownloadPdf (nolock) where FileName = :FileName';
            Query.ParamByName('FileName').Value := AFileName;
            Query.Open;

            if Query.RecordCount > 0 then
            begin
              Query.Close;
              logger.Info(AFileName + ' - Файл обрабатывался ранее');
              Continue;
            end;
            Query.Close;

            TaskLogInsert('i', AFileName + ' - Beginn der Dateiverarbeitung');

            Application.ProcessMessages;

            DownloadStream:=TFileStream.Create(AFullFileName,fmCreate);
            FTP.DownloadStream(Utf8Encode(AFileName), DownloadStream, false);
            DownloadStream.Free;

            FileNameInsert('tDownloadPdf', AFileName);

            TaskLogInsert('ok', AFileName + ' - Datei heruntergeladen');

            logger.Info(AFileName + '- Скачали файл');

            // удаление данных с фтп
            if regLoad('DeleteFileInFTP')='True' then
            begin
              FTP.DeleteFile(Utf8Encode(AFileName));
              TaskLogInsert('ok', AFileName + ' - Datei vom FTP gelöscht');
              logger.Info(AFileName + '- Удалили файл с FTP');
            end;

            // удаление данных с файла
            if (APath = '') and (FileExists(AFullFileName)) then
            begin
              if DeleteFile(AFullFileName) then
              begin
                logger.Info(AFileName + '- Удалили файл с диска');
              end;
            end;
          end;

      except
        on E: Exception do
        begin
          logger.Info(E.Message);
          TaskLogInsert('error', E.Message);
        end;
      end;

    finally

      if Assigned(Query) then freeandnil(Query);
      if Assigned(ftp) then freeandnil(ftp);

      logger.Info('Завершение');
      TaskLogInsert('i', 'Fertigstellung');
      isStopParse := False;
      Synchronize(TaskLogButtonEnabled);
      Synchronize(TaskLogRefresh);
    end;
  end;
end;

procedure TTask.TaskLogButtonEnabled;
begin
  Settings_F.btnExecute.Enabled := True;
  Settings_F.btnParseStop.Enabled := False;
  Application.ProcessMessages;
end;

procedure TTask.TaskLogInsert(mType, mText: string);
var QueryLog: TFDQuery;
begin
  try
    QueryLog:= TFDQuery.Create(nil);
    QueryLog.Connection :=FConnection;
    QueryLog.SQL.Text:='INSERT INTO tTaskLog ([MessageType], [MessageText]) VALUES (:MessageType, :MessageText)';
    QueryLog.ParamByName('MessageType').Value:=mType;
    QueryLog.ParamByName('MessageText').Value:=mText;
    QueryLog.ExecSQL();
    QueryLog.Close;

    Application.ProcessMessages;
    Synchronize(TaskLogShowingRefresh);

  finally
    freeandnil(QueryLog);
  end;
end;

procedure TTask.SetConnection(const Value: TFDConnection);
begin
  FConnection := Value;
end;

function TTask.FileNameInsert(ATableName: string; AFileName: string): Integer;
var Query: TFDQuery;
begin
  if FConnection.Connected then
  begin
      try
        Query:= TFDQuery.Create(nil);
        Query.Connection :=FConnection;
        Query.SQL.Text:= '''
        DECLARE @ID TABLE (ID NUMERIC(18, 0));

        insert
               !ATableName
               (FileName)
        OUTPUT INSERTED.ID INTO @ID(ID)
        select :FileName;

        select top 1 ID from @ID;

        ''';

        Query.MacroByName('ATableName').Value:=ATableName;
        Query.ParamByName('FileName').asString:=AFileName;
        Query.Prepare();
        Query.Open();
        Result :=   Query.FieldByName('ID').AsInteger;

        Query.Close;
      finally
        freeandnil(Query);
      end;
  end;
end;

end.
