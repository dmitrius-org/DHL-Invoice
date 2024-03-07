unit Settings_U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, cxCheckBox,
  Vcl.ExtCtrls, cxGroupBox, Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit,
  cxSpinEdit, cxTimeEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel,
  Vcl.Menus, System.ImageList, Vcl.ImgList, cxImageList, Vcl.StdCtrls, cxButtons,

  DateUtils, IOUtils, cxButtonEdit, cxClasses, cxShellBrowserDialog;

type
  TSettings_F = class(TForm)
    cxGroupBox1: TcxGroupBox;
    Panel1: TPanel;
    cxGroupBox2: TcxGroupBox;
    cxGroupBox3: TcxGroupBox;
    cbTaskEnabled: TcxCheckBox;
    cxLabel2: TcxLabel;
    edtTime1: TcxTimeEdit;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    edtServer: TcxTextEdit;
    edtBase: TcxTextEdit;
    edtUser: TcxTextEdit;
    edtPas: TcxTextEdit;
    Panel2: TPanel;
    btnExecute: TcxButton;
    btnSave: TcxButton;
    cxImageList1: TcxImageList;
    Timer: TTimer;
    btnParseStop: TcxButton;
    btnTestConnect: TcxButton;
    cbOnLog: TcxCheckBox;
    btnTaskClear: TcxButton;
    GroupBox1: TGroupBox;
    edtFTPPass: TcxTextEdit;
    cxLabel8: TcxLabel;
    edtFTPLogin: TcxTextEdit;
    edtFTPServer: TcxTextEdit;
    lblFTPLogin: TcxLabel;
    cxLabel3: TcxLabel;
    er: TcxLabel;
    edtPort: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxShellBrowserDialog1: TcxShellBrowserDialog;
    PDFPath: TcxButtonEdit;
    cbDeleteFileInFTP: TcxCheckBox;
    cxLabel9: TcxLabel;
    CSVPath: TcxButtonEdit;
    cbDeleteCSVFileInFTP: TcxCheckBox;
    procedure btnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnTestConnectClick(Sender: TObject);
    procedure btnExecuteClick(Sender: TObject);
    procedure cbTaskEnabledClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure btnParseStopClick(Sender: TObject);
    procedure btnTaskClearClick(Sender: TObject);
    procedure PDFPathPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure CSVPathPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);

  private
    { Private declarations }

    procedure ConfigSave();
    procedure ConfigLoad();

    /// <summary>
    ///  OnTask - запуск задачи
    ///</summary>
    procedure OnTask(); //overload;

    procedure OnTimer();

    /// <summary>
    ///  SetNextOnDate - Установка следующей даты выполнения
    ///  ATask         - имя задачи. Например NextOnDate1
    ///</summary>
    procedure SetNextOnDate(ATask: String);

  public
    { Public declarations }
  end;

var
  Settings_F: TSettings_F;

implementation

{$R *.dfm}

uses uUtilsRegistry, uConnectionParam, uUtilsTask, MTLogger, csvparser;


procedure TSettings_F.btnExecuteClick(Sender: TObject);
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
    MessageDlg('Speichern Sie die Daten!',  TMsgDlgType.mtError, [mbOK], 0);

    Exit;
  end;

  btnExecute.Enabled := False;
  btnParseStop.Enabled := True;
  isStopParse := True;
  Start(tconn.Connection);
end;

procedure TSettings_F.btnParseStopClick(Sender: TObject);
begin
  btnParseStop.Enabled := False;
  isStopParse := True;
end;

procedure TSettings_F.btnSaveClick(Sender: TObject);
begin
  ConfigSave
end;

procedure TSettings_F.ConfigSave;
begin
  regSave('TaskEnabled', cbTaskEnabled.Checked);
  regSave('Time1',     edtTime1.Text);

  regSave('Server',    edtServer.Text);
  regSave('Base',      edtBase.Text);
  regSave('User',      edtUser.Text);
  regSave('Password',  edtPas.Text);

  regSave('FTPServer', edtFTPServer.Text);
  regSave('FTPLogin',  edtFTPLogin.Text);
  regSave('FTPPass',   edtFTPPass.Text);
  regSave('FTPPort',   edtPort.Text);

  regSave('OnLog', cbOnLog.Checked);
  regsave('NextOnDate1', Trunc(now()));

  regSave('PDFPath', PDFPath.Text);
  regSave('DeleteFileInFTP', cbDeleteFileInFTP.Checked);

  regSave('CSVPath', CSVPath.Text);
  regSave('DeleteCSVFileInFTP', cbDeleteCSVFileInFTP.Checked);

  logger.isActive := cbOnLog.Checked;

  MessageDlg('Vorgang abgeschlossen!',  TMsgDlgType.mtInformation, [mbOK], 0);
end;

procedure TSettings_F.CSVPathPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  if cxShellBrowserDialog1.execute then
  Begin
    CSVPath.Text:= cxShellBrowserDialog1.Path;
  End;
end;

procedure TSettings_F.FormShow(Sender: TObject);
begin
  ConfigLoad;
  btnParseStop.Enabled := False;
end;

procedure TSettings_F.OnTask();
var OnDate:string;
    OnTime:string;
begin
  if cbTaskEnabled.Checked then
  begin

    if regLoad('TaskEnabled')='True' then
    begin
      OnDate :=regLoad('NextOnDate1');
      OnTime :=regLoad('Time1');

      if OnTime<> '' then
      begin
        logger.Info(DateTimeToText((StrToFloat(OnDate)) + Frac(strtoTime(OnTime))));
        logger.Info(now().ToString());

        if OnDate <> '' then
        begin
          if Trunc(StrToFloat(OnDate)) + Frac(strtoTime(OnTime))  <= now() then
          begin
            logger.Info('Start');

            Start(tconn.Connection);

            SetNextOnDate('NextOnDate1');
          end;
        end;

      end;

    end;

  end;
end;

procedure TSettings_F.SetNextOnDate(ATask: String);
var dateTime: TDateTime;
begin
  if regload(ATask) = '' then
  begin
    regsave(ATask, Trunc(Now()));
  end
  else
  begin
    regsave(ATask, Trunc(Tomorrow()));
  end;
end;

procedure TSettings_F.OnTimer;
begin
  Timer.Enabled := regLoad('TaskEnabled') ='True';
end;

procedure TSettings_F.PDFPathPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  if cxShellBrowserDialog1.execute then
  Begin
    PDFPath.Text:= cxShellBrowserDialog1.Path;
  End;
end;

procedure TSettings_F.TimerTimer(Sender: TObject);
begin
  OnTask;
end;

procedure TSettings_F.btnTaskClearClick(Sender: TObject);
begin
  regsave('NextOnDate1', Trunc(now()));
end;

procedure TSettings_F.btnTestConnectClick(Sender: TObject);
begin
  if ((edtServer.Text='') or (edtBase.Text='') or (edtUser.Text='')  or (edtPas.Text='')) then
  begin
    MessageDlg('Füllen Sie alle Felder aus!',  mtWarning, [mbOK], 0);
    exit;
  end;

  if TConn.DbConnect2(edtServer.Text, edtBase.text, edtUser.Text, edtPas.Text) then
  begin
    MessageDlg('Datenbankverbindung: fertig',  TMsgDlgType.mtInformation, [mbOK], 0);
  end;
end;

procedure TSettings_F.cbTaskEnabledClick(Sender: TObject);
begin
  regSave('TaskEnabled', cbTaskEnabled.Checked);

  OnTimer;
end;

procedure TSettings_F.ConfigLoad;
begin
  cbTaskEnabled.Checked := regLoad('TaskEnabled') = 'True';

  edtTime1.text:= regLoad('Time1');

  edtServer.Text := regLoad('Server');
  if regLoad('Base') = '' then
    edtBase.Text := 'DHLInvoiceDB'
  else
    edtBase.Text    := regLoad('Base');

  edtUser.Text      := regLoad('User');
  edtPas.Text       := regLoad('Password');
  edtFTPServer.Text := regLoad('FTPServer');
  edtFTPLogin.Text  := regLoad('FTPLogin');
  edtFTPPass.Text   := regLoad('FTPPass');
  edtPort.Text      := regLoad('FTPPort');
  PDFPath.Text      := regLoad('PDFPath');
  cbOnLog.Checked   := regLoad('OnLog')='True';
  cbDeleteFileInFTP.Checked   := regLoad('DeleteFileInFTP')='True';

  CSVPath.Text      := regLoad('CSVPath');
  cbDeleteCSVFileInFTP.Checked   := regLoad('DeleteCSVFileInFTP')='True';

  OnTimer;
end;

end.
